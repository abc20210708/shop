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

   
    <h1> ${loginAdmin.adminName}님 업로드가 완료되었습니다. </h1>

    <c:forEach var="a" items="${articles}">
        <p>
            <label>
                # 상품명  : <input type="text" value="${a.prName}"  >
            </label>
        </p>
            

        <p>
            <label>
                # 카테고리 번호  : <input type="text" value="${a.cateCode}">
            
                <br>
                1 - tableware, 2 - 프라이팬, 3 - 컵, 4 - 접시

            </label>
            
        </p>


        <p>   
            <label>
                # 상품 가격  : <input type="text"  value="${a.prPrice}" >
            </label>
        
        </p> 

        <p>
            <label>
                # 판매여부  : <input type="text" value="${a.prYn}"  >
            </label>
        
        </p>

        <p>
            <label>
                # 상품수량 : <input type="text"  value="${a.prAmount}" >
            </label>
            
        </p>

        <p>
            <label>

            #상품썸네일: <input type="text"  value="${a.prThumb}" >
        
                <img src="/product/list/${a.prThumb}" width="300" height="300" referrerpolicy="no-referrer" />
               
              
            </label>
        
        </p>

  
    </c:forEach>
    
   

    <nav class="gnb">
        <ul>
            <li><a href="/">홈으로</a></li>
           
            <li><a href="/admin/logout">관리자 로그아웃</a></li>
        </ul>
    </nav>  

    <input type="button" value="로그인성공페이지" class="btn" onclick="location.href='/admin/login'">



    <script>
        
        
    </script>


</body>
</html>