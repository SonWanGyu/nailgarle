<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.layout {
	padding-top: 40px;
	width: 100%;
}

.admin_container {
	width: 1250px;
}

.admin_container h1 {
	margin: 40px 0 40px 0;
	text-align: center;
	font-size: 40px;
}

.admin_container .sidebar {
	width: 250px;
	float: left;
}

.admin_container .sidebar .admin_img {
	padding-right: 20px;
}

.admin_container .sidebar ul li a {
	text-decoration: none;
	color: black;
}

.admin_container .sidebar ul li:hover>a {
	font-weight: 800;
	color: #6199ff;
}

.admin_container .sidebar .ingoods {
	font-weight: 800;
}

.admin_container nav {
	margin-top: 32px;
}

.admin_container ul {
	padding-left: 0;
}

.admin_container li {
	font-size: 18px;
	padding: 30px;
	list-style: none;
}

.clear {
	clear: both;
	margin: 0;
	text-align: -webkit-center;
	width: 520px;
}

ul.tabs {
	float: left;
}

ul.tabs li {
	width: 157px;
	display: table-cell;
	margin: 0 0 -1px;
	padding: 15px 25px;
	font-weight: 600;
	border-bottom: 1px solid #bbb;
	text-align: center;
}

ul.tabs li a {
	padding: 0px 20px;
	color: #bbb;
	font-size: 12px;
	font-weight: bold;
	text-decoration: none;
	display: block;
}

ul.tabs a:hover {
	color: #2e9cdf;
	cursor: pointer;
}

ul.tabs li.active {
	color: #555;
	border: 1px solid #ddd;
	border-top: 2px solid #2b2e4a;
	border-bottom: 1px solid #ffffff;
}

ul.tabs li.active a {
	color: #555;
}

.tab_container {
	width: 900px;
	border-top-color: currentColor;
	border-top-width: medium;
	border-top-style: none;
	float: left;
	padding: 10px 20px 0 0;
}

.tab_container table {
	margin: 0;
}

.tab_container #tab1 td {
	padding: 0 0 5px 0;
	width: 230px;
}

.tab_container #tab1 select {
	width: 181px;
}

.tab_container #tab3 .tab3_td {
	padding: 0 0 5px 0;
	width: 230px;
}

.tab_container #tab3 .tab3_file_td {
	padding: 0 0 5px 0;
}

.tab_content {
	padding: 10px 10px 20px;
	line-height: 1.8em;
	font-size: 0.75em;
	min-height: 400px;
}

.tab_content p {
	margin: 10px 0px 0px;
}

.tab_content img {
	margin: 10px;
	padding: 5px;
}

.tab_content .writer {
	margin: 10px 0px;
	padding: 5px;
	color: rgb(0, 0, 0);
	font-size: 1.2em;
	font-weight: bold;
	border-bottom-color: rgb(255, 153, 0);
	border-bottom-width: 1px;
	border-bottom-style: solid;
}

#tab2 .productDetail {
	width: 400px;
	height: 400px;
	resize: none;
	margin-left: 35px;
}

