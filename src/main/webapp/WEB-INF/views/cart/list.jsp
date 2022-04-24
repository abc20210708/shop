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

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <c:set var="p" value="${product}" />
    <c:set var="c" value="${cart}" />

</head>

<body>
    <div class="jumbotron">

        <hr class="my-4">
        <p>${loginCustomer.csName}님의 장바구니 페이지</p>
        <li><a href="/customer/logout">회원 로그아웃</a></li>
    </div>
    <h2>장바구니</h2>
    <hr>

    <div>



        <c:forEach var="c" items="${cart}">


            <!-- <input type="hidden" name="cartChecked" value='0' id="input_check_hidden"/> -->
            <p>
                <label>
                    # 카테고리 번호 : <input type="text" value="${c.cartCode}">
                </label>
            </p>


            <p>
                <label>
                    # 회원아이디 : <input type="text" value="${c.csId}">

                </label>

            </p>


            <p>
                <label>
                    # 상품번호 : <input type="text" value="${c.prCode}">
                </label>

            </p>


            <p>
                <label>
                    # 장바구니수량 : <input type="text" name="cartAmount" id="cart_Amount" value="${c.cartAmount}">
                    <button type="button" onClick="Plus(); ">+</button>
                    <button type="button" onClick="Minus();">-</button>
                </label>

            </p>
        </c:forEach>


        <c:forEach var="p" items="${product}">
            <label>


                #상품썸네일: <input type="text" value="${p.prThumb}">

                <img src="/product/list/${p.prThumb}" width="300" height="300" referrerpolicy="no-referrer" />


            </label>

            <label>

                #상품가격: <input type="text" id="prPrice" value="${p.prPrice}">

            </label>

            <input type="checkbox" onClick="calcGoodsPrice('${p.prPrice}', this)" name="cartChecked" value='${p.prCode}'
                id="input_check" />
        </c:forEach>

        <p>
            <label>
                # 총금액 : <input type="text" id="cartTotalPrice" name="cartTotalPrice" value="0" readonly>
            </label>

        </p>


        <p>

            <input type="checkbox" id="check_all" name="all" onclick="checkAll(this);"><span>전체선택</span>

        </p>

        <hr>


    </div>

    <script>
        let totalPrice = 0;
        let total = document.getElementById('cartTotalPrice');
        let amount = document.getElementById('cart_Amount');
        let price = document.getElementById('prPrice');
        let input = document.getElementById('input_check');




        function calcGoodsPrice(prPrice, obj) {

            if (obj.checked == true) {
                //alert("체크가 되었어요! :) ")
                totalPrice += amount.value * prPrice;

                console.log("obj: ", obj);
                console.log("prPrice: ", prPrice);
                console.log("===========");
                console.log("totalPrice: ", totalPrice);


            } else {
                totalPrice -= amount.value * prPrice;

            }
            total.value = totalPrice;
        }

        /* 체크박스 전체선택, 전체해제 */

        let checkSum = 0;

        function checkAll(checkAll) {
            if ($("#check_all").is(':checked')) {
                //$("input[name=cartChecked]").prop("checked", false);

                let chks = document.getElementsByName("cartChecked"); 
                for(let i = 0; i < chks.length; i++)
                    { chks[i].checked = checkAll; 
                        checkSum +=  Integer.parseInt(chks[i].value);
                    }

            } else {
                $("input[name=cartChecked]").prop("checked", false);
                checkSum = 0;
            }
            total.value = checkSum;
        }



        function Plus() {
            
            amount.value++;
            console.log(amount.value);
        }


        function Minus() {
            
            if (amount.value > 1) {
                amount.value--;
               // price.value = price.value * amount.value;
                console.log(price.value);
            } else {
                alert('더이상 줄일수가 없습니다');
                return;
            }
        }
    </script>

</body>

</html>