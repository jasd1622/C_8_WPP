<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/wp_test";
	String dbUser = "slaej1228";
	String dbPassword = "tiger";
	int pageNo = 1;
	int number = 0;
	int num = 0;
	String name="";

	try {
		pageNo = Integer.parseInt(request.getParameter("page"));
	} catch (NumberFormatException ex) {
	}

	int numInPage = 9, numInRow = 3;
	int startPos = (pageNo - 1) * numInPage;
	int numItems, numPages;
	request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="menu.css" rel="stylesheet" type="text/css">
<link href="bootstrap.min.css" rel="stylesheet">
</head>
<script type="text/javascript">
	function dc(value) {
		window.open("menuin.jsp?name="+value,"check",
				"width=500px,height=500px,top=250px,left=600px");
	}
</script>
<body>
	<div id="wrap" style="width: 930px; margin: 0px auto;">
		<jsp:include page="share/header.jsp"></jsp:include>

		<%
		
			try {
				Class.forName("com.mysql.jdbc.Driver");

				// DB 접속
				conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

				stmt = conn.createStatement();
				rs = stmt.executeQuery("SELECT COUNT(*) FROM menus");
				rs.next();
				numItems = rs.getInt(1);
				numPages = (int) Math.ceil((double) numItems
						/ (double) numInPage);
				rs.close();
				stmt.close();

				stmt = conn.createStatement();
				rs = stmt.executeQuery("SELECT * FROM menus LIMIT " + startPos
						+ ", " + numInPage);
		%>
		<div id="content">
			<div class="center_content">
				<span id="order"> Total <b><%=numItems%></b> menus
				</span>
							<form method="post" action="menuin.jsp" >
				<table class="t">
					<tbody>

						<%
							while (num <= numInPage) {
									num++;
						%>
						<tr>
							<%
								while (number < numInRow && rs.next()) {
									name=rs.getString("name"); %>
							<th>
							<ul>
							<li style="margin:10px"><a href="javascript:dc('<%=name %>');"><img src="img/pizza1.gif"></a></li>
								<li>피자명 : <%=rs.getString("name") %><br/></li>
								<li>가격 : <%=rs.getString("price")%></li>
								<li style="margin:5px"><a href="basket_view.jsp?name=<%=name %>&price=<%=rs.getString("price") %>" class="btn btn-danger">장바구니</a></li>
							</ul></th>
							<%
								num++;
											number++;
										}
							%>
						</tr>
						<%
							number = 0;
								}
						%>
					</tbody>
				</table>
					</form>
					<div class="pagination pagination-centered">
				<ul>
					<%
						// 페이지 네비게이션을 위한 준비
							int startPageNo, endPageNo;
							int delta = 5;
							startPageNo = (pageNo <= delta) ? 1 : pageNo - delta;
							endPageNo = startPageNo + (delta * 2) + 1;

							if (endPageNo > numPages) {
								endPageNo = numPages;
							}

							// 이전 페이지로
							if (pageNo <= 1) {
					%>
					<li class="li"><a href="#">&laquo;</a></li>
					<%
						} else {
					%>
					<li class="li"><a href="menu.jsp?page=<%=pageNo - 1%>">&laquo;</a></li>
					<%
						}

							// 페이지 목록 출력 (현재-delta ~ 현재+delta까지)
							String className = "";
							for (int i = startPageNo; i <= endPageNo; i++) {
								className = (i == pageNo) ? "active" : "";
								out.println("<li class='" + className + "'>");
								out.println("<a href='menu.jsp?page=" + i + "'>" + i
										+ "</a>");
								out.println("</li>");
							}

							// 다음 페이지로
							if (pageNo >= numPages) {
					%>
					<li class="li"><a href="#">&raquo;</a></li>
					<%
						} else {
					%>
					<li class="li"><a href="menu.jsp?page=<%=pageNo + 1%>">&raquo;</a></li>
					<%} %>
				</ul>
					<%
						} catch (SQLException e) {
							// SQL 에러의 경우 에러 메시지 출력
							out.print("<div class='alert'>" + e.getLocalizedMessage()
									+ "</div>");
						} finally {
							// 무슨 일이 있어도 리소스를 제대로 종료
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
			</div>
		</div>
		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>