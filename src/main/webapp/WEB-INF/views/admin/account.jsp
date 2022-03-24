<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <title>상품 등록</title>

  </head>

<body>

  
    <h1>관리자 등록하기</h1>
   
   <form action="/admin/insert" method="post" autocomplete="off" enctype="multipart/form-data">
      
    <p>
        <label>
            # 상품명  : <input type="text" name="prName">
        </label>
    </p>
        

    <p>
        <label>
            # 카테고리 번호  : <input type="text" name="cateCode">
           
            <br>
            1 - tableware, 2 - 프라이팬, 3 - 컵, 4 - 접시

        </label>
        
    </p>


    <p>   
        <label>
            # 상품 가격  : <input type="text" name="prPrice"  >
        </label>
       
    </p> 

    <p>
        <label>
            # 판매여부  : <input type="text" name="prYn"  >
        </label>
       
    </p>

    <p>
        <label>
            # 상품수량 : <input type="text" name="prAmount" >
        </label>
        
    </p>

    <p>
        <label>
            # 상품썸네일 : <input type="file" name="file" >
           
        </label>
       
    </p>

 
  

    <p>
        <label>
          <input type="submit" value="등록하기" onclick="location.href='list.jsp'">
        </label>
    </p>

    
    </form>

    


</body>
</html>