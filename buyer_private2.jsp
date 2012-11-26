<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"
    import="org.apache.commons.lang3.StringUtils"%>
<%
//DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/wp_test";
	String dbUser = "slaej1228";
	String dbPassword = "tiger";

	request.setCharacterEncoding("utf-8");

	// Request로 ID가 있는지 확인
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {}
	String userid = request.getParameter("userid");
	String pwd=request.getParameter("pwd");
	String pwd_conf=request.getParameter("pwd2");
	String address=request.getParameter("add");
	String phone=request.getParameter("phone"+"phone2"+"phone3");
	String phone2=request.getParameter("phone2");
	String phone3=request.getParameter("phone3");

	List<String> errorMsgs = new ArrayList<String>();
	int result = 0;

	if (userid == null || userid.trim().length() == 0) {
		errorMsgs.add("ID를 반드시 입력해주세요.");
	}
	
	if(phone==null){
		errorMsgs.add("핸드폰 번호를 입력해주세요.");
	}
	if(phone!=null){
		if(phone2.length()!=4){
			errorMsgs.add("핸드폰 압의 4자리를 다시 입력해주세요.");
		}
		if(phone3.length()!=4){
			errorMsgs.add("핸드폰 뒤의 4자리를 다시 입력해주세요.");
		}
	}

	if (errorMsgs.size() == 0) {
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
			stmt = conn.prepareStatement(
					"UPDATE users " +
					"SET  userid=?,  address=?, phone=? " +
					"WHERE id=?"
					);
			stmt.setString(1,userid);
			stmt.setString(2,address);
			stmt.setString(3,phone);

			result = stmt.executeUpdate();
			if (result != 1) {
				errorMsgs.add("변경에 실패하였습니다.");
			}
		} catch (SQLException e) {
			errorMsgs.add("SQL 에러: " + e.getMessage());
		} finally {
			// 무슨 일이 있어도 리소스를 제대로 종료
			if (rs != null) try{rs.close();} catch(SQLException e) {}
			if (stmt != null) try{stmt.close();} catch(SQLException e) {}
			if (conn != null) try{conn.close();} catch(SQLException e) {}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="buyer_private2.css">
</head>
<body>
<div id="wrap" style="width:930px; margin:0px auto;">
<jsp:include page="header.jsp"></jsp:include>
		<div id="content" style="width:98%;	margin:0 auto;margin-top:50px;">
			<jsp:include page="buyer_nav.jsp"/>
			
			<div id="main_con">
					<table border="3" class="table1">
					<tr>
						<th>아이디</th>
						<td><%=userid %></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><%=address %></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><%=phone %></td>
					</tr>
				</table>
				<table border="3" class="table2">
					<tr>
						<th>현재 비밀번호</th>
						<td><input type="password" name="cu_pw" id="pass">
							<b>현재 사용중인 비밀번호를 입력하시오.</b>
						</td>
					</tr>
					<tr>
						<th>새로운 비밀번호</th>
						<td><input type="password" name="new_pw" id="pass">
							<b>새로운 비밀번호를 4자~20자 사이로 입력해주세요.</b>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="new2_pw" id="pass">
							<b>새롭게 사용할 비밀번호를 한 번 더 입력해주세요.</b>
						</td>
					</tr>
				</table>
				<% if (errorMsgs.size() > 0) { %>
 			<div class="alert alert-error">
 				<h3>Errors:</h3>
 				<ul>
 					<% for(String msg: errorMsgs) { %>
 						<li><%=msg %></li>
 					<% } %>
 				</ul>
 			</div>
		 	<div class="form-action">
		 		<a onclick="history.back();" class="btn">뒤로 돌아가기</a>
		 	</div>
	 	<% } else if (result == 1) { %>
	 		<div class="alert alert-success">
	 			<b><%=userid%></b>님 정보가 수정되었습니다.
	 		</div>
		 	<div class="form-action">
		 		<a href="index.jsp" class="btn">목록으로</a>
		 	</div>
	 	<%}%>
			</div>				
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
</div>

</body>
</html>