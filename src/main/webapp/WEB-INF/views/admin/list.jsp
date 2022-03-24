<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

  <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>admin / list</title>

    

  </head>

<body>

   
    <h1>관리자 목록 조회 </h1>
   

        <div>
            <c:forEach var="a" items="${admin}">
            <p>
                <label>
                    # 관리자 아이디  : <input type="text" value="${a.adminId}"  >
                </label>
            </p>
                

            <p>
                <label>
                    # 관리자 비밀번호  : <input type="password" value="${a.adminPw}">
                
                </label>
                
            </p>


            <p>   
                <label>
                    # 관리자 이름  : <input type="text"  value="${a.adminName}" >
                </label>
            
            </p> 



            </c:forEach>
        </div>

            <p>=======================================</p>
        
            <div>
                <c:forEach var="cs" items="${cs}">
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

            </c:forEach>
        
        </div>

        <p>=======================================</p>


        <div>
            <c:forEach var="n" items="${notice}">
            <p>
                <label>
                    # 공지사항 글번호  : <input type="text" value="${n.noticeCode}"  >
                </label>
            </p>
                

            <p>
                <label>
                    # 공지사항 제목  : <input type="text" value="${n.noticeTitle}">
                
                </label>
                
            </p>


            <p>   
                <label>
                    # 공지사항 내용  : <input type="text"  value="${n.noticeContent}" >
                </label>
            
            </p> 


            <p>   
                <label>
                    # 공지사항 등록일자  : <input type="text"  value="${n.noticeDate}" >
                </label>
            
            </p> 


            <p>   
                <label>
                    # 공지사항 등록 관리자 아이디  : <input type="text"  value="${n.adminId}" >
                </label>
            
            </p> 

            </c:forEach>
        </div>
    
    <nav class="gnb">
        <ul>
            <li><a href="/">홈으로</a></li>
        </ul>
    </nav>  




</body>
</html>