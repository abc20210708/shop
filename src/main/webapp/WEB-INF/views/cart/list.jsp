<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="jumbotron">
   
    <hr class="my-4">
    <p>${loginCustomer.csName}님의 장바구니 페이지</p>
</div>
<h2>장바구니</h2>
<hr>
<table class="table">
    <thead class="thead-light">
    <tr>
      <th>카테고리 번호</th>
      <th>회원아이디</th>
      <th>상품번호</th>
      <th>장바구니 수량</th>
      <!-- <th>합계금액</th> -->
    </tr>
  </thead>
  <tbody>
    <c:forEach var="c" items="${cart}">
        <tr>
            <th>${c.cartCode}</th>
            <!-- <td>${c.csId}</td> -->
            <!-- <td>${c.prCode}</td> -->
            <!-- <td>${c.cartAmount}</td> -->
            <!-- <td>${c.cartTotalPrice}</td> -->
        </tr>
    </c:forEach>
  </tbody>
  <tfoot>
    <tr>
        <td colspan="4"></td>
        <!-- <td>${c.carttotalPrice}</td> -->
    </tr>
  </tfoot>
</table>
<!-- <form action="<c:url value='/orders' />" method="post">
    <input name="id" type="hidden" value="${ cart.id }" type="hidden" />
    <button type="submit" >주문하기</button>
</form> -->