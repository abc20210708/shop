package com.example.shop.product.controller;

import com.example.shop.customer.domain.Customer;
import com.example.shop.customer.service.CustomerService;
import com.example.shop.product.domain.Product;
import com.example.shop.product.service.ProductService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;


import java.io.File;
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

    private  final CustomerService customerService;


  //  private static String CURR_IMG_REPO_PATH = "C:\\testImg\\";


    //관리자가 상품등록 후 요청(화면)
    @GetMapping("/list")
    public String list(Model model)
            throws Exception {
        log.info("/product/list -- GET!");


        List<Product> productList = productService.getList();
        model.addAttribute("articles", productList);

        return "product/list";
    }

    //회원 로그인 후 상품목록 요청(화면)
    @GetMapping("/product")
    public String productList(Model model, HttpSession session)
            throws Exception {
        log.info("/product/product -- GET!");
        log.info(session.getAttribute("loginCustomer"));
        List<Product> productList = productService.getList();
        model.addAttribute("articles", productList);

        return "product/product";
    }

    //상품 등록 화면 요청(화면)
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
                             @RequestParam("files") MultipartFile[] files) throws Exception  {

        log.info("상픔 등록 요청 - POST!");


        //String uploadPath = request.getSession().getServletContext().getRealPath("/"); webapp

        String uploadPath = "C:\\testImg";

        String fileOriginName = "";

        for (int i = 0; i < files.length; i++) {
            fileOriginName = files[i].getOriginalFilename();
            log.info("기존 파일명: "+ fileOriginName);
            SimpleDateFormat formatter = new SimpleDateFormat("YYYYMMDD_HHMMSS_"+i);
            Calendar now = Calendar.getInstance();

            String fileMultiName = "";
            //확장자명
            String extension = fileOriginName.split("\\.")[1];

            //
            fileOriginName = formatter.format(now.getTime())+"."+extension;
            log.info("변경된 파일명 :" +fileOriginName);

            File f = new File(uploadPath+ "\\"+fileOriginName);
            files[i].transferTo(f);


            fileMultiName += fileOriginName;
            if (i==0) {
                product.setPrThumb(fileMultiName);
                } else if (i == 1 ) {
                product.setPrImg1(fileMultiName);
            } else if (i == 2 ) {
                product.setPrImg2(fileMultiName);
            } else if (i == 3 ) {
                product.setPrImg3(fileMultiName);
            }  else if (i == 4 ) {
                product.setPrImg4(fileMultiName);
            }  else if (i == 5 ) {
                product.setPrImg5(fileMultiName);
            }
            else {fileMultiName += ","+fileOriginName;}
            log.info("*"+fileMultiName);
        }


       // product.setPrThumb(fileMultiName);
        productService.write(product);
        log.info(product);
        //return "redirect:/product/list";
        return "redirect:/product/list";
    }

    //상품 상세 조회(화면)
    @GetMapping("/info")
    public String content(int prCode, Model model) {
        log.info("상세조회요청 - (화면)" + prCode);
        Product product = productService.get(prCode);
        model.addAttribute("p",product);
        return "product/info";
    }



}//
