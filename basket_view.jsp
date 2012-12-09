<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"
	import="java.util.ArrayList"%>
<%
	int total = 0;
	String[] buylist=null;
	List<Integer> pricelist = new ArrayList<Integer>();
	buylist=request.getParameterValues("buylist");
	List<String> errorMsgs = new ArrayList<String>();
	int i = 0;
	int coupons=0;
	int select=0;
	String name="";
	//String name=(String)session.getAttribute("name");
	//String price=(String)session.getAttribute("price");
	StringTokenizer Name=null;
	StringTokenizer Price=null;
	ArrayList list=(ArrayList)session.getAttribute("productlist");
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	int result = 0;

	String dbUrl = "jdbc:mysql://localhost:3306/wp";
	String dbUser = "jasd1622";
	String dbPassword = "asd1622";
	
	if(session.getAttribute("id")==null){
		select=0;
		errorMsgs.add("로그인");
	}
	if(errorMsgs.size()==0){
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		stmt=conn.prepareStatement("SELECT * FROM coupons WHERE user_id=?");
		stmt.setString(1,(String)session.getAttribute("id"));
		rs=stmt.executeQuery();
		if(rs.next()){
		coupons=rs.getInt("count");
		}
		for(i=0;i<list.size();i++){
	stmt=conn.prepareStatement("SELECT * FROM menus WHERE name=?");
	stmt.setString(1,(String)list.get(i));
		
		rs=stmt.executeQuery();
		if(rs.next()){
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
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="CSS/basket.css" rel="stylesheet" type="text/css">
<link href="CSS/etc.css" rel="stylesheet" type="text/css">
<link href="CSS/basket.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
	function pur() {
		session.setAttribute("productlist", list);
	}
</script>
<body>
	<div id="wrap" style="width: 930px; margin: 0px auto;">
		<jsp:include page="share/header.jsp" />
		<%
			if(errorMsgs.size()>0){
				if(select==0){
		%>
		<script>
			alert("로그인해주세요.");
			document.location.href = "log.jsp";
		</script>
		<%}} %>
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
							if (list == null) {
						%>
						<tr>
							<td colspan="3">장바구니가 비어있습니다.</td>
						</tr>
						<%
							} else {
										for (i = 0; i < list.size(); i++) {
											name = (String) list.get(i);
						%>
						<tr>
							<td><%=list.get(i)%></td>
							<td><%=pricelist.get(i)%></td>
							<td><a href="basket_del.jsp?name="
								+<%=(String) list.get(i)%>>삭제</a></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<%
							}
				%>
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
					<a href="purchase.jsp" class="btn btn-primary" onclick="pur()">구매</a>
					<a href="menu.jsp" class="btn btn-primary">메뉴로</a>
				</center>
			</div>
		</div>
		<jsp:include page="share/footer.jsp" />
	</div>
</body>
</html>