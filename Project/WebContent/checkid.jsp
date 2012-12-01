<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%
	boolean isExist = false;
	String userid = request.getParameter("id");
	String phone = "";
	String grade = "";

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/wp";
	String dbUser = "root";
	String dbPassword = "asd1622";
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");

	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement("SELECT * FROM users WHERE id=?");
		stmt.setString(1, userid);

		rs = stmt.executeQuery();
		if (rs.next()) {
			isExist = true;
		} else {
			isExist = false;
		}

	} catch (SQLException e) {
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
	<table border="1" style="margin:0 auto; text-align:center; width:230px ;height:60px; border-collapse:collapse; margin-top:30px;">
		<tr><td>신청 ID : <%=id%></td></tr>
		<tr>
		<%
			if (isExist) {
		%>
		<td>사용할수 없는 아이디입니다.</td>
		<%
			}
			if (!isExist) {
		%>
		<td>사용 가능한 아이디입니다.</td>
		<%=grade%>
		<%
			}
		%>
		</tr>
	</table>
</body>
</html>