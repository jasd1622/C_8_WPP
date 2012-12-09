<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	String user_id=(String)session.getAttribute("id");
	List<String> shopid = new ArrayList<String>();
	ArrayList list=(ArrayList)session.getAttribute("productlist");
	List<String> errorMsgs = new ArrayList<String>();
	int i=0;
	int result=0;
	
	String dbUrl = "jdbc:mysql://localhost:3306/wp";
	String dbUser = "jasd1622";
	String dbPassword = "asd1622";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		for(i=0;list.get(0)!=null;i++){
			stmt = conn.prepareStatement("SELECT * FROM menus WHERE name=?");
			stmt.setString(1, (String)list.get(0));
			
			rs=stmt.executeQuery();
			if(rs.next()){
				shopid.add(rs.getString("user_id"));
			}
		}
		for(i=0;i<shopid.size();i++){
			stmt = conn.prepareStatement("INSERT INTO orders(user_id,shop_id)"+"VALUES(user_id,shopid.get(i))");
			result=stmt.executeUpdate();
			if(result!=1){
				errorMsgs.add("등록에 실패하였습니다.1");
			}
		}
	}catch(SQLException e){errorMsgs.add("SQL 에러: "+e.getMessage());}
	finally{
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
	<%if(errorMsgs.size()>0){ %>
	<script>
	alert("<%=errorMsgs.get(0) %>");
	history.back(-1);
	</script>
	<%}else{ %>
	<script>
		alert("구매가 완료되었습니다.");
		documnet.location.href="private1.jsp";
		</script>
	<%} %>
</body>
</html>