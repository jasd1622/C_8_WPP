<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils"%>
<%
//	Connection conn=null;
//	Statement stmt=null;
//	ResultSet rs=null;
	
//	String dbUrl = "jdbc:mysql://localhost:3306/wp_test";
//	String dbUser = "slaej1228";
//	String dbPassword = "tiger";
	
//	try{
//		Class.forName("com.mysql.jdbc.driver");
//		conn=Driver.getConnection(dbUrl,dbUser,dbPassword);
//		stmt=conn.createStatement();
//	} catch(){}
	String items=(String) session.getAttribute("session_item");
	String prices=(String) session.getAttribute("session_price");
	String nums=(String) session.getAttribute("session_num");
	items=""; prices="";
	String type=request.getParameter("type");
	if(items==null){
		items=new String(request.getParameter("pid"));
		prices=new String(request.getParameter("price"));
		nums=new String(request.getParameter("num"));
	} else {
		items = items+"|" +request.getParameter("pid");
		prices = prices+"|" +request.getParameter("price");
		nums = nums+"|" +request.getParameter("num");
	}
	session.setAttribute("session_item", items);
	session.setAttribute("session_price", prices);
	session.setAttribute("session_num", nums);	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv='Refersh' content='0; URL=basket_view.jsp'>
<title></title>
</head>
<body>
	<script>
		alert('선택 항목이 장바구니에 추가 되었습니다.');
		<%if(type.equals("P")){%>
			document.location.href = "menu.jsp";
		<%}else{%>
			document.location.href = "side.jsp";
		<%}%>
		</script>
</body>
</html>