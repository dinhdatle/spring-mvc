package vn.datle.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.datle.laptopshop.domain.Product;
import vn.datle.laptopshop.domain.User;
import vn.datle.laptopshop.service.ProductService;
import vn.datle.laptopshop.service.UploadService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ProductController {
    private final UploadService uploadService;
    private final ProductService productService;

    public ProductController(UploadService uploadService, ProductService productService) {
        this.uploadService = uploadService;
        this.productService = productService;
    }

    @GetMapping("/admin/product")
    public String getProductPage(Model model) {
        model.addAttribute("products", productService.getAllProducts());
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreatePage(Model model) {
        model.addAttribute("product", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(@ModelAttribute @Valid Product product, BindingResult result,
            @RequestParam("avatar1") MultipartFile file, Model model) {

        if (result.hasErrors()) {
            model.addAttribute("product", product);
            model.addAttribute("errors", result);
            return "admin/product/create";
        }
        String productImg = uploadService.hanldeFileUpload(file, "product");
        product.setImage(productImg);
        productService.saveProduct(product);
        return "redirect:/admin/product";
    }

    @PostMapping("/admin/product/delete/{id}")
    public String postDeleteProduct(@PathVariable long id) {
        productService.deleteProductById(id);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetail(@PathVariable long id, Model model) {
        model.addAttribute("product", productService.getProductById(id));
        return "/admin/product/detail";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(@PathVariable Long id, Model model) {
        model.addAttribute("product", productService.getProductById(id));
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String postUpdateProduct(@ModelAttribute @Valid Product product, BindingResult result,
            @RequestParam("imageFile") MultipartFile file, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("product", product);
            model.addAttribute("errors", result); // Đảm bảo errors có mặt trong model
            return "admin/product/update";
        }
        Product currentProduct = productService.getProductById(product.getId());
        System.out.println("currentProduct: " + product.getId());
        if (!file.isEmpty()) {
            String productImg = uploadService.hanldeFileUpload(file, "product");
            currentProduct.setImage(productImg);
        }
        currentProduct.setName(product.getName());
        currentProduct.setPrice(product.getPrice());
        currentProduct.setQuantity(product.getQuantity());
        currentProduct.setDetailDesc(product.getDetailDesc());
        currentProduct.setShortDesc(product.getShortDesc());
        currentProduct.setFactory(product.getFactory());
        currentProduct.setTarget(product.getTarget());
        productService.saveProduct(currentProduct);

        return "redirect:/admin/product";
    }

}
