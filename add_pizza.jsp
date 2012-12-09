<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%
	String errorMsg = null;

	String actionUrl = "register.jsp";
	String actionUrl2 = "checkid.jsp";

	// 사용자 정보를 위한 변수 초기화
	String id;					//int type
	String userid = "";
	String name = "";
	String price="";			//int type
	String description = "";
	String category = "";

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
	function check(){
		window.open("checkid.jsp?id="+document.memberform.name.value,"check","width=140px,height=150px,top=250px,left=600px");
	}
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
						<th class="control-th" for="name">피자 이름</th>
						<td class="controls">
							<input type="text" value="<%=name%>" name="name" onclick="check()"/>
						</td>
					</tr>
					<tr>
						<th class="control-th" for="price">피자 가격</th>
						<td class="controls">
							<input type="text" value="<%=price%>"  name="name" onclick="check()"/>
						</td>
					</tr>
					<tr>
						<th class="control-th" for="category">카테고리</th>
						<td class="controls">
							<input type="text" value="<%=category%>"  name="name" onclick="check()"/>
						</td>
					</tr>
					<tr>
						<th class="control-th" for="image">이미지</th>
						<td class="controls">
							<input type="file" name="image" size="40">
						</td>
					</tr>
					<tr>
						<th class="control-th" for="description">피자 설명</th>
						<td class="controls">
							<textarea rows="15" cols="70" name="description"></textarea>
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