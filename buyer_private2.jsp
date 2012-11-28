<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"
    import="org.apache.commons.lang3.StringUtils"%>
<%
	Connection conn=null;
	PreparedStatement stmt=null;
	ResultSet rs =null;
	
	String actionUrl=null;
	String dbUrl="jdbc:mysql://localhost:3306/wp";
	String dbUser="root";
	String dbPassword="asd1622";
	request.setCharacterEncoding("utf-8");
	
	String userid="";
	String userpwd="";
	String useraddress="";
	String userphone="";
	
	if(session.getAttribute("id")!=null){
		actionUrl="update.jsp";
	try{
	}catch(Exception e){}
			String n_add=request.getParameter("address");
			String n_phone=request.getParameter("phone");
			String pwd=request.getParameter("cu_pw");
			String n_pwd=request.getParameter("new_pw");
			String n_pwd_conf=request.getParameter("new2_pw");
		
			
			try{
				conn=DriverManager.getConnection(dbUrl,dbUser,dbPassword);
				stmt=conn.prepareStatement("SELECT * FROM users WHERE id=?");
				stmt.setString(1,(String)session.getAttribute("id"));
				
				rs=stmt.executeQuery();
				while(rs.next()){
					userid=rs.getString("id");
					userpwd=rs.getString("pwd");
					useraddress=rs.getString("address");
					userphone=rs.getString("phone");
				}
			}catch(SQLException e){
			}finally{
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
			<form action="<%=actionUrl%>" method="post">
			<div id="main_con">
					<table border="3" class="table1">
					<tr>
						<th>아이디</th>
						<td><%=session.getAttribute("id") %></td>
					</tr>
					<tr>
						<th>가게 주소</th>
						<td><input type="text" name="address" id="pass" value=<%=session.getAttribute("address") %>/></td>
					</tr>
					<tr>
						<th>가게 전화번호</th>
						<td><input type="text" name="phone" id="pass"value=<%=session.getAttribute("phone")%>/></td>
					</tr>
				</table>
				<table border="3" class="table2">
					<tr>
						<th>현재 비밀번호</th>
						<td><input type="password" name="cu_pw" id="pass"/>
							<b>현재 사용중인 비밀번호를 입력하시오.</b>
						</td>
					</tr>
					<tr>
						<th>새로운 비밀번호</th>
						<td><input type="password" name="new_pw" id="pass"/>
							<b>새로운 비밀번호를 4자~20자 사이로 입력해주세요.</b>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="new2_pw" id="pass"/>
							<b>새롭게 사용할 비밀번호를 한 번 더 입력해주세요.</b>
						</td>
					</tr>
				</table>
				<div id="btn">
					<input type="submit" value="수정" class="btn1"/>
					<input type="button" value="취소" class="btn1"/>
				</div>
			</div>
			</form>				
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>