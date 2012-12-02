<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
    import="org.apache.commons.lang3.StringUtils"%>
<%
	Connection conn=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	
	String dbUrl="jdbc:mysql://localhost:3306/wp";
	String dbUser="root";
	String dbPassword="asd1622";
	
	String id=(String)session.getAttribute("id");
	int coupons=0;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt = conn.prepareStatement("SELECT * FROM coupons WHERE id=?");
		stmt.setString(1,id);

		rs = stmt.executeQuery();
		if(rs.next()){
			coupons=rs.getInt("count");
		}
	}catch(SQLException e){
	}
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
<link rel="stylesheet" type="text/css" href="css/buyer_private1.css">
<link rel="stylesheet" type="text/css" href="css/seller_private_1_3.css">
</head>
<body>
<div id="wrap" style="width:930px; margin:0px auto;">
	<jsp:include page="share/header.jsp"></jsp:include>
		<div id="content" style="width:98%;	margin:0 auto;margin-top:50px;">
			<%if(session.getAttribute("grade").equals("B")){ %>
			<jsp:include page="share/buyer_nav.jsp"/>
			<%}else{ %>
			<jsp:include page="share/seller_nav.jsp"/>
			<%} %>
			<div id="main_con">
					<table border="3" class="table1">
					<thead>
						<tr>
							<th>상품명</th>
							<th>개수</th>
							<th>가격</th>
							<th>확인여부</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<%if(session.getAttribute("grade").equals("B")){ %>
				<div id="coupons">
					<b>* 쿠폰 *</b>
				</div>
				<table border="3" class="table2" id="cou">
					<tr>
						<th>쿠폰 개수</th>
						<td><%=coupons%></td>
						<th>사용 여부</th>
						<td><%if(coupons<10){%>
							No
							<%}else{ %>
							Yes
							<%} %>
						</td>
					</tr>
				</table>
				<%}else{ %>
					<div id="select">
					<form action="">
						<input type="radio" name="select" value="day" class="select1" /><b>날짜별</b>
						<input type="radio" name="select" value="month" class="select1" /><b>월별</b>
					</form>
				</div>
				<table border="3" class="table2">
					<tr>
						<th>합계</th>
						<td colspan="4"></td>
					</tr>
				</table>
				<%} %>
			</div>
		</div>				
	<jsp:include page="share/footer.jsp"></jsp:include>
</div>
</body>
</html>