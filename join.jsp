<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<%String [] PhoneNum={"010","011","016","018","019"};%>
<% 
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	String dbUrl="jdbc:mysql://localhost:3306/wp";
	String dbUser="jasd1622";
	String dbPassword="asd1622";
	String actionUrl;
	
	String userid="";
	String pwd="";
	String name="";
	String address="";
	String phone="";
	
	actionUrl="register.jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="join.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap" style="width:930px; margin:0px auto;">
<jsp:include page="header.jsp"></jsp:include>
	<div id="content">		
			<span class="head_content">
				<h1>회원가입(구매자)</h1>
			</span>
			<div class="center_content">
	<table class="t">
		<tbody>
			<tr>
				<th class="rb">아이디</th>
				<td><input type="text" name="id"  maxlength="12"/>
					<input type="button" value="중복조회" class="button"/>
					<span>* 6~12자의 영문/숫자만 가능</span>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"/>
				<span>* 6~12자의 영문/숫자만 가능</span></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="pwd2" /></td>
			</tr>
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
				<td>
					<input type="text" name="add" style="width:386px"/>
				</td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td>
					<span><select name="phone">
					<%
					for(String phonenum:PhoneNum){
						out.print("<option");
						if(phonenum.equals(PhoneNum)){
							out.print(" checked");
						}
						out.println(">"+phonenum+"</option>");	
					}
					%>
					</select>
					</span>
					<span>-</span>
					<input type="text" class="txt" name="phone2"/>
					<span>-</span>
					<input type="text" class="txt" name="phone3"/>
				</td>
			</tr>
		</tbody>
	</table>
	<h2>이용약관</h2>
	<div style="margin-bottom:5px"><textarea name="policy" cols="120" rows="5" >aㄴ여하세요 저는 이은지입니다 우하하하하후하하하하하핳하우리는통합쿠폰제를실시합니다하하하으하하ㅏ흐아크크크ㅡㅋ캬캬ㅑ
	</textarea></div>
	<input type="checkbox" value="agree"/> 약관에 동의합니다.
		<p class="center" >
			<a href=""><img src="jo.gif" alt="회원가입"></a>
			<a href=""><img src="ca.gif" alt="취소"></a>
		</p>		
	</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>