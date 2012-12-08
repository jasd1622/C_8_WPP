<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%
	int total = 0;
	//List<String> buylist = new ArrayList<String>();
	String[] buylist=null;
	List<Integer> pricelist = new ArrayList<Integer>();
	buylist=request.getParameterValues("buylist");
	int i = 0;
	int coupons=0;

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	int result = 0;

	String dbUrl = "jdbc:mysql://localhost:3306/wp";
	String dbUser = "jasd1622";
	String dbPassword = "asd1622";
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt=conn.prepareStatement("SELECT * FROM coupons WHERE user_id=?");
		stmt.setString(1,(String)session.getAttribute("id"));
		rs=stmt.executeQuery();
		if(rs.next()){
		coupons=rs.getInt("count");
		}

		for (i = 0;buylist[i]!=null; i++) {
	stmt = conn
			.prepareStatement("SELECT * FROM menus WHERE name=?");
	stmt.setString(1, buylist[i]);
	rs = stmt.executeQuery();
	if (rs.next()) {
		pricelist.add(rs.getInt("price"));
	}
		}
	} catch (SQLException e) {
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="CSS/basket.css" rel="stylesheet" type="text/css">
<link href="css/etc.css" rel="stylesheet" type="text/css">
<link href="css/basket.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
</script>
<body>
	<div id="wrap" style="width: 930px; margin: 0px auto;">
		<jsp:include page="share/header.jsp" />
		<div id="content">
			<div class="center_content">
				<table class="t">
					<thead>
						<tr>
							<th>제품명</th>
							<th>금액</th>
							<th>삭제하기</th>
						</tr>
					</thead>
					<tbody>
						<%
							i = 0;
							while (true) {
								if (buylist[i]!=null) {
						%>
						<tr>
							<td><%=buylist[i]%></td>
							<td><%=pricelist.get(i)%></td>
							<td><input type="checkbox" value="del" /></td>
						</tr>
						<%
							i++;
								} else {
									break;
								}
							}
						%>

					</tbody>
				</table>

				<table class="t">
					<tr>
						<th>쿠폰이름</th>
						<th>개수</th>
						<th>사용 여부</th>
					</tr>
					<tr>
						<td>통합쿠폰</td>
						<td><%=coupons%></td>
						<%
							if (coupons < 10) {
						%>
						<td>No</td>
						<%
							} else {
						%>
						<td>Yes</td>
						<%
							}
						%>
					</tr>
				</table>
				<center>
					<a href="" class="btn btn-primary">구매</a>&nbsp&nbsp&nbsp <a href="" class="btn btn-primary">삭제</a>
					&nbsp&nbsp&nbsp 
						<a href="menu.jsp"class="btn btn-primary">돌아가기</a>
				</center>
			</div>
		</div>
		<jsp:include page="share/footer.jsp" />
	</div>
</body>
</html>