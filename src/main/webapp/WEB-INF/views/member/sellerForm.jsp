<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내일갈래? 회원가입</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

// 아이디 유효성 검사 - 정규식
function check_id() {
	var idC = /^[a-z0-9]{6,20}$/;

$("#_seller_id").blur(function() {
	if (idC.test($(this).val())) {
		$("#idcheck").text('중복체크를 해주세요.');
		$('#idcheck').css('color', 'green');
		} else {
			$('#idcheck').text('공백없이 영소문자, 숫자로 6~16글자를 입력해주세요.');
			$('#idcheck').css('color', 'red');
			document.getElementById('_seller_id').value = '';
			$("#_seller_id").focus();
			}
	});
}

// 비밀번호 유효성 검사 - 정규식
function check_pw1() {
	var pwC = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&**\-])(?=.*[0-9]).{6,16}$/;
	
$("#pw1").blur(function() {
	if (pwC.test($(this).val())) {
		$("#pwcheck").text('아래 다시한번 입력해주세요.');
		$('#pwcheck').css('color', 'green');
		} else {
			$('#pwcheck').text('공백없이 영문자, 숫자, 특수문자를 조합하여 6~16글자를 입력해주세요.');
			$('#pwcheck').css('color', 'red');
			document.getElementById('pw1').value = '';
			$("#pw1").focus();
			}
	});	
}

// 비밀번호 유효성 검사 - 재입력
function check_pw2() {
	if(document.getElementById('pw1').value !='' && document.getElementById('pw2').value!='') { 
		if(document.getElementById('pw1').value == document.getElementById('pw2').value) {
			document.getElementById('pwcheck2').innerHTML='비밀번호가 일치합니다.';
			document.getElementById('pwcheck2').style.color='blue';
			} else {
				document.getElementById('pwcheck2').innerHTML='비밀번호가 일치하지 않습니다.';
				document.getElementById('pwcheck2').style.color='red';
				document.getElementById('pw1').value = '';
				$("#pw1").focus();
				}
		}	
}

// 핸드폰 번호 유효성 검사 - 정규식
function check_hp2() {
	var hpC = /^[0-9]{3,4}$/;
	
$("#hp2").blur(function() {
	if (hpC.test($(this).val())) {
		$("#hpcheck").text('사용가능합니다.');
		$('#hpcheck').css('color', 'blue');
		} else {
			$('#hpcheck').text('휴대폰전화 형식에 맞게 숫자만 입력해주세요.');
			$('#hpcheck').css('color', 'red');
			document.getElementById('hp2').value = '';
			$("#hp2").focus();
			}
	});	
}

function check_hp3() {
	var hpC = /^[0-9]{3,4}$/;
	
$("#hp3").blur(function() {
	if (hpC.test($(this).val())) {
		$("#hpcheck").text('사용가능합니다.');
		$('#hpcheck').css('color', 'blue');
		} else {
			$('#hpcheck').text('휴대폰전화 형식에 맞게 숫자만 입력해주세요.');
			$('#hpcheck').css('color', 'red');
			document.getElementById('hp3').value = '';
			$("#hp3").focus();
			}
	});	
}

// 사업자 번호 유효성 검사 - 정규식
function check_businessNum() {
	var bnC = /^[0-9]{9,10}$/;
	
$("#businessNum").blur(function() {
	if (bnC.test($(this).val())) {
		$("#businessNum_check").text('사용가능합니다.');
		$('#businessNum_check').css('color', 'blue');
		} else {
			$('#businessNum_check').text('사업자번호에 맞게 숫자만 입력해주세요.');
			$('#businessNum_check').css('color', 'red');
			document.getElementById('businessNum').value = '';
			$("#businessNum").focus();
			}
	});	
}

// Daum 주소 API
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("ex_postcode").value = data.zonecode;
            document.getElementById("ex_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("ex_detailAddress").focus();
        }
    }).open();
}

	
function fn_overlapped() {
	var _id = $("#_seller_id").val();
	if (_id == '') {
		$("#idcheck").text('');
		alert("아이디를 확인해 주세요!");
		return;
	}
	$.ajax({
		type : "post",
		async : false,
		url : "${contextPath}/seller/overlapped.do",
		dataType : "text",
		data : {
			id : _id
		},
		success : function(data, textStatus) {
			if (data == 'false') {
				/* alert("사용할 수 있는 ID입니다."); */
				$("#idcheck").text('사용할 수 있는 아이디 입니다.');
				$('#idcheck').css('color', 'blue');
				$('#btnOverlapped').prop("disabled", true);
				$('#_seller_id').prop("disabled", true);
				$('#sellerId').val(_id);
			} else {
				$('#idcheck').text('중복된 아이디 입니다. 다른 아이디를 사용해 주세요.');
				$('#idcheck').css('color', 'red');
				/* document.getElementById('_seller_id').value=''; */
				$("#_seller_id").focus();
				/* alert("중복된 아이디 입니다. 다른 아이디를 사용해 주세요"); */
			}
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다.");
			ㅣ
		},
		complete : function(data, textStatus) {
			//alert("작업을완료 했습니다");
		}
	}); //end ajax	 
}
</script>
<style>
.layout{
	padding-top:40px;
	width:100%;
}

