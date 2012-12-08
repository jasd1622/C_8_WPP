<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%
	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/wp";
	String dbUser = "jasd1622";
	String dbPassword = "asd1622";

	request.setCharacterEncoding("utf-8");
	String n_add = request.getParameter("address");
	String n_phone1 = request.getParameter("phone1");
	String n_phone2 = request.getParameter("phone2");
	String n_phone3 = request.getParameter("phone3");
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
	if (n_phone2.length() == 0 && n_phone3.length() == 0) {
		errorMsgs.add("전화번호를 입력해주세요");
	}
	if ((n_phone2.length() < 3 && n_phone2.length() > 0)
			|| (n_phone3.length() < 3 && n_phone3.length() > 0)) {
		errorMsgs.add("전화번호를 다시 입력해주세요.");
	}
	if(pwd==null || pwd.trim().length()==0){
	}
	else{
		if (!userpwd.equals(pwd)) {
			errorMsgs.add("현재 비밀번호가 일치하지 않습니다.");
		}	
		if (userpwd.equals(pwd)) {
			if(n_pwd==null || n_pwd.length()<6){
				errorMsgs.add("새로운 비밀번호를 6자 이상 입력해주세요.");
			}
			if (pwd.equals(n_pwd)) {
				errorMsgs.add("기존 비밀번호와 새로운 비밀번호가 같습니다.");
			}
		}
		if (!pwd.equals(n_pwd)) {
			if(n_pwd_conf==null || n_pwd_conf.trim().length()==0){
				errorMsgs.add("확인 비밀번호를 입력해주세요.");
			}
			if (!n_pwd.equals(n_pwd_conf)) {
				errorMsgs.add("새로운 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			}
		}
	}
	if (errorMsgs.size() == 0) {
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser,
					dbPassword);
			stmt = conn.prepareStatement("UPDATE users "
					+ "SET address=?, phone1=?, phone2=?, phone3=?, pwd=?" + "WHERE id=?");
			stmt.setString(1, n_add);
			stmt.setString(2, n_phone1);
			stmt.setString(3, n_phone2);
			stmt.setString(4, n_phone3);
			if(pwd == null || pwd.trim().length() == 0){
				stmt.setString(5,userpwd);
			}
			else{
				stmt.setString(5, n_pwd);
			}
			stmt.setString(6, userid);

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
			<script>
			alert("<%=errorMsgs.get(0)%>");
			history.back();
			</script>
			<%
				} else if (result == 1) {
			%>
			<script>
				alert("<%=session.getAttribute("id")%>님의 정보가 수정되었습니다.");
				document.location.href="Main.jsp";
			</script>
			<%
				}
			%>
		</div>
		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>