<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%
	//DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/wp";
	String dbUser = "jasd1622";
	String dbPassword = "asd1622";

	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	String pwd_conf = request.getParameter("pwd2");
	String name = request.getParameter("name");
	String address = request.getParameter("add");
	String phone1 = request.getParameter("phone");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String grade = request.getParameter("grade");
	String checkbox = request.getParameter("agree");

	List<String> errorMsgs = new ArrayList<String>();
	int result = 0;

	if (userid == null || userid.trim().length() == 0) {
		errorMsgs.add("ID를 반드시 입력하시오.");
	}
	if (pwd == null || pwd.length() < 6) {
		errorMsgs.add("비밀번호는 6자 이상 입력해주세요.");
	}
	if (!pwd.equals(pwd_conf)) {
		errorMsgs.add("비밀번호가 일치하지 않습니다.");
	}
	if (phone2.length() == 0 && phone3.length() == 0) {
		errorMsgs.add("전화번호를 입력해주세요");
	}
	if ((phone2.length() < 3 && phone2.length() > 0)
	|| (phone3.length() < 3 && phone3.length() > 0)) {
		errorMsgs.add("전화번호를 다시 입력해주세요.");
	}
	if (checkbox == null) {
		errorMsgs.add("약관에 동의하셔야 합니다.");
	}
	if (errorMsgs.size() == 0) {
		try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(dbUrl, dbUser,
			dbPassword);
	stmt = conn
			.prepareStatement("INSERT INTO users(id, pwd,name, address, phone1,phone2,phone3,grade)"
					+ "VALUES(?,?,?,?,?,?,?,?)"
					);
	stmt.setString(1, userid);
	stmt.setString(2, pwd);
	stmt.setString(3, name);
	stmt.setString(4, address);
	stmt.setString(5, phone1);
	stmt.setString(6, phone2);
	stmt.setString(7, phone3);
	stmt.setString(8,grade);
	result = stmt.executeUpdate();
	
	if (result != 1) {
		errorMsgs.add("등록에 실패하였습니다.");
	}
	if(grade.equals("B")){
		stmt=conn.prepareStatement("INSERT INTO coupons(user_id)"+"VALUES(?)");
		stmt.setString(1,userid);
		
		result = stmt.executeUpdate();
		
		if (result != 1) {
			errorMsgs.add("등록에 실패하였습니다.");
		}
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
	alert("<%=userid%>님 등록해주셔서 감사합니다. ");
	document.location.href = "Main.jsp";
	</script>
	<%
		}
	%>
</body>
</html>