#seller_form {
	width: 700px;
	margin: 100px auto 0;
	padding: 15px 20px;
	background: white;
	color: #2b2e4a;
	font-size: 14px;
	text-align: left;
}

#seller_form .row_group {
	display: block;
	border: 1px solid #dedede;
	border-top: 2px solid #F4A460;
	margin: 0 auto 30px;
	box-shadow: 3px 3px 3px #dedede;
}

#seller_form .row_group .group_title {
	height: 43px;
	background: #f7f7f7;
	color: #3b3b3b;
	font-size: 13px;
	font-weight: normal;
	text-align: center;
	line-height: 43px;
}

#seller_form h3 {
	font-size: 35px;
	margin-bottom: 20px;
	text-align: center;
}

#seller_form ul li {
	list-style: none;
}

#seller_form #sell_form p {
	float: right;
	margin-left: 5px;
	margin-bottom: 0px;
	color: red;
	font-weight: bold;
}

.sellers input {
	width: 289px;
	height: 35px;
	outline: none;
	padding: 10px;
	border: 1px solid #707070;
	transition: 0.3s;
}

.sellers li {
	display: inline-block;
	margin-top: 5px;
}

.sellers li.seller1 {
	width: 120px;
	text-align: right;
	margin-right: 20px;
}

.sellers li.seller2 {
	width: auto;
}

.sellers li.seller2 .hp {
	width: 93px;
	height: 35px;
	outline: none;
	padding: 10px;
	border: 1px solid #707070;
	transition: 0.3s;
}
.sellers li.seller2 .hp1 {
	width: 93px;
	height: 35px;
	outline: none;
	border: 1px solid #707070;
	transition: 0.3s;
	text-align: center;
}

.sellers li.seller2 .email_text {
	width: 132.5px;
	height: 35px;
	outline: none;
	padding: 10px;
	border: 1px solid #707070;
}

.sellers li.seller2 .email_text1 {
	width: 100px;
	height: 35px;
	outline: none;
	border: 1px solid #707070;
	text-align: center;
}

.sellers li.seller2 .addr_text {
	width: 100px;
}

#seller_form .sellers .seller2 #pwcheck {
	margin-left: 5px;
}

#sell_form .sellers .seller2 .id_check {
	width: 100px;
	height: 35px;
	padding: 5px 15px;
	background: #2b2e4a;
	border: 1px solid #2b2e4a;
	color: white;
	font-size: 14px;
	transition: 0.3s;
}

#sell_form .sellers .seller2 .id_check:hover {
	background: white;
	color: #2b2e4a;
}

#sell_form .sellers .seller2 .addr_check {
	width: 100px;
	height: 35px;
	padding: 5px 15px;
	background: #2b2e4a;
	border: 1px solid #2b2e4a;
	color: white;
	font-size: 14px;
	transition: 0.3s;
}

#sell_form .sellers .seller2 .addr_check:hover {
	background: white;
	color: #2b2e4a;
}

#seller_form .join_btn {
	padding: 30px 0 60px;
	text-align: center;
}

#seller_form .box_btn {
	display: inline-block;
    *display: inline;
    *zoom: 1;
    overflow: hidden;
    text-align: center;
    vertical-align: top;
}

#seller_form .box_btn * {
	appearance: none;
    display: inline-block;
    min-width: 110px;
    height: 40px;
    box-sizing: border-box;
    font-family: dotum, 돋움, sans-serif;
    font-size: 12px;
    text-align: center;
    line-height: 40px;
    cursor: pointer;
    color: #fff !important;
    margin: 0px;
    padding: 0px 10px;
	border: 1px solid #2b2e4a;
    border-image: initial;
    outline: 0px;
    background: #2b2e4a;
    transition: 0.3s;
}

#seller_form .box_btn.white * {
	border: 1px solid #333;
    background: #fff;
    color: #333 !important;
    text-decoration: none;
}

#seller_form .box_btn:hover {
	min-width: 110px;
	height: 40px;
	background: #fff;
	color: #2b2e4a !important;
}

#seller_form .box_btn.white *:hover {
	min-width: 110px;
	height: 40px;
	background: #2b2e4a;
	color: #fff !important;
}

