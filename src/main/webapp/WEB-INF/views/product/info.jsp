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
        상품 번호 ${p.prCode}번 
        </h1>

        <nav class="gnb">
            <ul>
                <li><a href="/">홈으로</a></li>
                <li><a href="/customer/info">마이페이지</a></li>
                <li><a href="/customer/logout">회원 로그아웃</a></li>
            </ul>
        </nav>  


            <p>
                <label>
                    # 상품명  : <input type="text" value="${p.prName}"  >
                </label>
            </p>
                

            <p>
                <label>
                    # 카테고리 번호  : <input type="text" value="${p.cateCode}">
                
                    <br>
                    1 - tableware, 2 - 프라이팬, 3 - 컵, 4 - 접시

                </label>
                
            </p>


            <p>   
                <label>
                    # 상품 가격  : <input type="text"  value="${p.prPrice}" >
                </label>
            
            </p> 

            <p>
                <label>
                    # 판매여부  : <input type="text" value="${p.prYn}"  >
                </label>
            
            </p>

            <p>
                <label>
                    # 상품수량 : <input type="text"  value="${p.prAmount}" >
                </label>
                
            </p>

            <p>
                <label>

                #상품썸네일: <input type="text"  value="${p.prThumb}" >
            
                <a href="">
                    <img src="/product/list/${p.prThumb}" width="300" height="300" referrerpolicy="no-referrer" />
                
                </a>
                </label>
            
            </p>

            <p>
                <label>

                #상품이미지1 : <input type="text"  value="${p.prImg1}" >
            
                <a href="">
                    <img src="/product/list/${p.prImg1}" width="300" height="300" referrerpolicy="no-referrer" />
                
                </a>
                </label>
            
            </p>

            <p>
                <label>

                #상품이미지2 : <input type="text"  value="${p.prImg2}" >
            
                <a href="">
                    <img src="/product/list/${p.prImg2}" width="300" height="300" referrerpolicy="no-referrer" />
                
                </a>
                </label>
            
            </p>

            
            <p>
                <label>

                #상품이미지3 : <input type="text"  value="${p.prImg3}" >
            
                <a href="">
                    <img src="/product/list/${p.prImg3}" width="300" height="300" referrerpolicy="no-referrer" />
                
                </a>
                </label>
            
            </p>

            
            <p>
                <label>

                #상품이미지4 : <input type="text"  value="${p.prImg4}" >
            
                <a href="">
                    <img src="/product/list/${p.prImg4}" width="300" height="300" referrerpolicy="no-referrer" />
                
                </a>
                </label>
            
            </p>
            
            <p>
                <label>

                #상품이미지5 : <input type="text"  value="${p.prImg5}" >
            
                <a href="">
                    <img src="/product/list/${p.prImg5}" width="300" height="300" referrerpolicy="no-referrer" />
                
                </a>
                </label>
            
            </p>
            

        <form action="/cart/add" method="post">

            <input type="hidden" name="prCode" value="${p.prCode}">    
            <input type="hidden" name="csId" value=" ${loginCustomer.csId}">    
               
           
                    <select name="cartAmount">
                        <option selected>수량을 선택하세요</option>
                        <option value="1"> 1</option>
                        <option value="2"> 2</option>
                        <option value="3"> 3</option>
                        <option value="4"> 4</option>
                        <option value="5"> 5</option>
                        <option value="6"> 6</option>
                        <option value="7"> 7</option>
                        <option value="8"> 8</option>
                    </select>

                    <input type="submit" value="장바구니" class="cartBtn">      
        </form>
    



    <script>
    

    </script>


</body>
</html>