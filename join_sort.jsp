<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%String grade=""; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="CSS/join_sort.css">
</head>
<script type="text/javascript">
function buyer(){
	document.location.href="join.jsp?grade="+"B";
}
function seller(){
	document.location.href="join.jsp?grade="+"S";
}
</script>
<body>
	<div id="wrap" style="width: 930px; margin: 0px auto;">
		<jsp:include page="share/header.jsp" />
		<div id="content">
			<span>
				<h1>회원 종류</h1>
			</span>
			<div class="center_content">
				<div class="center" style="cursor:pointer">
				<img src="IMG/sell.gif" onclick="seller()"/>
				<img src="IMG/buy.gif" onclick="buyer()"/>
				</div>
			</div>
		</div>
		<jsp:include page="share/footer.jsp" />
	</div>
</body>
</html>