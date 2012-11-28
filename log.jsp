<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
    import="org.apache.commons.lang3.StringUtils"
%>
<%--<%
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	String errorMsg = null;
	
	String dbUrl="jdbc:mysql://localhost3306:wp";
	String dbUser="jasd1622";
	String dbPassword="asd1622";
	
	String userid="";
	String userpwd="";
	
	if(request.getMethod=="POST"){
		userid=request.getParameter("id");
		userid=request.getParameter("pwd");
	}
	
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {
		errorMsg = "SQL 에러  :  " + e.getMessage();
	}

	if (id > 0) {
		try {
		    Class.forName("com.mysql.jdbc.Driver");

		    // DB 접속
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

			stmt = conn.createStatement();
			// 수행
	 		rs = stmt.executeQuery("SELECT * FROM users");

			if (rs.next()) {
				userid = rs.getString("id");
				userpwd=rs.getString("pwd");
				
			}
		}catch (SQLException e) {
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
%>--%>
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
				session.setAttribute("pwd","asd1622");
				session.setAttribute("address","서울시 노원구");
				session.setAttribute("phone","029716754");
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