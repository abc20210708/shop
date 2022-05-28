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

    <form action="/customer/login" method="post" autocomplete="off" enctype="multipart/form-data">

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
                <input type="submit" value="로그인">
            </label>
        </p>


    </form>

    <script>
        //const loginCustomer = '${loginCustomer}';



        let chk1 = false;

        //ID검증
        const $idInput = $('#inputId');
        $idInput.on('keyup', e => {
                    //아이디를 입력하지 않았거나 공백만 쓰고 넘어간 경우
                    if ($idInput.val().trim() === '' || $idInput.val().trim() === null ) {
                        $idInput.css('background', 'pink');
                        alert("입력하세요");
                        Response.redirect("/login/customer.jsp");
                        chk1 = false;
                        //아이디를 정규표현식 패턴대로 입력하지 않을 경우
                        //test메서드는 정규표현식을 검증하여 값이 일치하면 true,
                        //일치하지 않으면 false를 리턴
                    } else {
                        chk1 = false;
                    } });
    </script>


</body>

</html>