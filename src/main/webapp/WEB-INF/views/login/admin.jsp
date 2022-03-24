<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <title>관리자 로그인</title>

  </head>

<body>

  
    <h1>관리자 로그인</h1>
   
   <form action="/admin/login" method="post" autocomplete="off" enctype="multipart/form-data">
      
    <p>
        <label>
            # 관리자 아이디  : <input type="text" name="prName">
        </label>
    </p>
        

    <p>
        <label>
            # 관리자 비밀번호  : <input type="password" name="cateCode">

        </label>
        
    </p>


  

    <p>
        <label>
          <input type="submit" value="로그인" onclick="location.href='list.jsp'">
        </label>
    </p>

    
    </form>

    


</body>
</html>