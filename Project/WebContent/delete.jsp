<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<%
	String errorMsg = null;
	int result = 0;

	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/wp";
	String dbUser = "jasd1622";
	String dbPassword = "asd1622";

	request.setCharacterEncoding("utf-8");

	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {
	}
	try {
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement("DELETE FROM users WHERE id=?");
		stmt.setString(1, (String) session.getAttribute("id"));

		result = stmt.executeUpdate();
		if (result != 1) {
			errorMsg = "삭제에 실패했습니다.";
		}
	} catch (SQLException e) {
		errorMsg = "SQL 에러: " + e.getMessage();
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
	<div id="wrap" style="width: 930px; margin: 0px auto;">
		<jsp:include page="share/header.jsp"></jsp:include>
		<div id="content">
			<%
				if (errorMsg != null) {
			%>
			<div class="alert alert-error">
				<h3>Errors:</h3>
				<%=errorMsg%>
			</div>
			<%
				} else {
			%>
			<%
				session.invalidate();
			%>
			<script type="text/javascript">
				alert("사용자 정보를 삭제하였습니다.");
				document.location.href = "Main.jsp";
			</script>
		</div>
		<%
			}
		%>
		<div id="form-action">
			<a href="Main.jsp" class="btn">목록으로</a>
		</div>
	</div>
	<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>