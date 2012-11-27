<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
    import="org.apache.commons.lang3.StringUtils"
%>
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
		<%}else if(tempid.equals("jasd1622") && temppwd.equals("asd1622")){
				session.setAttribute("id","jasd1622");
				response.sendRedirect("Main.jsp");
		}else{
				if(!tempid.equals("userid")){%>
				<div class="error">아이디가 잘못되었습니다.</div>
		<%}else{%>
				<div class="error">비밀번호가 잘못되었습니다.</div>
		<%}
		}
}
%>
<div id="wrap" style="width:930px; margin:0px auto;">
	<jsp:include page="header.jsp"></jsp:include>
	<div id="content">
	<div id="write">로그인</div>
		<div id="center_content">
			<div id="pic">
				<img src="suji.png" alt="로고" style="width:300px">
			</div>
			<span id="insert">
				<form method="post">
					<span><b>아이디</b>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="id" maxlength=12 style="width:150px; height:25px;padding-left:3px"/></span>
					<br/><br/>
					<span id="pwd"><b>비밀번호</b>&nbsp;
					<input type="password" name="pwd" style="width:150px;height:25px;margin-top:7px;padding-left:3px"/></span>
			</span>
			<div id="btn1">
				<input type="submit" name="submit" value="로그인" style="width:70px;height:35px"/></form>
			</div>
			<div id="href">
				<a href="join_sort.jsp">회원가입</a>
				<a href="" style="margin-left:13px">ID/PW찾기</a>
			</div>
			</div>		
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>