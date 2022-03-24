<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <title>회원 로그인</title>

  </head>

<body>

  
    <h1>회원 로그인</h1>
   
   <form action="/customer/login" method="post" autocomplete="off" enctype="multipart/form-data">
      
    <p>
        <label>
            # 회원 아이디  : <input type="text" name="csId">
        </label>
    </p>
        

    <p>
        <label>
            # 회원 비밀번호  : <input type="password" name="csPw">

        </label>
        
    </p>


  

    <p>
        <label>
          <input type="submit" value="로그인">
        </label>
    </p>

    
    </form>

    <script>
        const flag = '${flag}';
        if (flag === 'NO_ID') {
            alert('회원가입된 아이디가 아닙니다!');
        } else if (flag === 'NO_PW') {
            alert('비밀번호가 틀렸습니다!');
        }
    </script>


</body>
</html>