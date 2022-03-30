<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
   
   <form action="/admin/login" method="post" autocomplete="off">
    
  
    
                
      
         
           
     

     
            <p>
                <label>
                    # 관리자 아이디  : <input type="text" name="adminId">
                </label>
            </p>
                
        
            <p>
                <label>
                    # 관리자 비밀번호  : <input type="password" name="adminPw">
        
                </label>
                
            </p>
            <button type="submit">로그인</button>
      
    
       
    
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