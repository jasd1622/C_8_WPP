<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="CSS/header.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="log">
	<%if(session.getAttribute("id")==null){ %>
		<a href="log.jsp">로그인</a> |
		<a href="join_sort.jsp">회원가입</a>
		<%} else {%>
		<a href="private1.jsp"><%=session.getAttribute("id") %></a>님 반갑습니다. |
		<a href="logout.jsp">로그아웃</a>
		<%} %>
	</div>
	<div id="top">
		<div class="plogo"><h1>
			<a href="Main.jsp"><img src="IMG/pz.gif" alt="로고"/></a>
		</h1></div>
		<form action="">
			<input type="text" name="searchbox" id="searchbox"/>
			<input type="submit" value="Search" class="btn"/>
		</form>
		</div>
		<div id="header">
			<div id="navbar">
				<ul>
					<li><a href="menu.jsp">피자메뉴</a></li>
					<li><a href="side.jsp">사이드메뉴</a></li>
					<li><a href="basket_view.jsp">장바구니</a></li>
				</ul>
			</div>
		</div>
</body>
</html>