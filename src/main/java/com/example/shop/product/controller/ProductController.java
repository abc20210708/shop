package com.example.shop.product.controller;

import com.example.shop.product.domain.Product;
import com.example.shop.product.service.ProductService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

@Controller
@Log4j2
@RequestMapping("/product")
@RequiredArgsConstructor
public class ProductController {

    /**
     * 상품 목록요청: /product/list: GET
     * 상품 상세조회요청: /product/content: GET
     * 상품 등록 화면요청: /product/write: GET
     * 상품 등록요청: /product/write: POST
     * 상품 삭제요청: /product/delete: GET
     * 상품 수정 화면요청: /product/modify: GET
     * 상품 수정 요청: /product/modify: POST
     */

    private final ProductService productService;

    private final String UPLOAD_DIR = "C:\\testImg\\here\\";

    @GetMapping("/list")
    public String list(Model model) {
        log.info("/product/list -- GET!");
        List<Product> productList = productService.getList();
        model.addAttribute("articles", productList);
        return "product/list";
    }

    //상품 등록 화면 요청
    @GetMapping("/write")
    public String write(HttpSession session) {
        log.info("/product/write - GET!");

        /*Product product = (Product) session.getAttribute("newProduct");
        if (product == null) {
            return "redirect:/home";
        }*/
        return "product/insert";
    }

    //상품 등록 요청
    @PostMapping("/write")
    public String write(@RequestParam("file") MultipartFile file, RedirectAttributes attributes) {



        // check if file is empty
        if (file.isEmpty()) {
            attributes.addFlashAttribute("message", "Please select a file to upload.");
            return "redirect:product/home";
        }

        // normalize the file path
        String fileName = StringUtils.cleanPath(file.getOriginalFilename());

        // save the file on the local file system
        try {
            Path path = Paths.get(UPLOAD_DIR + fileName);
            Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            e.printStackTrace();
        }

        // return success response
        attributes.addFlashAttribute("message", "업로드 성공 " + fileName + '!');

        return "redirect:product/list";
    }


}//
