<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%
	//DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/wp_test";
	String dbUser = "slaej1228";
	String dbPassword = "tiger";

	request.setCharacterEncoding("utf-8");
	String user_id = (String)session.getAttribute("id");
	String price = request.getParameter("price");
	String name = request.getParameter("pname");
	String category = "p";
	String desc = request.getParameter("desc");
	
	List<String> errorMsgs = new ArrayList<String>();
	int result = 0;

	if (name == null || name.length()==0) {
		errorMsgs.add("피자명을 입력해주세요");
	}
	if (price==null || price.length()==0) {
		errorMsgs.add("가격을 입력해주세요");
	}
	
	if (desc==null || desc.length()==0){
		errorMsgs.add("설명을 입력해주세요");
	}
	if (errorMsgs.size() == 0) {
		try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
	stmt = conn
			.prepareStatement("INSERT INTO menus(user_id, name, price, description,category)"
					+ "VALUES(?,?,?,?,?)"
					);
	stmt.setString(1, user_id);
	stmt.setString(2, name);
	stmt.setString(3, price);
	stmt.setString(4, desc);
	stmt.setString(5, category);
	result = stmt.executeUpdate();
	
	if (result != 1) {
		errorMsgs.add("등록에 실패하였습니다.");
	}
	
		} catch (SQLException e) {
	errorMsgs.add("SQL 에러" + e.getMessage());
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
		if (errorMsgs.size() > 0) {
	%>
	<script>
				alert("<%=errorMsgs.get(0)%>");
				history.back();
			</script>
	<%
		} else if (result == 1) {
	%>
	<script>
	alert("<%=name%> 피자를 등록해주셔서 감사합니다. ");
	document.location.href = "add_pizza.jsp";
	</script>
	<%
		}
	%>
</body>
</html>