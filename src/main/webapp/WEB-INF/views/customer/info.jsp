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

   
    <h1>회원 정보 조회 </h1>

    <div>
        <!-- <c:forEach var="cs" items="${cs}"> -->
        <p>
        <label>
            # 회원아이디  : <input type="text" value="${cs.csId}"  >
        </label>
         </p>
        

        <p>
            <label>
                # 회원 비밀번호  : <input type="password" value="${cs.csPw}">
            
            </label>
            
        </p>


        <p>   
            <label>
                # 회원 이름  : <input type="text"  value="${cs.csName}" >
            </label>
        
        </p> 

        <p>   
            <label>
                # 회원 성별  : <input type="text"  value="${cs.csGender}" >
            </label>
        
        </p> 

        <p>   
            <label>
                # 연락처  : <input type="text"  value="${cs.csPhone}" >
            </label>
        
        </p> 

        <p>   
            <label>
                # 우편번호  : <input type="text"  value="${cs.postCode}" >
            </label>
        
        </p> 

        <p>   
            <label>
                # 도로명주소  : <input type="text"  value="${cs.roadAddr}" >
            </label>
        
        </p> 

        <p>   
            <label>
                # 지번주소  : <input type="text"  value="${cs.lotNumAddr}" >
            </label>
        
        </p> 


        <p>   
            <label>
                # 상세주소  : <input type="text"  value="${cs.extraAddr}" >
            </label>
        
        </p> 

        <p>   
            <label>
                # 생일  : <input type="text"  value="${cs.csBirth}" >
            </label>
        
        </p> 

    <!-- </c:forEach> -->

</div>
    
   




</body>
</html>