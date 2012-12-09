<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%
	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/wep_c_8";
	String dbUser = "web";
	String dbPassword = "asdf";
	
	request.setCharacterEncoding("utf-8");

	// Request로 ID가 있는지 확인
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {}
	String user_id = request.getParameter("user_id");
	String name = request.getParameter("name");
	String categorys = request.getParameter("categorys");
	String description = request.getParameter("description");
	String price = request.getParameter("price");
	List<String> errorMsgs = new ArrayList<String>();
	int result = 0;
	
	
	if (name == null || name.trim().length() == 0) {
		errorMsgs.add("피자 이름을 반드시 입력해주세요.");
	}

	if (errorMsgs.size() == 0) {
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement(
					"UPDATE menus " +
					"SET  name=?, categorys=?, description=?, price=?" +
					"WHERE id=?"
					);
			stmt.setString(1,  name);
			stmt.setString(2,  categorys);
			stmt.setString(3,  description);
			stmt.setString(4,  price);
			stmt.setString(5,  id);
			result = stmt.executeUpdate();
			if (result != 1) {
				errorMsgs.add("변경에 실패하였습니다.");
			}
		} catch (SQLException e) {
			errorMsgs.add("SQL 에러: " + e.getMessage());
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>피자 업로드</title>
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