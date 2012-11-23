<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="seller_private_1_3.css">
</head>
<body>
	<jsp:include page="header.jsp"/>
		<div id="content" style="width:98%;	margin:0 auto;margin-top:50px;">
			<jsp:include page="seller_nav.jsp"/>
			<div id="main_con">
				<table border="3" class="table1">
					<thead>
						<tr>
							<th>상품명</th>
							<th>개수</th>
							<th>가격</th>
							<th>확인여부</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div id="select">
					<form action="">
						<input type="radio" name="select" value="day" class="select1"/><b>날짜별</b> 
						<input type="radio" name="select" value="month" class="select1"/><b>월별</b>
					</form>
				</div>
					<table border="3" class="table2">
						<tr>
							<th>합계</th>
							<td colspan="4"></td>
						</tr>
					</table>
				</div>				
			</div>
	<jsp:include page="footer.jsp"/>
</div>
</body>
</html>