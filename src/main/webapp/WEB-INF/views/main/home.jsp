<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

  <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Mall</title>

    

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
                        <li><a href="/product/write">상품 등록하기</a></li>
                        <li><a href="/product/list">상품 목록</a></li>
                        <li><a href="/admin/list">회원 목록 조회</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="/admin/login">관리자 로그인</a></li>
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

</body>

</html>