<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%
	Connection conn = null;	
	PreparedStatement stmt=null;
	ResultSet rs=null;
	int result=0;
	
	String dbUrl="jdbc:mysql://localhost:3306/wp";
	String dbUser="jasd1622";
	String dbPassword="asd1622";
	String[] buylist=request.getParameterValues("buylist");
	String[] category=null;
	List<String> errorMsgs=new ArrayList<String>();
	String id=(String)session.getAttribute("id");
	int update=0;
	int coupons=0;
	int conf_coupons=0;
	int i=0;

	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(dbUrl,dbUser,dbPassword);
		
		for(i=0;buylist[i]!=null;i++){
	stmt=conn.prepareStatement("SELECT * FROM menus WHERE name=?");
	stmt.setString(1,buylist[i]);
	
	rs=stmt.executeQuery();
	if(rs.next()){
		category[i]=rs.getString("category");
	}
		}
		for(i=0;category[i]!=null;i++){
			if(category[i]=="P"){
				update++;
	}
		}
		stmt=conn.prepareStatement("SELECT * users,coupons WHERE (users.id==coupons.id)=?");
		stmt.setString(1,id);
		
		rs=stmt.executeQuery();
		if(rs.next()){
		coupons=rs.getInt("count");
		}
		conf_coupons=coupons+update;
		stmt=conn.prepareStatement("INSERT INTO orders(user_id)"+"VALUES(?)");
		stmt.setString(1,id);
		result=stmt.executeUpdate();
		
	}catch(SQLException e){errorMsgs.add("SQL 에러: "+e.getMessage());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(errorMsgs.size()>0){
	%>
	<script>
		alert("errorMsgs.get(0)");
		history.back();
	</script>
	<%
		}else{
	%>
	<script>
		var conf = confirm("쿠폰을 사용하시겠습니까?");
		if (conf == true) {
		} else {
			<%stmt=conn.prepareStatement("UPDATE SET count=(count+update) WHERE id=?");
			stmt.setString(1,id);
			result=stmt.executeUpdate();%>
			alert("구매가 완료되었습니다. 현재 쿠폰의 개수는 <%=conf_coupons%>입니다.");
			document.location.href = "private1.jsp";
		}
	</script>
	<%
		}
	%>
	<%
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
</body>
</html>