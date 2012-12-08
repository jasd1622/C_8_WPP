<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%
	String[] seller_phones = { "02", "031", "032", "033", "041", "042",
			"043", "044", "051", "052", "053", "054", "055", "061",
			"062", "063", "064" };
	String[] buyer_phones = { "010", "011", "016", "018", "019" };
	String errorMsg = null;

	String actionUrl = "register.jsp";
	String actionUrl2 = "checkid.jsp";

	// 사용자 정보를 위한 변수 초기화
	String userid = "";
	String shop = "";
	String pwd = "";
	String address = "";
	String phone = "";
	String phone2 = "";
	String phone3 = "";
	String grade = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/join.css">
</head>
<script type="text/javascript">
	function check(){
		window.open("checkid.jsp?id="+document.memberform.userid.value,"check","width=140px,height=150px,top=250px,left=600px");
	}
</script>
<body>
	<div id="wrap" style="width: 930px; margin: 0px auto;">
		<jsp:include page="share/header.jsp"></jsp:include>
		<div id="content">
			<form name="memberform" class="form-horizontal" action="<%=actionUrl%>" method="post">
				<div class="head_content">
					<h1>회원가입(판매자)</h1><br/>
				</div>
				<div class="center_content">
					<table class="t">
						<tbody>
							<tr>
								<th class="rb">아이디</th>
								<td class="control-group"><span class="controls"> <input
										type="text" name="userid" />
								</span> 
								<input type="button" value="중복조회" class="button"  onclick="check()"/>
								<span> 6~12자의 영문/숫자만 가능</span></td>
							</tr>
							<tr>
								<th>상호명</th>
								<td class="control-group"><input type="text" name="name" />
								</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td class="control-group"><span class="controls"><input
										type="password" name="pwd" /></span> <span>* 6~12자의 영문/숫자만 가능</span></td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td class="control-group"><span class="controls"><input
										type="password" name="pwd2" /></span></td>
							</tr>
							<tr>
								<th rowspan="2">주소</th>
								<td><input type="text" class="txt" /> <span>-</span> <input
									type="text" class="txt" /> <input type="button" value="주소찾기"
									class="button" /></td>
							</tr>
							<tr>
								<td class="control-group"><span class="controls"> <input
										type="text" name="add" style="width: 386px" />
								</span></td>
							</tr>
							<tr>
								<th>가게전화</th>
								<td class="control-group"><span class="controls"> <select
										name="phone">
											<%
												for (String pnum : seller_phones) {
													out.print("<option");
													if (pnum.equals(phone)) {
														out.print(" selected");
													}
													out.println(">" + pnum + "</option>");
												}
											%>
									</select>
								</span> <span>-</span> <input type="text" class="txt" name="phone2" />
									<span>-</span> <input type="text" class="txt" name="phone3" />
								</td>
						</tbody>
					</table>
					<input type="hidden" name="grade" value="0"/>
					<h2>이용약관</h2><br/>
					<div style="margin-bottom: 5px">
						<textarea name="policy" cols="120" rows="5">본 점 'PIZZA'는 통합 쿠폰제를 실시합니다. 약관에 동의 하셔야 회원가입이 가능합니다.
					</textarea>
					</div>
					<input type="checkbox" name="agree" value="agree" /> 약관에 동의합니다.
					<p class="center">
					<div class="form-actions">
						<input type="submit" class="btn" value="가입" id="ga" />
					</div>
				</div>
			</form>
			<jsp:include page="share/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>