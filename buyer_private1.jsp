<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="CSS/buyer_private1.css">
</head>
<body>
<div id="wrap" style="width:930px; margin:0px auto;">
	<jsp:include page="share/header.jsp"></jsp:include>
		<div id="content" style="width:98%;	margin:0 auto;margin-top:50px;">
			<jsp:include page="share/buyer_nav.jsp"/>
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
				<div id="coupons">
					<b>* 쿠폰 *</b>
				</div>
				<table border="3" class="table2">
					<tr>
						<th>쿠폰 개수</th>
						<td></td>
						<th>사용 여부</th>
						<td></td>
					</tr>
				</table>
			</div>				
		</div>
	<jsp:include page="share/footer.jsp"></jsp:include>
</div>
</body>
</html>