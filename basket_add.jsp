<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"
	import="java.util.ArrayList"%>
<%
	String productname = request.getParameter("name");
	ArrayList list = (ArrayList) session.getAttribute("productlist");
	List<String> errorMsgs = new ArrayList<String>();

	if (list == null) {
	list = new ArrayList();
 	} 
	list.add(productname);
	session.setAttribute("productlist", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<script>
		alert('<%=productname%>이 장바구니에 추가 되었습니다.');
		history.back(-1);
	</script>

</body>
</html>