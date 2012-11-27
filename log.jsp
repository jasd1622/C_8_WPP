<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="log.css" rel="stylesheet" type="text/css">
</head>
<body>
<%if(request.getMethod()=="POST"){
		String tempid=request.getParameter("id");
		String temppwd=request.getParameter("pwd");
		if(tempid==null || temppwd==null || tempid.length()==0 || temppwd.length()==0){%>
				<div class="error">아이디와 비밀번호를 입력하세요.</div>
				<% } else if(tempid.equals("jasd1622") && temppwd.equals("121212")){
				session.setAttribute("id","jasd1622");
				response.sendRedirect("Main.jsp");
			} else {%>
			<div class="error">아이디나 비밀버호가 잘못되었습니다.</div><%
		}
	}
%>
<div id="wrap" style="width:930px; margin:0px auto;">
	<jsp:include page="header.jsp"></jsp:include>
	<div id="content">
			<span class="head_content">
			<h1>로그인</h1>
			</span>
		<div class="center_content">
			<div id="left">
			<img src="pz.gif" width="250px" height="200px">
			</div>
			<div id="right_top">
				<h2>우리 피자 홈페이지에 오신 것을 환영합니다.</h2>
				아이디와 비밀번호를 입력하신 후 '로그인' 버튼을 클릭해 주세요.<br/>	
			</div>
			<form method="post">
			<table>
				<tbody>
				<tr>
					<th>아 이 디</th>
					<td><input type="text" name="id" style="width:140px" maxlength="12"/></td>
					<td rowspan="2"><input type="submit" value="로그인"/></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pwd" style="width:140px"/></td>
				</tr>
				<tr>
					<td colspan="3">회원가입을 하시면 다양한 서비스를 제공 받으실 수 있습니다.<a href="join_sort.html"><input type="button" value="회원가입"/></a></td>
				</tr>
				<tr>
					<td colspan="3">개인정보확인을 통해 아이디와 비밀번호를 찾을 수 있습니다.<a href=""><input type="button" value="id/pw찾기"/></a></td>
				</tr>
			</tbody>
		</table>
		</form>
			</div>		
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>