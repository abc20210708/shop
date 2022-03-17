package com.example.shop.product.controller;

import com.example.shop.product.domain.Product;
import com.example.shop.product.service.ProductService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@Log4j2
@RequestMapping("/product")
@RequiredArgsConstructor
public class ProductController extends HttpServlet {

   /* public void doGet(HttpServletRequest request, HttpServletResponse response)
       throws ServletException, IOException {
        fileUpload(request,response);
    }*/


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

  //  private static String CURR_IMG_REPO_PATH = "C:\\testImg\\here";



    @GetMapping("/list")
    public String list(Model model) {
        log.info("/product/list -- GET!");
        List<Product> productList = productService.getList();
        model.addAttribute("articles", productList);
        return "product/list";
    }

    //상품 등록 화면 요청
    @GetMapping("/write")
    public String write() {
        log.info("/product/write - GET!");

        /*Product product = (Product) session.getAttribute("newProduct");
        if (product == null) {
            return "redirect:/home";
        }*/
        return "product/insert";
    }

    //상품 등록 요청 - POST!
    @PostMapping("/write")
    public String fileUpload(MultipartHttpServletRequest request,Product product,
                    @RequestParam("file") MultipartFile[] file) throws Exception  {

        log.info("상픔 등록 요청 - POST!");


        //String uploadPath = request.getSession().getServletContext().getRealPath("/"); webapp
        String uploadPath = "C:\\testImg";

        String fileOriginName = "";
        String fileMultiName = "";
        for (int i = 0; i < file.length; i++) {
            fileOriginName = file[i].getOriginalFilename();
            log.info("기존 파일명: "+ fileOriginName);
            SimpleDateFormat formatter = new SimpleDateFormat("YYYYMMDD_HHMMSS_"+i);
            Calendar now = Calendar.getInstance();

            //확장잠여
            String extension = fileOriginName.split("\\.")[1];

            //
            fileOriginName = formatter.format(now.getTime())+"."+extension;
            log.info("변경된 파일명 :" +fileOriginName);

            File f = new File(uploadPath+ "\\"+fileOriginName);
            file[i].transferTo(f);
            if (i==0) {fileMultiName += fileOriginName;}
            else {fileMultiName += ","+fileOriginName;}
        }

        log.info("*"+fileMultiName);
        product.setPrThumb(fileMultiName);
        productService.write(product);
        log.info(product);
        return "product/list";
    }


}//
