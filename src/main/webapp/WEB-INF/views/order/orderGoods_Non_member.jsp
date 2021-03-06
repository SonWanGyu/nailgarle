<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function fn_process_pay_order() {

	var formObj = document.createElement("form");
	var i_receiver_name = document.createElement("input");
	var i_orderer_name = document.createElement("input");

	var i_receiver_hp1 = document.createElement("input");
	var i_receiver_hp2 = document.createElement("input");
	var i_receiver_hp3 = document.createElement("input");

	var i_receiver_tel1 = document.createElement("input");
	var i_receiver_tel2 = document.createElement("input");
	var i_receiver_tel3 = document.createElement("input");

	var i_delivery_zipcode = document.createElement("input");
	var i_delivery_address1 = document.createElement("input");
	var i_delivery_address2 = document.createElement("input");
	var i_delivery_message = document.createElement("input");
	var i_delivery_method = document.createElement("input");
	var i_pay_method = document.createElement("input");
	var i_card_com_name = document.createElement("input");
	var i_card_pay_month = document.createElement("input");
	var i_pay_orderer_hp_num = document.createElement("input");

	i_receiver_name.name = "receiver_name";
	i_orderer_name.name = "orderer_name";
	i_receiver_hp1.name = "receiver_hp1";
	i_receiver_hp2.name = "receiver_hp2";
	i_receiver_hp3.name = "receiver_hp3";

	i_receiver_tel1.name = "receiver_tel1";
	i_receiver_tel2.name = "receiver_tel2";
	i_receiver_tel3.name = "receiver_tel3";

	i_delivery_zipcode.name = "delivery_zipcode";
	i_delivery_address1.name = "delivery_address1";
	i_delivery_address2.name = "delivery_address2";
	i_delivery_message.name = "delivery_message";
	i_delivery_method.name = "delivery_method";
	i_pay_method.name = "pay_method";
	i_card_com_name.name = "card_com_name";
	i_card_pay_month.name = "card_pay_month";
	i_pay_orderer_hp_num.name = "pay_orderer_hp_num";

	i_receiver_name.value = document.getElementById("receiver_name").value;
	i_orderer_name.value = document.getElementById("orderer_name").value;
	
	if(i_receiver_name.value == ""){
		alert("????????? ??? ????????? ??????????????????.");
		document.getElementById("receiver_name").focus();
		return false;
	}
	if(i_orderer_name.value == ""){
		alert("????????? ????????? ??????????????????.");
		document.getElementById("orderer_name").focus();
		return false;
	}
	
	i_receiver_hp1.value = document.getElementById("hp1").value;
	i_receiver_hp2.value = document.getElementById("hp2").value;
	i_receiver_hp3.value = document.getElementById("hp3").value;

	i_receiver_tel1.value = document.getElementById("tel1").value;
	i_receiver_tel2.value = document.getElementById("tel2").value;
	i_receiver_tel3.value = document.getElementById("tel3").value;
	
	if(i_receiver_tel2.value == "" && i_receiver_tel3.value == "" && i_receiver_hp2.value == "" && i_receiver_hp3.value == ""){
		alert("??????????????? ??????????????????.");
		document.getElementById("hp2").focus();
		return false;
	}
	
	i_delivery_zipcode.value = document.getElementById("zipcode").value;
	i_delivery_address1.value = document.getElementById("roadAddress").value + document.getElementById("jibunAddress").value;
	i_delivery_address2.value = document.getElementById("namujiAddress").value;
	
	if(i_delivery_zipcode.value == ""){
		alert("??????????????? ???????????????.");
		document.getElementById("zipcode").focus();
		return false;
	}
	if(i_delivery_address1.value == ""){
		alert("????????? ???????????????.");
		document.getElementById("roadAddress").focus();
		return false;
	}
	if(i_delivery_address2.value == ""){
		alert("????????? ???????????????.");
		document.getElementById("namujiAddress").focus();
		return false;
	}
	
	i_delivery_message.value = document.getElementById("delivery_message").value;
	i_delivery_method.value = document.getElementById("delivery_method").value;
	i_pay_method.value = document.getElementById("p_pay_method").value;
	i_card_com_name.value = document.getElementById("card_com_name").value;
	i_card_pay_month.value = document.getElementById("card_pay_month").value;
	i_pay_orderer_hp_num.value = "010-2222-3333";

	formObj.appendChild(i_receiver_name);
	formObj.appendChild(i_orderer_name);
	formObj.appendChild(i_receiver_hp1);
	formObj.appendChild(i_receiver_hp2);
	formObj.appendChild(i_receiver_hp3);
	formObj.appendChild(i_receiver_tel1);
	formObj.appendChild(i_receiver_tel2);
	formObj.appendChild(i_receiver_tel3);

	formObj.appendChild(i_delivery_zipcode);
	formObj.appendChild(i_delivery_address1);
	formObj.appendChild(i_delivery_address2);
	formObj.appendChild(i_delivery_message);
	formObj.appendChild(i_delivery_method);

	formObj.appendChild(i_pay_method);
	formObj.appendChild(i_card_com_name);
	formObj.appendChild(i_card_pay_month);
	formObj.appendChild(i_pay_orderer_hp_num);

	document.body.appendChild(formObj);
	formObj.method = "post";
	formObj.action = "${contextPath}/order/payToOrderGoods.do";
	formObj.submit();
}

