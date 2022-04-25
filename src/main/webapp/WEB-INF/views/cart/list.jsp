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
                    # 장바구니수량 :
                    <button type="button" id="plus" onClick="Plus('${c.cartAmount},this')">+</button>
                    <input type="text" name="cartAmount" id="cart_Amount" value="${c.cartAmount}">
                    <button type="button" id="minus" onClick="Minus()">-</button>
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


        function Plus(cartAmount, obj) {
            $('#plus').bind('click', function fncSearch(){
            //변수 증가
            let am = plus_btn.nextElementSibling.value;
            am++;
            amount.value = am;
        });            
    }        
        


        function Minus(cartAmount) {
            
            if (cartAmount.value > 1) {
                cartAmount.value--;
               // price.value = price.value * amount.value;
                //console.log(price.value);
            } else {
                alert('더이상 줄일수가 없습니다');
                return;
            }
        }


        // 참고 
        // 수량변경 - 이벤트 델리게이션으로 이벤트 종류 구분해 처리

            document.querySelectorAll('.updown').forEach(

        function(item, idx){

            //수량 입력 필드 값 변경

            item.querySelector('input').addEventListener('keyup', function(){

                basket.changePNum(idx+1);

            });

            //수량 증가 화살표 클릭

            item.children[1].addEventListener('click', function(){

                basket.changePNum(idx+1);

            });

            //수량 감소 화살표 클릭

            item.children[2].addEventListener('click', function(){

                basket.changePNum(idx+1);

            });

        }

        );
        
        
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

        function checkAll() {
            if ($("#check_all").is(':checked')) {
                $("input[name=cartChecked]").prop("checked", true);

                let arr = new Array();
                let chks = document.getElementsByName("cartChecked");

                for (let i = 0; i < chks.length; i++) {
                    arr[i] = parseInt(chks[i].previousElementSibling.lastElementChild.value);
                    //console.log(typeof chks[i]);
                    console.log("typeof chks" + [i] + typeof arr[i]);
                    // console.log("typeof chks"+ typeof chks);
                    checkSum += arr[i];

                }

            } else {
                $("input[name=cartChecked]").prop("checked", false);
                checkSum = 0;
            }
            total.value = checkSum;
        }


        
      
        


        /*
        function count(type) {

            // 더하기/빼기
            if (type === 'plus') {
                number = amount.value++;
            } else if (type === 'minus') {
                number = amount.value++;
            }

            // 결과 출력
            amount.value = number;
        } */
    </script>

</body>

</html>