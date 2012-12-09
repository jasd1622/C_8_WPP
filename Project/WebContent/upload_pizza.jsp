<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%
	// DB ������ ���� �غ�
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/wep_c_8";
	String dbUser = "web";
	String dbPassword = "asdf";
	
	request.setCharacterEncoding("utf-8");

	// Request�� ID�� �ִ��� Ȯ��
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
		errorMsgs.add("���� �̸��� �ݵ�� �Է����ּ���.");
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
				errorMsgs.add("���濡 �����Ͽ����ϴ�.");
			}
		} catch (SQLException e) {
			errorMsgs.add("SQL ����: " + e.getMessage());
		} finally {
			// ���� ���� �־ ���ҽ��� ����� ����
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
<title>���� ���ε�</title>
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
alert("<%=userid%>�� ������ּż� �����մϴ�. ");
document.location.href = "Main.jsp";
</script>
<%
}
%>

</body>
</html>