<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

        <input type="button" value="우편번호찾기" onclick="sample4_execDaumPostcode()" class="cartBtn">   

        <p>   
            <label>
                # 우편번호  : <input type="text" id="post_code"  name="postCode" >
            </label>
        
        </p> 

        <p>   
            <label>
                # 도로명주소  : <input type="text" id="road_addr" name="roadAddr" >
            </label>
        
        </p> 

        <p>   
            <label>
                # 지번주소  : <input type="text" id="lot_num_addr" name="lotNumAddr" >
            </label>
        
        </p> 


        <p>   
            <label>
                # 상세주소  : <input type="text" id="extra_addr" name="extraAddr" >
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

    
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
        function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('post_code').value = data.zonecode;
                document.getElementById("road_addr").value = roadAddr;
                document.getElementById("lot_num_addr").value = data.jibunAddress;
         
                //document.getElementById("sample4_engAddress").value = data.addressEnglish;
                       
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extra_addr").value = extraRoadAddr;
                } else {
                    document.getElementById("extra_addr").value = '';
                }

                /*
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                } */
            }
        }).open();
    }
    </script>

</body>
</html>