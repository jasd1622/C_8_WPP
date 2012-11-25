<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="basket.css" rel="stylesheet" type="text/css">
<link href="Main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div id="content">
			<div class="center_content">
			<table class="t">
				<thead>
					<tr>
						<th></th>
						<th>상품명</th>
						<th>단가</th>
						<th>개수</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
				<tfoot>
				</tfoot>
			</table>
			
			<table class="t">
				<tr>
					<th>쿠폰이름</th>
					<th>개수</th>
					<th>사용 여부</th>
				</tr>
				<tr>
					<td>통합쿠폰</td>
					<td>00개</td>
					<td>O</td>
				</tr>
			</table>	
			<input type="button" value="구매" id="buy">
			<input type="button" value="삭제" id="del">		
			</div>
	</div>
	<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>