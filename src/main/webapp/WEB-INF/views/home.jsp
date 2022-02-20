<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mall</title>

    <!-- reset css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

    <!-- custom css -->
    <link rel="stylesheet" href="css/main.css">

</head>

<body>
    <div class="wrap">
        <!-- header -->
        <header>
            <div class="inner-header">
                <h1 class="logo">
                    <a href="#">
                        <img src="/Title_ex.png" alt="메인 로고 이미지">
                    </a>
                </h1>

                <!-- 메인 네비게이션바 -->
                <nav class="gnb">
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Shop</a></li>
                        <li><a href="#">Pages</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </nav>

                <!-- 검색/찜/장바구니 -->
                <nav class="tnb">
                    <ul>
                        <li>
                            <form action="/search" class="searchss">
                                <label>
                                    <span class="lnr lnr-magnifier"></span>
                                    <input type="text" placeholder="검색어를 입력하세요" id="search">
                                    <i class="fas fa-search"></i>
                                </label>
                            </form>
                        </li>
                        <li><a href="#"><i class="far fa-heart"></i></a></li>
                        <li><a href="#"><i class="fas fa-cart-plus"></i></a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <!-- //header -->



        <!-- section content container -->
        <section class="container">

            <!-- section content > main banner -->
            <!-- 메인 배너 자리 -->
            <section id="main-banner-container">
                <div class="main-banner-img">
                    <a href="#">
                        <img src="./image/banner1.png" alt="메인배너이미지1">
                        <div class="banner-text">
                            <p>Green Spring</p>
                        </div>
                    </a>
                </div>
                <div class="main-banner-img">
                    <a href="#">
                        <img src="./image/banner2.png" alt="메인배너이미지2">
                        <div class="banner-text">
                            <p>Hello, Kitchen</p>
                        </div>
                    </a>
                </div>
                <div class="click-next-pre">
                    <a href="#">Next</a>
                    <p>&nbsp;&nbsp;|&nbsp;&nbsp;</p>
                    <a href="#">Previous</a>
                </div>
            </section>
            <!-- //section content > main banner -->



            <!-- section content > category -->
            <!-- 카테고리 이미지 영역 -->
            <section id="category" class="common-style">
                <div class="section-title">Category</div>
                <div class="products">
                    <div class="category-link">
                        <span>Cutlery</span>
                        <img src="http://via.placeholder.com/200" alt="카테고리1">
                    </div>
                    <div class="category-link">
                        <span>Bowl</span>
                        <img src="http://via.placeholder.com/200" alt="카테고리2">
                    </div>
                    <div class="category-link">
                        <span>Fry pan</span>
                        <img src="http://via.placeholder.com/200" alt="카테고리3">
                    </div>
                    <div class="category-link">
                        <span>Plate</span>
                        <img src="http://via.placeholder.com/200" alt="카테고리4">
                    </div>
                </div>
            </section>
            <!-- //section content > category -->



            <!-- section content > new product -->
            <!-- 새 상품 정렬 (8개 상품 2줄로 노출) -->
            <section id="new-products" class="common-style">
                <div class="section-title">New Products</div>
                <div class="products">
                    <div class="click-more">
                        <a href="#">Next</a> | <a href="#">Previous</a>
                    </div>
                    <ul>
                        <li>
                            <a href="#">
                                <img src="http://via.placeholder.com/100" alt="상품1">
                                <div>product1</div>
                                <div>$00.0</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="http://via.placeholder.com/100" alt="상품2">
                                <div>product2</div>
                                <div>$00.0</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="http://via.placeholder.com/100" alt="상품3">
                                <div>product3</div>
                                <div>$00.0</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="http://via.placeholder.com/100" alt="상품4">
                                <div>product4</div>
                                <div>$00.0</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="http://via.placeholder.com/100" alt="상품5">
                                <div>product5</div>
                                <div>$00.0</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="http://via.placeholder.com/100" alt="상품6">
                                <div>product6</div>
                                <div>$00.0</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="http://via.placeholder.com/100" alt="상품7">
                                <div>product7</div>
                                <div>$00.0</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="http://via.placeholder.com/100" alt="상품8">
                                <div>product8</div>
                                <div>$00.0</div>
                            </a>
                        </li>
                    </ul>

                </div>
            </section>
            <!-- //section content > new product -->



            <!-- section content > best product -->
            <!-- 베스트 상품 정렬 (4개상품 한 줄로 노출) -->
            <section id="best-products" class="common-style">
                <div class="section-title">Best Products</div>
                <div class="products">
                    <div class="click-more">
                        <a href="#">Next</a> | <a href="#">Previous</a>
                    </div>
                    <ul>
                        <li>
                            <a href="#">
                                <img src="http://via.placeholder.com/100" alt="상품1">
                                <div>product1</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="http://via.placeholder.com/100" alt="상품2">
                                <div>product2</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="http://via.placeholder.com/100" alt="상품3">
                                <div>product3</div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="http://via.placeholder.com/100" alt="상품4">
                                <div>product4</div>
                                <div>$00.0</div>
                            </a>
                        </li>

                    </ul>

                </div>
            </section>
            <!-- //section content > best product -->


            <!-- section content > labels -->
            <ul>
                <li><img src="http://via.placeholder.com/200" alt=""></li>
                <li><img src="http://via.placeholder.com/200" alt=""></li>
                <li><img src="http://via.placeholder.com/200" alt=""></li>
                <li><img src="http://via.placeholder.com/200" alt=""></li>
                <li><img src="http://via.placeholder.com/200" alt=""></li>
                <li><img src="http://via.placeholder.com/200" alt=""></li>
                <li><img src="http://via.placeholder.com/200" alt=""></li>
                <li><img src="http://via.placeholder.com/200" alt=""></li>
            </ul>
            <!-- //section content > labels -->
        </section>
        <!-- //section content container -->




        <!-- footer -->
        <footer>
            <ul>
                <li>ABOUT US</li>
                <li>Copyright ⓒ2022 All rights reserved</li>
            </ul>
        </footer>
        <!-- //footer -->
    </div>
</body>

</html>