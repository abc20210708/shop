<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <title>회원 로그인</title>

</head>

<body>


    <h1>회원 로그인</h1>

    <form action="/customer/login" method="post" autocomplete="off" id="loginForm" enctype="multipart/form-data">

        <p>
            <label>
                # 회원 아이디 : <input type="text" name="csId" id="inputId">
            </label>
        </p>


        <p>
            <label>
                # 회원 비밀번호 : <input type="password" name="csPw" id="inputPw">

            </label>

        </p>




        <p>
            <label>
                <input type="button" value="로그인" onclick="go_login()" id="loginBtn">
            </label>
        </p>


    </form>



    <script>


        $('#inputId').on('keypress', function(e){
            if(e.keyCode == '13'){
                $('#loginBtn').click();
            }
            });

        $('#inputPw').on('keypress', function(e){
        if(e.keyCode == '13'){
            $('#loginBtn').click();
        }
        });


        
        function go_login() {
            if( $('#inputId').val() === '' || $('#inputId').val() === null ) {
                alert('아이디를 입력하세요!');
                $('#inputId').focus();
                return;
            } else if( $('#inputPw').val() === '' || $('#inputPw').val() === null) {
                alert('비밀번호를 입력하세요!');
                $('#inputPw').focus();
                return;
            } else {
                $("form").submit();
            }
        }

       
    </script>


</body>

</html>