<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>

<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String userid = request.getParameter("id");
	String userpwd = request.getParameter("pwd");
	String id = "";
	String pwd = "";
	String address = "";
	String phone1 = "";
	String phone2 = "";
	String phone3 = "";
	String grade = "";

	String dbUrl = "jdbc:mysql://localhost:3306/wp_test";
	String dbUser = "slaej1228";
	String dbPassword = "tiger";
	boolean isSuccess = false;

	List<String> errorMsgs = new ArrayList<String>();
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement("SELECT * FROM users WHERE id=?");
		stmt.setString(1, userid);

		rs = stmt.executeQuery();
		if (rs.next()) {
			id = rs.getString("id");
			pwd = rs.getString("pwd");
			if (userpwd.equals(pwd)) {
				isSuccess = true;
				address = rs.getString("address");
				phone1 = rs.getString("phone1");
				phone2 = rs.getString("phone2");
				phone3 = rs.getString("phone3");
				grade = rs.getString("grade");
			} else {
				isSuccess = false;
			}
		}
		if (!userid.equals(id)) {
			errorMsgs.add("아이디가 존재하지 않습니다.");
		}
		else{
		if (!userpwd.equals(pwd)) {
			errorMsgs.add("비밀번호가 일치하지 않습니다.");
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
	<%
		if (isSuccess) {
			session.setAttribute("id", id);
			session.setAttribute("pwd", userpwd);
			session.setAttribute("address", address);
			session.setAttribute("phone1", phone1);
			session.setAttribute("phone2", phone2);
			session.setAttribute("phone3", phone3);
			session.setAttribute("grade", grade);
			response.sendRedirect("Main.jsp");
		} else {
			if (errorMsgs.size() > 0) {
	%>
	<script>
		alert("<%=errorMsgs.get(0)%>");
		history.back();
		</script>
	<%
		}
		}
	%>
</body>
</html>