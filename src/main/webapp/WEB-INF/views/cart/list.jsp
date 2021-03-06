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
        <li><a href="/product/product">상품 목록</a></li>
    </div>
    <h2>장바구니</h2>
    <hr>

    <div>



        <c:forEach var="c" items="${cart}">


            <p>
                <label>
                    # 장바구니 번호 : <input type="text" value="${c.cartCode}">
                </label>
            </p>



            <p>
                <label>
                    # 상품번호 : <input type="text" value="${c.prCode}">
                </label>

            </p>

                <p>
                    
                    <a href="/cart/delete?cartCode=${c.cartCode}" id="delCart" onclick="return confirm('선택하신 상품을 삭제하시겠습니까?');">삭제</a>   
                </p>


            <p>
                <label>
                    # 장바구니수량 :
                    <button type="button" id="plus">+</button>
                    <input type="text" name="cartAmount" id="cart_Amount" value="${c.cartAmount}">
                    <button type="button" id="minus">-</button>
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

            <input type="checkbox" id="check_all" name="all" onclick="checkAll();"><span>전체선택</span>

        </p>

        <hr>


    </div>

    <script>
        let totalPrice = 0;
        let total = document.getElementById('cartTotalPrice');
        let amount = document.getElementById('cart_Amount');
        let price = document.getElementById('prPrice');
        let input = document.getElementById('input_check');
        let plus_btn = document.getElementById('plus');


        const plusButtons = document.querySelectorAll("#plus");
        for (const button of plusButtons) {
            button.addEventListener('click', function (event) {
                button.nextElementSibling.value++;
                
            })
        }

        const minusButtons = document.querySelectorAll("#minus");
        for (const button of minusButtons) {
            button.addEventListener('click', function (event) {
                button.previousElementSibling.value--;
                if (button.previousElementSibling.value == 0) {
                    button.previousElementSibling.value = 1;
                    alert("수량은 1부터 가능합니다 :)")
                }
                console.log(amount.value);
            })
        }



        // 체크박스 개별선택, 전체해제 


        function calcGoodsPrice(prPrice, obj) {

            if (obj.checked == true) {
                //alert("체크가 되었어요! :) ")


                totalPrice += amount.value * prPrice;

                console.log("obj: ", obj);
                // console.log("check amount: " , obj.previousElementSibling.previousElementSibling.previousElementSibling.firstElementChild
                //                       .firstElementChild.nextElementSibling.getAttribute('value'));
                console.log("prPrice: ", prPrice);
                console.log("amount: ", amount.value);
                console.log("===========");
                console.log("totalPrice: ", totalPrice);


            } else {
                totalPrice -= amount.value * prPrice;

            }
            total.value = totalPrice;
        }

        /* 체크박스 전체선택, 전체해제 */

        let fSum = 0;
        let sSum = 0;

        function checkAll() {
            if ($("#check_all").is(':checked')) {
                $("input[name=cartChecked]").prop("checked", true);

                let arr = new Array();
                let chks = document.getElementsByName("cartChecked");
                let cart = document.getElementsByName("cartAmount");

                for (let i = 0; i < chks.length; i++) {
                    arr[i] = parseInt(chks[i].previousElementSibling.lastElementChild.value);
                    //console.log("=== test ===");
                    /*console.log(chks[i].previousElementSibling.previousElementSibling.
                                previousElementSibling.lastElementChild.lastElementChild.
                                previousElementSibling.value); */

                    // console.log("==== 전체체크 ==== ");
                    // console.log("arr: ",arr);
                    // console.log("arr" +[i]+ arr[i]);
                    // console.log("cart: ", cart);
                    //  console.log("cart" +[i]+ cart[i].value);
                    fSum = arr[i] * cart[i].value;
                    sSum += fSum

                }

            } else {
                $("input[name=cartChecked]").prop("checked", false);
                sSum = 0;
            }
            total.value = sSum;
        }


        

    </script>

</body>

</html>