</style>
</head>
<body>
<div class="layout">
<div id="seller_form">
		<h3>회원가입</h3>
		<br> 
		<br>
			<form action="${contextPath}/seller/addSeller.do" method="post">
				<div class="row_group">
				<h4 class="group_title">
					<b>가입 정보 입력 </b><font style="color:red;"> * </font><span> 는 필수 입력사항입니다.</span>
				</h4>
				<ul id="sell_form" style="padding-left: 0px;">
		
					<li>
						<ul class="sellers">
							<li class="seller1">아이디<p>＊</p></li>
							<li class="seller2"><input type="text" name="_seller_id" id="_seller_id" onchange="check_id()">
											<input type="hidden" name="sellerId" id="sellerId" /></li>
							<li class="seller2"><input type="button" id="btnOverLapped" class="id_check" value="중복체크" onclick="fn_overlapped()" /></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1"></li>
							<li><span style="font-size:11px; color:red;" id="idcheck">공백없이 영소문자, 숫자로 6~16글자를 입력해주세요.</span></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1">비밀번호<p>＊</p></li>
							<li class="seller2"><input id="pw1" onchange="check_pw1()" type="password" name="sellerPw"></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1"></li>
							<li><span style="font-size:11px; color:red;" id="pwcheck">공백없이 영문자, 숫자, 특수문자를 조합하여 6~16글자를 입력해주세요.</span></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1">비밀번호 확인<p>＊</p></li>
							<li class="seller2"><input id="pw2" onchange="check_pw2()" type="password"></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1"></li>
							<li><span style="font-size:11px; color:red;" id="pwcheck2">비밀번호를 다시 입력해주세요.</span></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1">기업이름<p>＊</p></li>
							<li class="seller2"><input class="name_text" type="text" name="sellerName" required></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1"></li>
							<li><span></span></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1">전화번호<p>＊</p></li>
							<li class="seller2">
								<select class="hp1" name="sellerHp1">
									<option value="010" selected>010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="019">019</option>
								</select>
								<input class="hp" type="text" id="hp2" name="sellerHp2" onchange="check_hp2()">
								<input class="hp" type="text" id="hp3" name="sellerHp3" onchange="check_hp3()">
							</li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1"></li>
							<li><span style="font-size:11px; color:red;" id="hpcheck">전화번호는 숫자만 입력해주세요.</span></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1">사업자번호<p>＊</p></li>
							<li class="seller2"><input id="businessNum" name="businessNum" onchange="check_businessNum()" type="text" required></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1"></li>
							<li><span style="font-size:11px; color:red;" id="businessNum_check">사업자 번호는 숫자만 입력해주세요.</span></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1">이메일</li>
							<li class="seller2">
								<input class="email_text" type="text" name="sellerEmail1" id="sellerEmail1"> @
								<input class="email_text" type="text" name="sellerEmail2" id="sellerEmail2" disabled value="naver.com">
									<select class="email_text1" name="sellerEmail2" id="selectEmail">
										<option value="1">직접입력</option>
										<option value="naver.com" selected>naver.com</option> 
										<option value="hanmail.net">hanmail.net</option> 
										<option value="hotmail.com">hotmail.com</option> 
										<option value="nate.com">nate.com</option> 
										<option value="yahoo.co.kr">yahoo.co.kr</option> 
										<option value="empas.com">empas.com</option> 
										<option value="dreamwiz.com">dreamwiz.com</option> 
										<option value="freechal.com">freechal.com</option> 
										<option value="lycos.co.kr">lycos.co.kr</option> 
										<option value="korea.com">korea.com</option> 
										<option value="gmail.com">gmail.com</option> 
										<option value="hanmir.com">hanmir.com</option> 
										<option value="paran.com">paran.com</option> 
									</select>
							</li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1"></li>
							<li><span style="font-size:11px; color:red;" id="emailcheck">아이디/비밀번호 찾기시 사용할 이메일 입니다.</span></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1">우편번호</li>
							<li class="seller2"><input class="addr_text" type="text" id="ex_postcode" name="sellerZipcode"></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1"></li>
							<li><span></span></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1">주소</li>
							<li class="seller2"><input type="text" id="ex_address" name="sellerAddr1"></li>
							<li class="seller2"><button type="button" class="addr_check" onclick="execDaumPostcode()">우편번호</button></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1"></li>
							<li><span></span></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1">상세주소</li>
							<li class="seller2"><input type="text" id="ex_detailAddress" name="sellerAddr2"></li>
						</ul>
					</li>
					
					<li>
						<ul class="sellers">
							<li class="seller1"></li>
							<li><span></span></li>
						</ul>
					</li>
					
				</ul>
					</div>
					
					<div class="join_btn">
						<span class="box_btn">
							<input type="submit" class="box_btn" value="확인">
						</span>
						<span class="box_btn white">
							<a href="${contextPath}/main/main.do">취소</a>
						</span>
					</div>
			</form>
	</div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script type="text/javascript">

$('#selectEmail').change(function() {
	$("#selectEmail option:selected").each(function () {
		
		if($(this).val()== '1') {  
			$("#sellerEmail2").val(''); 
			$("#sellerEmail2").attr("disabled",false); 
			} else {
				$("#sellerEmail2").val($(this).text());
				$("#sellerEmail2").attr("disabled",true);
				}
		});
	});
	
</script>

</body>
</html>