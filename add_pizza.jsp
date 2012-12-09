<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%
	String errorMsg = null;

	String actionUrl = "re2.jsp";

	// 사용자 정보를 위한 변수 초기화
	String userid = request.getParameter("name");
	String pname = "";
	String price="";			
	String desc = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 추가화면입니다.</title>
<link rel="stylesheet" type="text/css" href="CSS/buyer_private1.css">
<link rel="stylesheet" type="text/css" href="CSS/seller_private_1_3.css">
</head>
<script type="text/javascript">
</script>
<body>
	<div id="wrap" style="width: 930px; margin: 0px auto;">
		<jsp:include page="share/header.jsp"></jsp:include>
		<div id="content" style="width:98%; margin:0 auto; margin-top:50px;">
		<jsp:include page="share/seller_nav.jsp" />
			<form name="add_pizza" class="form-horizontal" action="<%=actionUrl%>" method="post">
				<div class="head_content">
					<h1>피자 추가</h1><br/>
				</div>
				<div class="center_content">
					<table class="t">
					<tr>	
						<th >피자 이름</th>
						<td >
							<input type="text" name="pname">
						</td>
					</tr>
					<tr>
						<th >피자 가격</th>
						<td>
							<input type="text" name="price" >
						</td>
					</tr>
					<tr>
						<th>피자 설명</th>
						<td>
							<textarea rows="15" cols="70" name="desc"></textarea>
						</td>
					</tr>
					</table>
					<input type="hidden" name="grade" value="0"/>
					<p class="center">
					<div class="form-actions" style="text-align:right;margin:10px 70px 0 0">
						<input type="submit" class="btn" value="추가" id="add" />
					</div>
				</div>
			</form>
			<jsp:include page="share/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>