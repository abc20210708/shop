<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
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
</head>
<body>

    <h1>상품 등록하기 </h1>

   <form action="/product/write" method="post" autocomplete="off">
        <label>
            # 상품  : <input type="text" name="id">
        </label>
        <label>
            # 비밀번호 : <input type="password" name="pw">
        </label>
        <label>
            <button type="submit">로그인</button>
        </label>
    </form>

</body>
</html>