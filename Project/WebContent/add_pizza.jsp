<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%
	String errorMsg = null;
	String[] category = {"피자", "사이드 메뉴"};

	String actionUrl;
	
	// DB 접속을 위한 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/web2012";
	String dbUser = "web";
	String dbPassword = "asdf";

	// 사용자 정보
	String categorys = "";
	String user_id = "";
	String name = "";
	String description = "";
	String price = "";
	
	
	// Request로 ID가 있는지 확인
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {}

	if (id > 0) {
		// Request에 id가 있으면 update모드라 가정
		actionUrl = "upload_pizza.jsp";
		try {
		    Class.forName("com.mysql.jdbc.Driver");

		    // DB 접속
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

	 		// 질의 준비
			stmt = conn.prepareStatement("SELECT * FROM menus WHERE id = ?");
			stmt.setInt(1, id);
			
			// 수행
	 		rs = stmt.executeQuery();
			
			if (rs.next()) {
				user_id = rs.getString("userid");
				name = rs.getString("name");
				categorys = rs.getString("categorys");
				description = rs.getString("description");
				price = rs.getString("price");
			}
		}catch (SQLException e) {
			errorMsg = "SQL 에러: " + e.getMessage();
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
	} else {
		actionUrl = "upload_pizza.jsp";
	}
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 추가화면입니다.</title>
<link rel="stylesheet" type="text/css" href="CSS/add_pizza.css">
</head>
<script type="text/javascript">
	function check(){
		window.open("checkid.jsp?id="+document.memberform.name.value,"check","width=140px,height=150px,top=250px,left=600px");
	}
</script>
<body>
	<div id="wrap" style="width: 930px; margin: 0px auto;">
		<jsp:include page="share/header.jsp"></jsp:include>
		
		 <div class="container">
		 <%
		 if (errorMsg != null && errorMsg.length() > 0 ) {
				// SQL 에러의 경우 에러 메시지 출력
				out.print("<div class='alert'>" + errorMsg + "</div>");
		 }
		 %>
		<div id="content">
			<form name="add_pizza" class="form-horizontal" action="<%=actionUrl%>" method="post" enctype="multipart/form-data">
				<div class="head_content">
					<h1>피자 추가</h1><br/>
				</div>
				<div class="center_content">
					<div class="control-group">
						<label class="control-label" for="name">피자 이름</label>
						<div class="controls">
							<input type="text" name="name" onclick="check()"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="price">피자 가격</label>
						<div class="controls">
							<input type="text" name="price" onclick="check()"/>원
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="category">카테고리</label>
						<div class="controls">
							<select name="category">
								<% 
								for(String MenuCate: category) {
									out.print("<option");
									if (MenuCate.equals(categorys)) {
										out.print(" selected");
									}
									out.println(">"+MenuCate+"</option>");	
								}
								%>
							</select>
						</div>
					</div>
	
					<div class="control-group">
						<label class="control-label" for="description">피자 설명</label>
						<div class="controls">
							<textarea rows="7" cols="40" name="description"></textarea>
						</div>
					</div>
					<input type="hidden" name="grade" value="1"/>
					<p class="center">
					<div class="form-actions">
						<input type="submit" class="btn btn-primary" value="추가" id="add" />
					</div>
				</div>
			</form>
			<jsp:include page="share/footer.jsp"></jsp:include>
		</div>
	</div>
	</div>
</body>
</html>