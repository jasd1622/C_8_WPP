<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" %>
<%
  //--------------------------------------
  // 현재 소스 코드의 문제점 및 해결책
	//    1. 매번 DB를 접속하고 DB 접속 코드들이 흩어져있음
	//       --> DBCP의 Connection Pooling과 JNDI Lookup 활용
	//    2. O-O 적이지 못하다. (모듈화, 클래스화 부재)  
	//       --> Java Bean 이용
	//    3. JSP 코드에 Java 코드가 너무 많아 유지/관리 어려움 
	//       --> JSTL과 Servlet을 이용 MVC 처리
	//    4. XSS에 대한 방어 부족
	//       --> JSTL의 <c:out> 활용
  //--------------------------------------

  // DB 접속을 위한 준비

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/wp_test";
	String dbUser = "slaej1228";
	String dbPassword = "tiger";

	// 페이지 설정
	int pageNo = 1;

	try {
		pageNo = Integer.parseInt(request.getParameter("page"));
	} catch (NumberFormatException ex) {}

	int numInPage = 10;												// 한페이지에 출력할 아이템 개수
	int startPos = (pageNo - 1) * numInPage; 	// 몇 번째 아이템 부터 이 페이지에?
	int numItems, numPages;

%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원목록</title>
</head>
<body>
<div id="wrap" style="width:930px; margin:0px auto;">
<jsp:include page="share/header.jsp"></jsp:include>

  <div id="content">	
 	<%
 	try {
	    Class.forName("com.mysql.jdbc.Driver");

	    // DB 접속
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
 		
		stmt = conn.createStatement();

		// users 테이블: user 수 페이지수 개산
 		rs = stmt.executeQuery("SELECT COUNT(*) FROM users");
		rs.next();
		numItems = rs.getInt(1);
		numPages = (int) Math.ceil((double)numItems / (double)numInPage);
		rs.close();
		stmt.close();

 		// users 테이블 SELECT
		stmt = conn.createStatement();
		rs = stmt.executeQuery("SELECT * FROM users ORDER BY name LIMIT " + startPos + ", " + numInPage);
		String gender;
 	%>
 		<div class="row">
			<div class="span12 page-info">
				<div class="pull-left">
					Total <b><%=numItems %></b> users 
				</div>
				<div class="pull-right">
					<b><%= pageNo%></b> page / total <b><%= numPages %></b> pages
				</div>
 			</div>
 		</div>
		<table class="table table-bordered table-stripped">
			<thead>
				<tr>
					<th>ID</th>
					<th>Address</th>
					<th>PhoneNumber</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			
				<tr>
					<td><a href="show.jsp?id=<%=rs.getInt("id")%>"><%=rs.getString("userid") %></a></td>
					<td><%=rs.getString("add") %></td>
					<td><%=rs.getString("phone") %></td>
					<td>
						<a href="join.jsp?id=<%=rs.getInt("id")%>" class="btn btn-mini">modify</a>
						<a href="#" class="btn btn-mini btn-danger" data-action="delete" data-id="<%=rs.getInt("id") %>" >delete</a>
					</td>
				</tr>
			</tbody>
		</table> 


		<div class="pagination pagination-centered">
      <ul>
      	<%
      	// 페이지 네비게이션을 위한 준비
      	int startPageNo, endPageNo;
      	int delta = 5;
      	startPageNo = (pageNo <= delta) ? 1: pageNo - delta;
      	endPageNo = startPageNo + (delta * 2) + 1;
      	
      	if (endPageNo > numPages) {
      		endPageNo = numPages;
      	}
      	
      	// 이전 페이지로
      	if (pageNo <= 1) { 
      	%>
        	<li class="disabled"><a href="#">&laquo;</a></li>
        <% 
      	} else {
        %>
        	<li><a href="index.jsp?page=<%= pageNo - 1%>">&laquo;</a></li>
        <%
        } 
      	
      	// 페이지 목록 출력 (현재-delta ~ 현재+delta까지)
        String className = "";
        for(int i = startPageNo; i <= endPageNo; i++) {
        	className = (i == pageNo) ? "active" : "";
        	out.println("<li class='" + className + "'>");
        	out.println("<a href='index.jsp?page=" + i + "'>" + i + "</a>");
        	out.println("</li>");
        }
        
        // 다음 페이지로
      	if (pageNo >= numPages) { 
      	%>
        	<li class="disabled"><a href="#">&raquo;</a></li>
        <% 
      	} else {
        %>
        	<li><a href="index.jsp?page=<%= pageNo + 1%>">&raquo;</a></li>
        <%
        } 
        %>
     </ul>
    </div>
		<%
		} catch (SQLException e) {
			// SQL 에러의 경우 에러 메시지 출력
			out.print("<div class='alert'>" + e.getLocalizedMessage() + "</div>");
		}finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
		%>
		<div class="form-action">
			<a href="join.jsp" class="btn btn-primary">회원가입</a>
		</div>	 	
  </div>
<jsp:include page = "share/footer.jsp" />
</body>
<script>
$(function{
	$("a[data-action='delete']").click(function() {
		if (confirm("정말로 삭제하시겠습니까?")) {
			location = 'delete.jsp?id=' + $(this).attr('data-id');
		}
		return false;
	});
});
</script>
</html>