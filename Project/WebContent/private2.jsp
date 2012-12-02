<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%
	String actionUrl = "";
	if (session.getAttribute("id") != null) {
		actionUrl = "update.jsp";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8 http-equiv=" Content-Type" content="text/html;">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/buyer_private2.css">
</head>
<script type="text/javascript">
	function del() {
		var del;
		del=confirm("정말로 탈퇴하시겠습니까?");
		if(del==true){
			location.href="delete.jsp";
		}
		else{
			alert("취소되었습니다.");
		}
	}
</script>
<body>
	<div id="wrap" style="width: 930px; margin: 0px auto;">
		<jsp:include page="share/header.jsp"></jsp:include>
		<div id="content"
			style="width: 98%; margin: 0 auto; margin-top: 50px;">
			<jsp:include page="share/buyer_nav.jsp" />
			<form action="<%=actionUrl%>" method="post">
				<div id="main_con">
					<table border="3" class="table1">
						<tr>
							<th>아이디</th>
							<td><%=session.getAttribute("id")%></td>
						</tr>
						<tr>
							<%
								if (session.getAttribute("grade").equals("S")) {
							%>
							<th>가게 주소</th>
							<%
								} else {
							%>
							<th>주소</th>
							<%
								}
							%>
							<td><input type="text" name="address" id="pass"
								value=<%=session.getAttribute("address")%> /></td>
						</tr>
						<tr>
							<%
								if (session.getAttribute("grade").equals("S")) {
							%>
							<th>가게 전화번호</th>
							<%
								} else {
							%>
							<th>휴대폰 번호</th>
							<%
								}
							%>
							<td><input type="text" name="phone" id="pass"
								value=<%=session.getAttribute("phone")%> /></td>
						</tr>
					</table>
					<table border="3" class="table2">
						<tr>
							<th>현재 비밀번호</th>
							<td><input type="password" name="cu_pw" id="pass" /> <b>현재
									사용중인 비밀번호를 입력하시오.</b></td>
						</tr>
						<tr>
							<th>새로운 비밀번호</th>
							<td><input type="password" name="new_pw" id="pass" /> <b>새로운
									비밀번호를 4자~20자 사이로 입력해주세요.</b></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="password" name="new2_pw" id="pass" /> <b>새롭게
									사용할 비밀번호를 한 번 더 입력해주세요.</b></td>
						</tr>
					</table>
					<div id="btn">
						<input type="submit" value="수정" class="btn1" /> <input
							type="button" value="취소" class="btn1" /> <input type="button"
							value="회원탈퇴" class="btn1" onclick="del()" />
					</div>
				</div>
			</form>
		</div>
		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>
