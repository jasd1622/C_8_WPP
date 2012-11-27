<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%session.invalidate(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrap" style="width:930px; margin:0px auto;">
	<jsp:include page="header.jsp"></jsp:include>
	<div id="content">
	<b>로그아웃 되었습니다.</b>
	<a href="Main.jsp">메인으로</a>	
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>