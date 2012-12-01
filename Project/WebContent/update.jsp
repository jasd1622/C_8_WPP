<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%
	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/wp";
	String dbUser = "root";
	String dbPassword = "asd1622";

	request.setCharacterEncoding("utf-8");
	String n_add = request.getParameter("address");
	String n_phone = request.getParameter("phone");
	String pwd = request.getParameter("cu_pw");
	String n_pwd = request.getParameter("new_pw");
	String n_pwd_conf = request.getParameter("new2_pw");
	String userid = (String) session.getAttribute("id");
	String userpwd = (String) session.getAttribute("pwd");

	List<String> errorMsgs = new ArrayList<String>();
	int result = 0;

	if (n_add == null || n_add.trim().length() == 0) {
		errorMsgs.add("주소를 입력해주세요.");
	}
	if (n_phone == null || n_phone.trim().length() == 0) {
		errorMsgs.add("번호를 입력해주세요.");
	}
	if (!userpwd.equals(pwd)) {
		errorMsgs.add("현재 비밀번호가 일치하지 않습니다.");
	}
	if (userpwd.equals(pwd)) {
		if (pwd.equals(n_pwd)) {
			errorMsgs.add("기존 비밀번호와 새로운 비밀번호가 같습니다.");
		}
	}
	if (!pwd.equals(n_pwd)) {
		if (!n_pwd.equals(n_pwd_conf)) {
			errorMsgs.add("새로운 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		}
	}

	if (errorMsgs.size() == 0) {
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser,
					dbPassword);
			stmt = conn.prepareStatement("UPDATE users "
					+ "SET address=?, phone=?, pwd=?" + "WHERE id=?");
			stmt.setString(1, n_add);
			stmt.setString(2, n_phone);
			stmt.setString(3, n_pwd);
			stmt.setString(4, userid);

			result = stmt.executeUpdate();
			if (result != 1) {
				errorMsgs.add("변경에 실패하였습니다.");
			}
		} catch (SQLException e) {
			errorMsgs.add("SQL 에러: " + e.getMessage());
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8 http-equiv="Content-Type" content="text/html;">
<title>회원목록</title>
</head>
<body>
	<div id="wrap" style="width: 930px; margin: 0px auto;">
		<jsp:include page="share/header.jsp"></jsp:include>

		<div id="content">
			<%
				if (errorMsgs.size() > 0) {
			%>
			<div class="alert alert-error">
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
			</div>
			<div class="form-action">
				<input type="button" onclick="history.back();" value="뒤돌아가기" />
			</div>
			<%
				} else if (result == 1) {
			%>
			<div class="alert alert-success">
				<b><%=session.getAttribute("id")%></b>님 정보가 수정되었습니다.
			</div>
			<div class="form-action">
				<a href="Main.jsp" class="btn">목록으로</a>
			</div>
			<%
				}
			%>
		</div>
		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>