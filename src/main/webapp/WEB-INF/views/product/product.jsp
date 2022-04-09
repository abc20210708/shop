<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mall</title>



</head>

<body>


    <h1>
        ${loginCustomer.csName} 님
    </h1>

    <nav class="gnb">
        <ul>
            <li><a href="/customer/loginHome">홈으로</a></li>
            <li><a href="/customer/info">마이페이지</a></li>
            <li><a href="/customer/logout">회원 로그아웃</a></li>
        </ul>
    </nav>

    <c:forEach var="a" items="${articles}">

        <div>
           # 상품번호 <p>${a.prCode}</p>
        </div>


        <p>
            <label>
                # 상품명 : <input type="text" value="${a.prName}">
            </label>
        </p>


        <p>
            <label>
                # 상품 가격 : <input type="text" value="${a.prPrice}">
            </label>

        </p>


        <p>
            <label>

                #상품썸네일: <input type="text" value="${a.prThumb}">

                <a href="/product/info?prCode=${a.prCode}" id="item"  >
                    <!-- onclick="return false;" -->
                    <img src="/product/list/${a.prThumb}" width="300" height="300" referrerpolicy="no-referrer" />

                </a>
            </label>

        </p>


    </c:forEach>

       


    <script>
        //상세보기 요청 이벤트
        /* const $product = document.querySelector("#item");
        $product.addEventListener('click', e => {

            e.preventDefault();

            let num = e.target.parentElement.parentElement.parentElement.
            previousElementSibling.previousElementSibling.previousElementSibling.
            lastElementChild.textContent;
            
            console.log(e.target.parentElement.parentElement.parentElement.
            previousElementSibling.previousElementSibling.previousElementSibling.
            lastElementChild.textContent);

            location.href = '/product/info?prCode=' + num;
        });*/
    </script>


</body>

</html>