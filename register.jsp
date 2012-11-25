<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
    import="org.apache.commons.lang3.StringUtils"%>
<%
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	String dbUrl="jdbc:mysql://localhost:3306/wp";
	String dbUser="jasd1622";
	String dbPassword="asd1622";
	
	request.setCharacterEncoding("utf-8");
	String userid=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String pwd_conf=request.getParameter("pwd2");
	String house=request.getParameter("add");
	String phone=request.getParameter("phone"+"phone2"+"phone3");
	String phone2=request.getParameter("phone2");
	String phone3=request.getParameter("phone3");
	
	List<String> errorMsgs= new ArrayList<String>();
	int result=0;
	
	if(userid==null  || userid.trim().length()==0){
		errorMsgs.add("ID를 반드시 입력하시오.");
	}
	if(pwd==null || pwd.length()<6){
		errorMsgs.add("비밀번호는 6자 이상 입력해주세요.");
	}
	if(!pwd.equals("pwd_conf")){
		errorMsgs.add("비밀번호가 일치하지 않습니다.");
	}
	if(phone==null){
		errorMsgs.add("핸드폰 번호를 입력해주세요.");
	}
	if(phone.length()!=0){
		if(phone2.length()!=4){
			errorMsgs.add("핸드폰 압의 4자리를 다시 입력해주세요.");
		}
		if(phone3.length()!=4){
			errorMsgs.add("핸드폰 뒤의 4자리를 다시 입력해주세요.");
		}
	}
	if(errorMsgs.size()==0){
		try{
		conn=DriverManager.getConnection(dbUrl,dbUser,dbPassword);
		stmt=conn.prepareStatement(
				"INSERT INTO users(id, pwd, address, phone)"+
				"vALUES(?,?,?,?)"
				);
		stmt.setString(1,userid);
		stmt.setString(2,pwd);
		stmt.setString(3,address);
		stmt.setString(4,phone);
		
		result=stmt.executeUpdate();
		if(result!=1){errorMsgs.add("등록에 실패하였습니다.");}
		
		catch(SQLException e){
			errorMsgs.add("SQL 에러"+e.getMassage());
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){}
			if(stmt!=null)try{stmt.close();}catch(SQLException e){}
			if(conn!=null)try{conn.close();}catch(SQLException e){}
		}
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrap" style="width:930px; margin:0px auto;">
	<jsp:include page="header.jsp"/>
	<div id="content">
	<%if(errorMsgs.size()>0)%>
	<div class="alert alert_error">
		<h3>Errors:</h3>
		<ul>
		<%for(String msg:errorMsgs){%>
			<li><%=msg%></li>
			<% } %>
			</ul>
	</div>
	<div class="form-action">
	<a onclick="history.back();" class="btn">뒤로 돌아가기</a>
	</div>
	<% if(result==1){ %>
	<div class="alert alert-success">
	<b><%=name %></b>님 등록해주셔서 감사합니다.
	</div>
	<div class="form-action">
	<a href="Main.jsp" class="btn">목록으로</a>
	</div>
	<%} %>
	</div>
	<jsp:include page="footer.jsp"/>
</div>
</body>
</html>