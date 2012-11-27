<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils"%>
<%
	String[] phones = {"02", "031", "032", "033", "041", "042", "043", "044", "051", "052", "053", "054", "055", "061", "062", "063", "064"};
	String errorMsg = null;

	String actionUrl;
	// DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/wp_test";
	String dbUser = "slaej1228";
	String dbPassword = "tiger";

	// 사용자 정보를 위한 변수 초기화
	String userid = "";
	String shop="";
	String pwd = "";
	String address = "";
	String phone="";
	String phone2 = "";
	String phone3 = "";

	// Request로 ID가 있는지 확인
	int id = 0;
	try {
		id = Integer.parseInt(request.getParameter("id"));
	} catch (Exception e) {}

	if (id > 0) {
		// Request에 id가 있으면 update모드라 가정
		actionUrl = "update.jsp";
		try {
		    Class.forName("com.mysql.jdbc.Driver");

		    // DB 접속
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

	 		// 질의 준비
			stmt = conn.prepareStatement("SELECT * FROM users WHERE id = ?");
			stmt.setInt(1, id);

			// 수행
	 		rs = stmt.executeQuery();

			if (rs.next()) {
				userid = rs.getString("userid");
				shop = rs.getString("shop");
				pwd = rs.getString("pwd");
				address = rs.getString("add");
				phone = rs.getString("phone"+"phone2"+"phone3");
				phone2 = rs.getString("phone2");
				phone3 = rs.getString("phone3");
				
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
		actionUrl = "register.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<link rel="stylesheet" type="text/css" href="basket.css">
</head>
<body>
<div id="wrap" style="width:930px; margin:0px auto;">
<jsp:include page="header.jsp"></jsp:include>
	<div id="content">	
	<%
 if (errorMsg != null && errorMsg.length() > 0 ) {
		// SQL 에러의 경우 에러 메시지 출력
		out.print("<div class='alert'>" + errorMsg + "</div>");
 }
 %>					
   <form class="form-horizontal" action="<%=actionUrl%>" method="post">
		<span class="head_content">
				<h1>회원가입(판매자)</h1>
			</span>
			<div class="center_content">
				<%
			  	if (id > 0) {
			  		out.println("<input type='hidden' name='userid' value='"+id+"'>");
			  	}
	  	%>
	<table class="t">
		<tbody>
			<tr>
				<th class="rb">아이디</th>
				<td class="control-group">
					<span class="controls">
						<input type="text" name="userid" value="<%=userid%>">
					</span>
					<input type="button" value="중복조회" class="button"/>
					<span>* 6~12자의 영문/숫자만 가능</span>
				</td>
			</tr>
			<tr>
				<th>상호명</th>
				<td class="control-group"><input type="text" name="name" value="<%=shop %>"/>
				</td>
			</tr>
			<% if (id <= 0) { %>
			<tr>
				<th>비밀번호</th>
				<td class="control-group">
					<span class="controls"><input type="password" name="pwd"/></span>
				<span>* 6~12자의 영문/숫자만 가능</span></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td class="control-group">
					<span class="controls"><input type="password" name="pwd2"/></span>
				</td>
			</tr>
			<% } %>
			<tr>
				<th rowspan="2">주소</th>
				<td>
					<input type="text" class="txt"/>
					<span>-</span>
					<input type="text" class="txt"/>
					<input type="button" value="주소찾기" class="button"/>
				</td>
			</tr>
			<tr>
				<td class="control-group">
					<span class="controls">
					<input type="text" name="add" style="width:386px" value="<%=address %>"/>
					</span>
				</td>
			</tr>
			<tr>
				<th>가게전화</th>
				<td class="control-group">
					<span class="controls">
					<select name="phone">
					<%
					for(String pnum:phones){
						out.print("<option");
						if(pnum.equals(phone)){
							out.print(" selected");
						}
						out.println(">"+pnum+"</option>");	
					}
					%>
					</select>
					</span>
					<span>-</span>
					<input type="text" class="txt" name="phone2" value="<%=phone2 %>"/>
					<span>-</span>
					<input type="text" class="txt" name="phone3" value="<%=phone3 %>"/>
				</td>
			</tr>
		</tbody>
	</table>
	<h2>이용약관</h2>
		<div style="margin-bottom:5px"><textarea name="policy" cols="120" rows="5" >aㄴ여하세요 저는 이은지입니다 우하하하하후하하하하하핳하우리는통합쿠폰제를실시합니다하하하으하하ㅏ흐아크크크ㅡㅋ캬캬ㅑ
		</textarea></div>
		<input type="checkbox" value="agree"/> 약관에 동의합니다.
		
			<p class="center">
					<div class="form-actions">
						<a href="index.jsp" class="btn">목록으로</a>
						<% if (id <= 0) { %>
							<input type="submit" class="btn btn-primary" value="가입">
						<% } else { %>
							<input type="submit" class="btn btn-primary" value="수정">
						<% } %>
					</div>
					
			  </form>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</body>
	</html>