<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
    import="org.apache.commons.lang3.StringUtils"%>
<%
	String errorMsg=null;
	String actionUrl;
	Connection conn=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	
	String dbUrl="jdbc:mysql://localhost:3306/wp_test";
	String dbUser="slaej1228";
	String dbPassword="tiger";
	
	String pname = request.getParameter("name");
	String category ="";
	String price ="";
	String seller=""; 
	String desc= "";
	
	 try {
	        Class.forName("com.mysql.jdbc.Driver");
	
	        // DB 접속
	      conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
	
	      // 질의 준비
	      stmt = conn.prepareStatement("SELECT * FROM menus WHERE name = ?");
	      stmt.setString(1, pname);
	   
	      // 수행
	      rs = stmt.executeQuery();
	      
	      if (rs.next()) {
	    	  desc=rs.getString("description");
	    	  price=rs.getString("price");
	    	  seller=rs.getString("user_id");
	    	  category=rs.getString("category");
	      }
	 }catch (SQLException e) {
	      errorMsg = "SQL 에러: " + e.getMessage();
	    } finally {
	      // 무슨 일이 있어도 리소스를 제대로 종료
	      if (rs != null) try{rs.close();} catch(SQLException e) {}
	      if (stmt != null) try{stmt.close();} catch(SQLException e) {}
	      if (conn != null) try{conn.close();} catch(SQLException e) {}
	    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="menu.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="content">
	 <%
		 if (errorMsg != null && errorMsg.length() > 0 ) {
		    // SQL 에러의 경우 에러 메시지 출력
		    out.print("<div class='alert'>" + errorMsg + "</div>");
		 } else {
	%>
	<%
		if(category.equals("p")){
	%>
	<table class="t">
		<tr>
			<th>피자사진</th>
		</tr>
		<tr>
			<td><%=pname %> <%=price %>원</td>
		</tr>
		<tr>
			<td>by <%=seller %></td>
		</tr>
		<tr>
			<td><%=desc %></td>
		</tr>
		<tr>
			<td><input type="button" value="장바구니"/></td>
		</tr>
	</table>
	<%} else { %>
	<table class="t">
		<tr>
			<th>음료사진</th>
		</tr>
		<tr>
			<td><%=pname %> <%=price %>원</td>
		</tr>
		<tr>
			<td>by <%=seller %></td>
		</tr>
		<tr>
			<td><%=desc %></td>
		</tr>
		<tr>
			<td><input type="button" value="장바구니"/></td>
		</tr>
	</table>
	
	<% } }%>	
	</div>
</body>
</html>