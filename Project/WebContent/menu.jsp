<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴판입니다.</title>
<link href="CSS/menu.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div id="content">	
			<div class="center_content">
				<span id="order">
				<input type="radio" name="select" value="price"/>가격순
				<input type="radio" name="select" value="name"/>이름순
				<input type="radio" name="select" value="star"/>평점순
				</span>
	<table class="t">
		<tbody>
			<tr>
				<td>
				<img src="pz.gif" alt="00피자">
				<h3>00피자</h3>
				이피자는 정말정말 맛있다.<br/>
				10000원/<input type="button" value="장바구니"/><br/>피자평점*****
				</td>
				<td>
				<img src="pz.gif" alt="00피자">
				<h3>00피자</h3>
				이피자는 정말정말 맛있다.<br/>
				10000원/<input type="button" value="장바구니"/><br/>피자평점*****
				</td>
				<td>
				<img src="pz.gif" alt="00피자">
				<h3>00피자</h3>
				이피자는 정말정말 맛있다.<br/>
				10000원/<input type="button" value="장바구니"/><br/>피자평점*****
				</td>
			</tr>
			<tr>
				<td>
				<img src="pz.gif" alt="00피자">
				<h3>00피자</h3>
				이피자는 정말정말 맛있다.<br/>
				10000원/<input type="button" value="장바구니"/><br/>피자평점*****
				</td>
				<td>
				<img src="pz.gif" alt="00피자">
				<h3>00피자</h3>
				이피자는 정말정말 맛있다.<br/>
				10000원/<input type="button" value="장바구니"/><br/>피자평점*****
				</td>
				<td>
				<img src="pz.gif" alt="00피자">
				<h3>00피자</h3>
				이피자는 정말정말 맛있다.<br/>
				10000원/<input type="button" value="장바구니"/><br/>피자평점*****
				</td>
			</tr>
		</tbody>
	</table>
		</div>
		</div>
	<hr/>			
	<jsp:include page="footer.jsp"/>
</body>
</html>