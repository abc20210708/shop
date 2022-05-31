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
        //const loginCustomer = '${loginCustomer}';


        /*
        let chk1 = false;

        //ID검증
        const $idInput = $('#inputId');
        $idInput.on('keyup', e => {
            //아이디를 입력하지 않았거나 공백만 쓰고 넘어간 경우
            if ($idInput.val() === '' || $idInput.val() === null) {
                $idInput.css('background', 'pink');
                alert("아이디를 입력하세요");
                $idInput.focus();
                //Response.redirect("/login/customer.jsp");
                chk1 = false;
                return;
                //아이디를 정규표현식 패턴대로 입력하지 않을 경우
                //test메서드는 정규표현식을 검증하여 값이 일치하면 true,
                //일치하지 않으면 false를 리턴
            } else {
                chk1 = false;
            }
        });
        */

        $('#btn_login').click(function() {
            if ($('#inputId').val() === '' ||$('#inputId').val() === null) {
                alert('아이디를 입력하세요!');
                $('#inputId').focus();
                return;
            } else if ($('#inputPw').val() === '' || ($('#inputPw').val() === null) {
                alert('비밀번호를 입력하세요!');
                $('#inputPw').focus();
                return;
            }

            $.ajax({
                type: 'post',
                url: '/customer/login',
                dataType : "json",
                data: {
                    csId: $('#inputId').val(),
                    csPw: $('#inputPw').val()
                },
                success: function (data) {
                    if (data == 'true') {
                        location.reload();
                    } else {
                        alert('아이디나 비밀번호가 일치하지 않습니다!');
                        $("#inputId").focus();
                    }
                },
                error: function (req, text) {
                    alert(text + ': ' + req.status);
                }
            });
        }




        /*
        //로그인 버튼 클릭 이벤트
        $('#loginBtn').on('click', e => {
            if (chk1 && chk2) {
                //form Node
                $('#loginForm').submit(); //수동 submit
            } else {
                alert('입력값을 확인하세요!');
            }
        }); */
    </script>


</body>

</html>