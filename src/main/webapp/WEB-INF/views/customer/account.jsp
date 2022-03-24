<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <title>회원가입</title>

  </head>

<body>

  
    <h1>회원가입</h1>
   
   <form action="/customer/account" method="post" autocomplete="off" enctype="multipart/form-data">
      
    <p>
        <label>
            # 회원아이디  : <input type="text" name="csId"  >
        </label>
      </p>
        

        <p>
            <label>
                # 회원 비밀번호  : <input type="password" name="csPw">
            
            </label>
            
        </p>


        <p>   
            <label>
                # 회원 이름  : <input type="text"  name="csName" >
            </label>
        
        </p> 

        <p>   
            <label>
                # 회원 성별  : <input type="text"  name="csGender" >
            </label>
        
        </p> 

        <p>   
            <label>
                # 연락처  : <input type="text"  name="csPhone" >
            </label>
        
        </p> 

        <p>   
            <label>
                # 우편번호  : <input type="text"  name="postCode" >
            </label>
        
        </p> 

        <p>   
            <label>
                # 도로명주소  : <input type="text"  name="roadAddr" >
            </label>
        
        </p> 

        <p>   
            <label>
                # 지번주소  : <input type="text"  name="lotNumAddr" >
            </label>
        
        </p> 


        <p>   
            <label>
                # 상세주소  : <input type="text"  name="extraAddr" >
            </label>
        
        </p> 


        <p>   
            <label>
                # 생일  : <input type="text"  name="csBirth" >
            </label>
        
        </p> 
 
  

    <p>
        <label>
          <input type="submit" value="가입하기">
        </label>
    </p>

    
    </form>

    


</body>
</html>