</style>
</head>
<body>
<div class="layout">
<!-- body?????? ??????-->
<div class="admin_container">
			<h1>????????? ?????????</h1>
			<div class="sidebar">
				<nav>
					<ul>
						<li><a href="${contextPath}/admin/sales/adminMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_sales.svg"/>?????? ??????</a></li>
						<li><a class="ingoods" href="${contextPath}/admin/goods/adminGoodsMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_product.svg"/>?????? ??????</a></li>
						<li><a href="${contextPath}/admin/order/adminOrderMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_order.svg"/>??????/?????? ??????</a></li>
						<li><a href="${contextPath}/admin/member/adminMemberMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_member.svg"/>?????? ??????</a></li>
						<li><a href="${contextPath}/admin/rental/adminRentalMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_rental.svg"/>?????? ??????</a></li>
						<li><a href="${contextPath}/admin/board/adminNoticeBoard.do"><img class="admin_img" src="${contextPath}/resources/image/admin_board.svg"/>????????? ??????</a></li>
					</ul>
				</nav>
			</div>

				<form action="${contextPath}/admin/goods/addNewGoods.do" method="post" enctype="multipart/form-data">
					<div class="tab_container">
						<div class="tab_container" id="container">
							<ul class="tabs">
								<li><a href="#tab1">?????? ??????</a></li>
								<li><a href="#tab2">?????? ??????</a></li>
								<li><a href="#tab3">?????? ??????</a></li>
							</ul>
							<div class="tab_container">
								<div class="tab_content" id="tab1">
									<table>
										<tr>
											<td width="150">??? ????????????</td>
											<td><select name="p_mainNum" id="p_mainNum" onchange="fn_category(this.value)">
													<option value="-" selected>-</option>
													<option value="1">???????????? ??????/?????????</option>
													<option value="2">??????/????????????</option>
													<option value="3">?????????/????????????</option>
													<option value="4">?????????/??????</option>
													<option value="5">????????????</option>
													<option value="6">??????</option>
											</select>
											</td>
											<td>
												<input id="mainCategoryName" type="hidden" name="mainCategoryName" value="" />
											</td>
										</tr>
												
										<tr>
											<td>?????? ????????????</td>
											<td><select name="subCategoryName" id="subCategoryBox">
													<option value="-" selected>-</option>
											</select></td>
										</tr>

										<tr>
											<td>??????</td>
											<td><select name="typeName" id="typeName">
													<option value="??????" selected>??????</option>
													<option value="??????" selected>??????</option>
											</select></td>
										</tr>

										<tr>
											<td>?????????</td>
											<td><input name="productName" type="text" /></td>
										</tr>

										<tr>
											<td>?????????</td>
											<td><input name="sellerName" type="text" /></td>
										</tr>

										<tr>
											<td>??????1 (ex:??????/??????/??????)</td>
											<td><input name="productOption" type="text" value="n" /></td>
										</tr>
										<tr>
											<td>??????2</td>
											<td><input name="productOption2" type="text" value="n" /></td>
										</tr>

										<tr>
											<td>?????? ??????</td>
											<td><input name="originPrice" type="text" /> ???</td>
										</tr>

										<tr>
											<td>?????? ?????????</td>
											<td><input name="productPrice" type="text" /> ???</td>
										</tr>

										<tr>
											<td>?????????</td>
											<td><input name="productDelivery" type="text" /> ???</td>
										</tr>

										<tr>
											<td>?????????</td>
											<td><input name="productsStock" type="text" /> ???</td>
										</tr>
										<tr>
											<td>?????? ??????</td>
											<td><select name="productDisplay">
													<option value="-" selected>-</option>
													<option value="bestItem">bestItem</option>
													<option value="MDPick">MDPick</option>
													<option value="NewItem">NewItem</option>
											</select></td>
										</tr>

									</table>
								</div>

								<div class="tab_content" id="tab2">
									<table>
										<tr>
											<td>?????? ??????</td>
											<td><textarea class="productDetail" name="productDetail"></textarea></td>
										</tr>
									</table>
								</div>

								<div class="tab_content" id="tab3">
									<table>
										<tr>
											<td class="tab3_td" style="padding-right: 32px;">??????????????? ??????</td>
											<td class="tab3_file_td" align="left">
												<input type="button" value="?????? ??????" onClick="fn_addFile1()" /></td>
											<td>
												<div style="padding-left: 10px;" id="input_file1"></div>
											</td>
										</tr>
									</table>
									<table>
										<tr>
											<td class="tab3_td">????????????????????? ??????</td>
											<td class="tab3_file_td" align="left">
												<input type="button" value="?????? ??????" onClick="fn_addFile2()" /></td>
											<td>
												<div style="padding-left: 10px;" id="input_file2"></div>
											</td>
										</tr>
									</table>
								</div>

							</div>
						</div>
						<div class="clear">
						<table>
							<tr>
								<td align=center>
									<!--   <input type="submit" value="?????? ????????????"> -->
									<input type="button" value="?????? ????????????" onClick="fn_add_new_goods(this.form)">
									<input type="button" value="??????" onclick="history.back()">
								</td>
							</tr>
						</table>
						</div>
					</div>
				</form>
			</div>
		</div>
	<script>
		function fn_category(categoryNum) {
			$.ajax({
				type : "post",
				async : false, //false??? ?????? ??????????????? ????????????.
				url : "${contextPath}/admin/goods/selectCategory.do",
				data : {
					categoryNum : categoryNum
				},
				success : function(data, textStatus) {
					$("#subCategoryBox").children('option:not(:first)').remove();
					var text = $("#p_mainNum option:checked").text();
					var mainName = document.getElementById("mainCategoryName");
					mainName.value = text;
					var jsonInfo = JSON.parse(data);
					for ( var i in jsonInfo.category) {
						$("#subCategoryBox").append(
								'<option value="'+jsonInfo.category[i]+'">'
										+ jsonInfo.category[i] + '</option>');
					}
				},
				error : function(data, textStatus) {
					alert("????????? ??????????????????." + data);
				},
				complete : function(data, textStatus) {
					//alert("??????????????? ????????????");
				}
			}); //end ajax	
		}


		$(document).ready(function() {

			//When page loads...
			$(".tab_content").hide(); //Hide all content
			$("ul.tabs li:first").addClass("active").show(); //Activate first tab
			$(".tab_content:first").show(); //Show first tab content

			//On Click Event
			$("ul.tabs li").click(function() {

				$("ul.tabs li").removeClass("active"); //Remove any "active" class
				$(this).addClass("active"); //Add "active" class to selected tab
				$(".tab_content").hide(); //Hide all tab content

				var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
				$(activeTab).fadeIn(); //Fade in the active ID content
				return false;
			});

		});

		var cnt = 0;
		function fn_addFile1() {
			if (cnt == 0) {
				$("#input_file1").append("<br>"
										+ "<input type='file' name='main' id='in_main_image' />");
			} 
			cnt++;
		}
		var cnt2 = 0;
		function fn_addFile2() {

				$("#input_file2").append("<br>" + "<input type='file' name='detail"+cnt+"' />");
		

			cnt2++;
		}

 		function fn_add_new_goods(obj) {
			fileName = $('#in_main_image').val();
			if (fileName != null && fileName != undefined) {
				obj.submit();
			} else {
				alert("?????? ???????????? ????????? ???????????? ?????????.");
				return;
			}

		} 
	</script>

</body>
</html>