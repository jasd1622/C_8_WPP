<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
    import="org.apache.commons.lang3.StringUtils"%>
<%
	//DB 접속을 위한 준비
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	String dbUrl = "jdbc:mysql://localhost:3306/wp";
	String dbUser = "root";
	String dbPassword = "asd1622";
	
	request.setCharacterEncoding("utf-8");
	String userid=request.getParameter("userid");
	String pwd=request.getParameter("pwd");
	String pwd_conf=request.getParameter("pwd2");
	String name=request.getParameter("name");
	String address=request.getParameter("add");
	String phone1=request.getParameter("phone");
	String phone2=request.getParameter("phone2");
	String phone3=request.getParameter("phone3");
	String phone_Num=phone1+phone2+phone3;
	String grade=request.getParameter("grade");
	
	List<String> errorMsgs= new ArrayList<String>();
	int result=0;
	
	if(userid==null  || userid.trim().length()==0){
		errorMsgs.add("ID를 반드시 입력하시오.");
	}
	if(pwd==null || pwd.length()<6){
		errorMsgs.add("비밀번호는 6자 이상 입력해주세요.");
	}
	if(!pwd.equals(pwd_conf)){
		errorMsgs.add("비밀번호가 일치하지 않습니다.");
	}
	if(phone2.length()<3 || phone3.length()<3){
			errorMsgs.add("핸드폰 번호를 다시 입력해주세요.");
	}
	if(errorMsgs.size()==0){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(dbUrl,dbUser,dbPassword);
			stmt=conn.prepareStatement(
					"INSERT INTO users(id, pwd, address, phone, grade)"+
					"VALUES(?,?,?,?,?)"
					);
			stmt.setString(1,userid);
			stmt.setString(2,pwd);
			stmt.setString(3,address);
			stmt.setString(4,phone_Num);
			stmt.setString(5,grade);
			
			result = stmt.executeUpdate();
			if (result != 1) {errorMsgs.add("등록에 실패하였습니다.");}
		}catch(SQLException e){
			errorMsgs.add("SQL 에러"+e.getMessage());
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
	<%if(errorMsgs.size()>0){%>
	<div class="alert alert_error">
		<h3>Errors:</h3>
		<ul>
		<%for(String msg:errorMsgs){%>
			<li><%=msg%></li>
			<% } %>
			</ul>
	</div>
	<div class="form-action">
	<input type="button" onclick="history.back();" value="뒤돌아가기"/>
	</div>
	<%} else if(result==1){ %>
	<div class="alert alert-success">
	<b><%=userid %></b>님 등록해주셔서 감사합니다.
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