</script>
<style>
.layout{
	padding-top:40px;
	width:100%;
}

.orderGoods{
	margin-top : 40px;
	width:1000px;
}
.orderGoods h1{
	text-align: center;
	font-size: 40px;
}
.orderGoods h2{
	margin-top : 20px;
	font-size: 28px;
	border: solid black;
	border-width: 0px 0px 1px 0px ;	
}
.order_depth{
	text-align: right;
	border: solid black;
	border-width: 0px 0px 1px 0px ;	
}
.order_depth .first_depth{
	font-weight: 900;
}
.order_check{
	width: 100%;
    border-top-color: rgb(51, 51, 51);
    border-top-width: 2px;
    border-top-style: solid;	
}

.order_check img{
	width: 100px;
	height: 100px;
}
.order_check tr{
	margin:10px;
	border-bottom-color: rgb(153, 153, 153);
    border-bottom-width: 1px;
    border-bottom-style: dotted;
}
.order_check td{
	padding:10px 0;
}
.order_check .redLine{	
	text-decoration: line-through;
	color: red;
}


.order_check .text_box{
	width:100px;
}

.delivery_data table{
    border-top-color: rgb(51, 51, 51);
    border-top-width: 2px;
    border-top-style: solid;	
	border-bottom-color: rgb(51, 51, 51);
    border-bottom-width: 2px;
    border-bottom-style: solid;
}
.delivery_data table td{
    padding: 7px 0px 7px 10px;
}
.delivery_data .dot_line{
	border-bottom-color: rgb(153, 153, 153);
    border-bottom-width: 1px;
    border-bottom-style: dotted;
}

.delivery_data .fixed_join{
    width: 150px;
    font-weight: bold;
    color: #2904D9;
    background: #F1BF05;
}

