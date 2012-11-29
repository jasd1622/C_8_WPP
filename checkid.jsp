<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*" 
    import="org.apache.commons.lang3.StringUtils"%>
<%
	boolean isExist=false;
	String userid=request.getParameter("id");
	String phone="";
	
	Connection conn=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	
	String dbUrl="jdbc:mysql://localhost:3306/wp";
	String dbUser="root";
	String dbPassword="asd1622";
	request.setCharacterEncoding("utf-8");
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(dbUrl,dbUser,dbPassword);
		stmt=conn.prepareStatement("SELECT * FROM users WHERE id=?");
		stmt.setString(1,userid);
		
		rs=stmt.executeQuery();
		if(rs.next()){
			isExist=true;
		}
		else{
			isExist=false;
		}
			
	}catch(SQLException e){}
	finally{
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
</head>
<body>
<table width="228" border="0" cellspacing="1" cellpadding="3" height="51">
<tr>
<td height="25" text-align="center">
신청 ID : <%=userid %>
</td>
</tr>
<tr>
<td height="25" text-align="center">
	<%if(isExist){%>
		사용할수 없는 아이디입니다.
	<%} if(!isExist){%>
		사용 가능한 아이디입니다.
	<%}%>
		<input type="button" onclick="history.back();" value="뒤돌아가기"/>
</td>
</tr>
</table>
</body>
</html>