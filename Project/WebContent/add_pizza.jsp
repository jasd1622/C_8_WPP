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
	String price;			//int type
	String description = "";
	String category = "";
	File image = "";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 추가화면입니다.</title>
<link rel="stylesheet" type="text/css" href="CSS/add_pizza.css">
</head>
<script type="text/javascript">
	function check(){
		window.open("checkid.jsp?id="+document.memberform.name.value,"check","width=140px,height=150px,top=250px,left=600px");
	}
</script>
<body>
	<div id="wrap" style="width: 930px; margin: 0px auto;">
		<jsp:include page="share/header.jsp"></jsp:include>
		<div id="content">
			<form name="add_pizza" class="form-horizontal" action="<%=actionUrl%>" method="post">
				<div class="head_content">
					<h1>피자 추가</h1><br/>
				</div>
				<div class="center_content">
					<div class="control-group">
						<label class="control-label" for="name">피자 이름</label>
						<div class="controls">
							<input type="text" value="<%=name%>" name="name" onclick="check()"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="price">피자 가격</label>
						<div class="controls">
							<input type="text" value="<%=price%>"  name="name" onclick="check()"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="category">카테고리</label>
						<div class="controls">
							<input type="text" value="<%=price%>"  name="name" onclick="check()"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="image">이미지</label>
						<div class="controls">
							<input type="file" value="<%=image%>"  name="image" onclick="check()"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="description">피자 설명</label>
						<div class="controls">
							<textarea rows="7" cols="7" name="description"></textarea>
						</div>
					</div>
					<input type="hidden" name="grade" value="0"/>
					<p class="center">
					<div class="form-actions">
						<input type="submit" class="btn btn-primary" value="추가" id="add" />
					</div>
				</div>
			</form>
			<jsp:include page="share/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>