</style>
</head>
<body>
<div class="layout">
<!-- body?????? ??????-->
	<div class="orderGoods">
		<h1>??????/?????? ?????????</h1>
		<div class="order_depth">
			<span class="first_depth">01. ??????/??????</span>	
			<span>></span>	
			<span class="second_depth">02. ??????</span>
		</div>
		<h2>1. ????????????</h2>
		<table class="order_check">
			<tbody align="center">
				<tr style="background: #9feeff">
					<td colspan="2">???????????????</td>
					<td>??????</td>
					<td>??????(??????)</td>
					<td>?????????(??????)</td>
					<td>?????????</td>
					<td>?????????????????????</td>
				</tr>					
				<c:set var="AllPrice" value="0" />				
				<c:forEach var="item" items="${myOrderList }">	
					<c:set var="AllPrice" value="${AllPrice+item.productSale*item.productQuantity}" />
				</c:forEach>
				<c:forEach var="item" items="${myOrderList }">					
				<tr>			
					<td><img alt="#" src="${contextPath}/thumbnails.do?productNum=${item.productNum}&fileName=${item.fileName}"></td>
					<td>${item.productName }</td>
					<td>${item.productQuantity }</td>
					<td class="redLine"><fmt:formatNumber value="${item.productPrice*item.productQuantity }" />???</td>
					<td><fmt:formatNumber value="${item.productSale*item.productQuantity }" />???</td>
					<c:choose>
						<c:when test="${AllPrice>=50000}">
							<td>0???</td>
						</c:when>
						<c:otherwise>
							<td>${item.productDelivery }???</td>						
						</c:otherwise>
					</c:choose>
					<td><fmt:formatNumber type="number" maxFractionDigits="0" value= " ${item.productSale*item.productQuantity/100 } " /></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<h2>2. ????????????</h2>
			<table>
				<tbody>
					<tr class="dot_line">
						<td>??????</td>
						<td><input id="orderer_name" name="orderer_name"  type="text" value="" size="15" /></td>
					</tr>
				</tbody>
			</table>
			</div>
		<h2>3. ????????? ??????</h2>
			<div class="delivery_data">
				<table>
					<tbody>
						<tr class="dot_line">
							<td class="fixed_join">????????????</td>
							<td>
								<input type="radio" id="delivery_method" name="delivery_method" value="????????????" checked="checked">????????????	&nbsp;&nbsp;&nbsp; 
								<input type="radio" id="delivery_method" name="delivery_method" value="???????????????">???????????????	&nbsp;&nbsp;&nbsp;
								<input type="radio" id="delivery_method"	name="delivery_method" value="????????????">???????????? &nbsp;&nbsp;&nbsp;
							</td>
						</tr>
						<tr class="dot_line">
							<td class="fixed_join">????????? ??????</td>
							<td><input type="radio" name="delivery_place" onclick="restore_all()" value="???????????????" checked="checked">???????????????
								&nbsp;&nbsp;&nbsp; <input type="radio" name="delivery_place" value="????????????" onclick="reset_all()">????????????
								&nbsp;&nbsp;&nbsp; <input type="radio" name="delivery_place" value="???????????????">??????????????? &nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr class="dot_line">
							<td class="fixed_join">????????? ???</td>
							<td>
								<input id="receiver_name" name="receiver_name" type="text" size="40" value="asdasd">
							</td>
						</tr>
						<tr class="dot_line">
							<td class="fixed_join">???????????????</td>
							<td><select id="hp1" name="hp1">
									<option>??????</option>
									<option value="010" selected="selected">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select> - <input size="10px" type="text" id="hp2" name="hp2" value="1234"> - <input size="10px" type="text" id="hp3" name="hp3" value=" 4321"><br>
						</tr>
						<tr class="dot_line">
							<td class="fixed_join">????????????(??????)</td>
							<td><select id="tel1" name="tel1">
									<option value="02">02</option>
									<option value="031">031</option>
									<option value="032">032</option>
									<option value="033">033</option>
									<option value="041">041</option>
									<option value="042">042</option>
									<option value="043">043</option>
									<option value="044">044</option>
									<option value="051">051</option>
									<option value="052">052</option>
									<option value="053">053</option>
									<option value="054">054</option>
									<option value="055">055</option>
									<option value="061">061</option>
									<option value="062">062</option>
									<option value="063">063</option>
									<option value="064">064</option>
									<option value="0502">0502</option>
									<option value="0503">0503</option>
									<option value="0505">0505</option>
									<option value="0506">0506</option>
									<option value="0507">0507</option>
									<option value="0508">0508</option>
									<option value="070">070</option>
							</select> - <input size="10px" type="text" id="tel2" name="tel2" value="">
								- <input size="10px" type="text" id="tel3" name="tel3" value="">
							</td>
						</tr>
						<tr class="dot_line">
							<td class="fixed_join">??????</td>
							<td><input type="text" id="zipcode" name="zipcode" size="5" value="34303"> <a href="javascript:execDaumPostcode()">??????????????????</a>
								<br>
								<p>
									<br>?????? ??????: <input type="text" id="roadAddress"  name="roadAddress" size="50" value="?????? ????????? ???????????????????????? 336 (?????????)"><br>
									<br> ????????? ??????: <input type="text" id="jibunAddress"	name="jibunAddress" size="50" value="?????? ????????? ????????? 400-4"><br>
									<br> ????????? ??????: <input type="text" id="namujiAddress" name="namujiAddress" size="50" value="??????????????????">
								</p> 
								 <input type="hidden" id="h_zipcode" name="h_zipcode" value="34303">
								 <input type="hidden" id="h_roadAddress" name="h_roadAddress" value="?????? ????????? ???????????????????????? 336 (?????????)">
						</tr>
						<tr class="dot_line">
							<td class="fixed_join">?????? ?????????</td>
							<td><input id="delivery_message" name="delivery_message" type="text" size="50" placeholder="?????? ???????????? ????????? ???????????? ???????????????."></td>
						</tr>
					</tbody>
				</table>
			</div>
		<h2>4. ?????? ??????</h2>
		<div class="order_detail">
			<table class="order_check">
				<tbody align="center">
					<tr>
						<td>?????? ?????? ??????</td>
						<td>???????????????</td>
						<td>?????? ?????? ??????</td>
						<td>?????? ?????? ?????????</td>
					</tr>				
					<tr>				
						<td>${AllPrice}???</td>
						<td>0 P</td>
						<td>${AllPrice}???</td>
						<td><fmt:formatNumber type="number" maxFractionDigits="0" value= " ${AllPrice/100} " /> P</td>
					</tr>									
					<tr>				
						<td>?????? ?????????</td>
						<td>400 P</td>
						<td>?????? ?????????</td>
						<td><input class="text_box" type="text"/><input type="button" value="??????"/></td>
					</tr>
				</tbody>
		</table>
		</div>
		<h2>5. ?????? ??????</h2>
		<div class="order_type">
			<input type="radio" id="p_pay_method" name="pay_method" value="????????????" checked="checked">????????????	&nbsp;&nbsp;&nbsp; 
			<input type="radio" id="p_pay_method" name="pay_method" value="????????? ??????">????????? ??????	&nbsp;&nbsp;&nbsp;
			<input type="radio" id="p_pay_method" name="pay_method" value="????????? ????????????">????????? ???????????? &nbsp;&nbsp;&nbsp;
			<input type="radio" id="p_pay_method" name="pay_method" value="????????? ??????">????????? ?????? &nbsp;&nbsp;&nbsp;
			<input type="radio" id="p_pay_method" name="pay_method" value="???????????????">??????????????? &nbsp;&nbsp;&nbsp;	
			<br>
			<span>???????????? : </span>
			<select id="card_com_name" name="????????????">
				<option value="??????" selected="selected">??????</option>
				<option value="??????">??????</option>
				<option value="??????">??????</option>
				<option value="??????">??????</option>
			</select>	
			<span>???????????? : </span>
			<select id="card_pay_month" name="????????????">
				<option value="?????????" selected="selected">?????????</option>
				<option value="1??????">1??????</option>
				<option value="3??????">3??????</option>
				<option value="6??????">6??????</option>
				<option value="12??????">12??????</option>
			</select>					
		</div>
		<input type="button" value="????????????" onclick="fn_process_pay_order()">
		<input type="button" value="??????" onclick="location.href='${contextPath}/main/main.do'">	
	</div>
</div>
</body>
</html>