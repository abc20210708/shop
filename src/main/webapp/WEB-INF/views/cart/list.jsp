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
        <div class="jumbotron">
        
            <hr class="my-4">
            <p>${loginCustomer.csName}님의 장바구니 페이지</p>
            <li><a href="/customer/logout">회원 로그아웃</a></li>
        </div>
        <h2>장바구니</h2>
        <hr>

    <div>

        <script src="http://code.jquery.com/jquery-latest.min.js"></script>

        <c:forEach var="c" items="${cart}">

        <input type="checkbox" name="cartChecked" value='1' id="input_check" checked/>
        <input type="hidden" name="cartChecked" value='0' id="input_check_hidden"/>
        <p>
            <label>
                # 카테고리 번호  : <input type="text" value="${c.cartCode}"  >
            </label>
        </p>
            

        <p>
            <label>
                # 회원아이디  : <input type="text" value="${c.csId}">
            
            </label>
            
        </p>


        <p>   
            <label>
                # 상품번호  : <input type="text"  value="${c.prCode}" >
            </label>
        
        </p> 


        <p>   
            <label>
                # 장바구니수량  : <input type="text"  value="${c.cartAmount}" >
            </label>
        
        </p> 
        </c:forEach>


        <c:forEach var="p" items="${product}">
            <label>

            
            #상품썸네일: <input type="text"  value="${p.prThumb}" >
        
                <img src="/product/list/${p.prThumb}" width="300" height="300" referrerpolicy="no-referrer" />
               
              
            </label>

                 <label>

                #상품가격: <input type="text"  value="${p.prPrice}" >
   
                </label>
        </c:forEach>

        <p>   
            <label>
                # 총금액  : <input type="text" name="" value="" >
            </label>
        
        </p> 

        <hr>


    </div>

    <script>

        

        $("[name=cartChecked]:checked").each(function() {
        var chk = $(this).val();
        console.log(chk);
        });

     
    
    </script>

</body>

</html>