<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" imort="java.util.*"
    import="org.apache.commons.lang3.StringUtils"%>
<% 
	Connection conn=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;
	
	String dbUrl="jdbc:mysql://localhost:3306/wp";
	String dbUser="jasd1622";
	String dbPassword="asd1622";
	
	request.setCharacterEncoding("utf-8");
	
	int id=0;
	try{
		id=Integer.parseInt(request.getParameter("id"));
	}catch(Exception e){
		String userid=request.getParameter("id");
		String name=request.getParameter("name");
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
						<td></td>
					</tr>
					<tr>
						<th>가게 주소</th>
						<td></td>
					</tr>
					<tr>
						<th>가게 전화번호</th>
						<td></td>
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
				<div id="btn">
					<input type="submit" value="수정" class="btn1">
					<input type="button" value="취소" class="btn1">
				</div>
			</div>				
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
</div>

</body>
</html>