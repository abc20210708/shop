<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

  <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Mall</title>

    

  </head>

<body>

   
    <h1> 업로드가 완료되었습니다. </h1>

  
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
            # 상품수량 : <input type="text" name="prAmount"  >
        </label>
        
    </p>

    <p>
        <label>
            # 상품썸네일 : <input type="file" name="prThumb" id=thumbFileOpenInput" accept="image/png, image/jpeg" >
        </label>
       
    </p>

  

    <p>
        <label>
            <button type="submit">상품 등록</button>
        </label>
    </p>
    </form>




</body>
</html>