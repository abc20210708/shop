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

<c:set var="p"  value="${product}"  />
<c:set var="c"  value="${cart}"  />

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

       

        <c:forEach var="c" items="${cart}" >

       
        <!-- <input type="hidden" name="cartChecked" value='0' id="input_check_hidden"/> -->
        <p>
            <label>
                # 카테고리 번호  : <input type="text" value="${c.cartCode}"  >
            </label>
        </p>
            

        <p>
            <label>
                # 회원아이디  : <input type="text" value="${c.csId}">
            
            </label>
            
        </p>


        <p>   
            <label>
                # 상품번호  : <input type="text"  value="${c.prCode}" >
            </label>
        
        </p> 


        <p>   
            <label>
                # 장바구니수량  : <input type="text"  id="cartAmount" value="${c.cartAmount}" >
            </label>
        
        </p> 
        </c:forEach>


        <c:forEach var="p" items="${product}">
            <label>

            
            #상품썸네일: <input type="text"  value="${p.prThumb}" >
        
                <img src="/product/list/${p.prThumb}" width="300" height="300" referrerpolicy="no-referrer" />
               
              
            </label>

                 <label>

                #상품가격: <input type="text" id="prPrice" value="${p.prPrice}" >
   
                </label>

                <input type="checkbox" onClick="calcGoodsPrice('${p.prPrice}', this)" name="cartChecked" value='${p.prCode}' id="input_check"/>
        </c:forEach>

        <p>   
            <label>
                # 총금액  : <input type="text" id="cartTotalPrice" name="cartTotalPrice" value="0" >
            </label>
        
        </p> 


        <p>

        <input type="checkbox" id="check_all" name="all" onclick="checkAll()"><span>전체선택</span>
        
        </p>

        <hr>


    </div>

    <script>

    let totalPrice = 0;
    let total = document.getElementById('cartTotalPrice');
    let amount = document.getElementById('cartAmount');
    let price = document.getElementById('prPrice');
    let input = document.getElementById('input_check');
    

    
    function calcGoodsPrice(prPrice, obj) {
        
            if(obj.checked == true) {
            //alert("체크가 되었어요! :) ")
                totalPrice += amount.value * prPrice;
                
                console.log(obj);
                console.log("===========");
                console.log(totalPrice);
                
             } else {
                 totalPrice -= amount.value * prPrice;

             }
             total.value = totalPrice;   
        }
      
       /* 체크박스 전체선택, 전체해제 */

       /* 
        function checkAll(){
            if( $("#check_all").is(':checked') ){
                $("input").prop("checked", true);
               
            }else{
                $("input[name=cartChecked]").prop("checked", false);
                total.value = 0;
            }
        } */

        $(document).on('change','#check_all',function(e) {
            let checkItem = $("input[name=cartChecked]");
            if($(this).prop("checked")) {
                checkItem.prop("checked", true);
            } else {
                checkItem.prop("checked",false);
            }
        });
        let checkItem = $("input[name=cartChecked]");
        $("#check_all").prop("checked",true);
        checkItem.prop("checked",true);
        

        /*
        let countBox = $(this).closest('#cart_amount');

         //전체 체크
      $(document).on('change','#check_all',function(e){
    	  let checkItem = $("input[name=all]");
          if($(this).prop("checked")) { 
        	  checkItem.prop("checked",true); 
          } else {
        	  checkItem.prop("checked",false);
          }
      });
      let checkItem = $("input[name=all]");
      $("#check_all").prop("checked",true);
      checkItem.prop("checked",true); 
      
      //개별 체크
      $(document).on('change','input[name=all]',function(e){
         let totalPrice = $("#cartTotalPrice");
         let countInput = countBox.find('input[name=cartAmount]');
         let count = countInput.val();
         totalPrice = parseInt(document.getElementById("sum").val(count)); 
         let val = document.getElementById('input[name="all"]').checked;
         
         if($(this).prop("checked")) {
            totalPrice+=result;
         } else {
         totalPrice-=result;
      }
         document.getElementById("sum").value = totalPrice;
         
         totalPrice.empty();
         totalPrice.html(val);  
      }); 
      */
        

        

       


    
    </script>

</body>

</html>