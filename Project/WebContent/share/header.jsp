<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/header.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="log">
	<%if(session.getAttribute("id")==null){ %>
		<a href="log.jsp">로그인</a> |
		<a href="join_sort.jsp">회원가입</a>
		<%} else {%>
		<a href="buyer_private2.jsp"><%=session.getAttribute("id") %></a>님 반갑습니다. |
		<a href="logout.jsp">로그아웃</a>
		<%} %>
	</div>
	<div id="top">
		<div id="logo"><h1>
			<img src="img/pz.gif" alt="로고"/>
		</h1></div>
		<form action="">
			<input type="text" name="searchbox" id="searchbox"/>
			<input type="submit" value="Search" id="searchbt"/>
		</form>
		</div>
		<div id="header">
			<div id="navbar">
				<ul>
					<li><a href="">메뉴판</a></li>
					<li><a href="">장바구니</a></li>
					<li><a href="postscript1.html">고객의 소리</a></li>
				</ul>
			</div>
		</div>
</body>
</html>