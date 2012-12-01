<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%@ page errorPage="error.jsp"%>
<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String userid = request.getParameter("id");
	String userpwd = request.getParameter("pwd");
	String id = "";
	String pwd = "";
	String address = "";
	String phone = "";
	String grade = "";

	String dbUrl = "jdbc:mysql://localhost:3306/wp";
	String dbUser = "root";
	String dbPassword = "asd1622";
	boolean isSuccess = false;

	List<String> errorMsgs = new ArrayList<String>();
	if (!userid.equals(id)) {
		errorMsgs.add("아이디가 존재하지 않습니다.");
	}
	if (userid.equals(id)) {
		if (!userpwd.equals(pwd)) {
			errorMsgs.add("비밀번호가 일치하지 않습니다.");
		}
	}
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement("SELECT * FROM users WHERE id=?");
		stmt.setString(1, userid);

		rs = stmt.executeQuery();
		if (rs.next()) {
			pwd = rs.getString("pwd");
			if (userpwd.equals(pwd)) {
				isSuccess = true;
				id = rs.getString("id");
				address = rs.getString("address");
				phone = rs.getString("phone");
				grade = rs.getString("grade");
			} else {
				isSuccess = false;
			}
		}
	} catch (SQLException e) {
		errorMsgs.add("SQL 에러: " + e.getMessage());
	} finally {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException e) {
			}
		if (stmt != null)
			try {
				stmt.close();
			} catch (SQLException e) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
			}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=isSuccess%>
	<%
		if (isSuccess) {
			session.setAttribute("id", userid);
			session.setAttribute("pwd", userpwd);
			session.setAttribute("address", address);
			session.setAttribute("phone", phone);
			session.setAttribute("grade", grade);
			response.sendRedirect("Main.jsp");
		} else {
			if (errorMsgs.size() > 0) {
	%>
	<div class="alert alert_error">
		<h3>Errors:</h3>
		<ul>
			<%
				for (String msg : errorMsgs) {
			%>
			<li><%=msg%></li>
			<%
				}
			%>
		</ul>
		<%
			response.sendRedirect("log.jsp");
		%>
	</div>
	<%
		}
		}
	%>
</body>
</html>