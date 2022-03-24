<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <title>공지사항 등록</title>

  </head>

<body>

  
    <h1>공지사항 등록하기</h1>
   
   <form action="/admin/noticeInsert" method="post" autocomplete="off">
      
    
    <p>
        <label>
            # 공지사항 제목  : <input type="text" name="noticeTitle">
        
        </label>
        
    </p>


    <p>   
        <label>
            # 공지사항 내용  : <input type="text"  name="noticeContent" >
        </label>
    
    </p> 


    <p>   
        <label>
            # 공지사항 등록 관리자 아이디  : <input type="text"  name="adminId"  >
        </label>
    
    </p> 

  

    <p>
        <label>
          <input type="submit" value="등록하기" >
        </label>
    </p>

    
    </form>

    


</body>
</html>