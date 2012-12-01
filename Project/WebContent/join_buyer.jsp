<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%
	String[] phones = { "010", "011", "016", "018", "019" };
	String errorMsg = null;
	String actionUrl;

	// 사용자 정보를 위한 변수 초기화
	String userid = "";
	String pwd = "";
	String address = "";
	String phone = "";
	String phone2 = "";
	String phone3 = "";
	String grade = "";
	actionUrl = "register.jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/join.css" rel="stylesheet" type="text/css">
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
				<span class="head_content">
					<h1>회원가입(구매자)</h1>
				</span>
				<div class="center_content">
					<table class="t">
						<tbody>
							<tr>
								<th class="rb">아이디</th>
								<td class="control-group"><span class="controls"> 
								<input type="text" name="userid"/>
								</span> <input type="button" value="중복조회" class="button" onclick="check()"/> 
								<span>*	6~12자의 영문/숫자만 가능</span></td>
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
										type="text" name="add" style="width: 386px"
										value="<%=address%>" />
								</span></td>
							</tr>
							<tr>
								<th>휴대전화</th>
								<td class="control-group"><span class="controls"> <select
										name="phone">
											<%
												for (String pnum : phones) {
													out.print("<option");
													if (pnum.equals(phone)) {
														out.print(" selected");
													}
													out.println(">" + pnum + "</option>");
												}
											%>
									</select>
								</span> <span>-</span> <input type="text" class="txt" name="phone2" />
									<span>-</span> <input type="text" class="txt" name="phone3" /></td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="grade" value="1"/>
					<h2>이용약관</h2><br/>
					<div style="margin-bottom: 5px">
						<textarea name="policy" cols="120" rows="5">aㄴ여하세요 저는 이은지입니다 우하하하하후하하하하하핳하우리는통합쿠폰제를실시합니다하하하으하하ㅏ흐아크크크ㅡㅋ캬캬ㅑ
						</textarea>
					</div>
					<input type="checkbox" value="agree" /> 약관에 동의합니다.
					<p class="center">
					<div class="form-actions">
						<input type="submit" class="btn btn-primary" value="가입" id="ga"/>
					</div>
				</div>
			</form>
		</div>
		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>