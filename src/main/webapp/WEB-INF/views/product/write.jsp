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
      <link rel="stylesheet" href="/css/main.css">

  </head>

<body>

    <h1>상품 등록하기 </h1>

   <form action="/product/write" method="post" autocomplete="off" enctype="multipart/form-data">
      
        <label>
            # 상품명  : <input type="text" name="prName">
        </label>
        <br>

        
        <label>
            # 상품 가격  : <input type="text" name="prPrice"  >
        </label>
        <br>

        <label>
            # 판매여부  : <input type="text" name="prYn"  >
        </label>
        <br>


        <label>
            # 상품수량 : <input type="text" name="prAmount"  >
        </label>
        <br>


        <label>
            # 상품썸네일 : <input type="file" name="prThumb" id=thumbFileOpenInput" accept="image/png, image/jpeg" multiple >
        </label>
        <br>

       
        <label>
            # 상품이미지 : <input type="file" name="prImg" id=imageFileOpenInput" accept="image/png, image/jpeg" multiple >
        </label>
        <br>

        <label>
            <button type="submit">상품 등록</button>
        </label>
       
    </form>




</body>
</html>