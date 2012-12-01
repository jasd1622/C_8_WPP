<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="menu.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap" style="width:930px; margin:0px auto;">
	<jsp:include page="share/header.jsp"></jsp:include>
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
				<img src="img/pizza1.gif" alt="골든포테이토">
				<h3>골든포테이토</h3>
				매쉬드 포테이토, 금빛 체다치즈, 베이컨을 쫄깃쫄깃 찰도우에올려 더 담백한 맛!<br/>
				15900원/<a href="basket_add.jsp?pid=골든포테이토&price=15900"><input type="button" value="장바구니"/></a><br/>피자평점*****
				</td>
				<td>
				<img src="img/pizza2.gif" alt="바베큐치킨">
				<h3>바베큐치킨</h3>
				어린이에게 추천! 달콤한 BBQ치킨과 고구마가 만나 환상적인 맛<br/>
				25700원/<a href="basket_add.jsp?pid=바베큐치킨&price=25700"><input type="button" value="장바구니"/></a><br/>피자평점*****
				</td>
				<td>
				<img src="img/pizza3.gif" alt="슈퍼슈프림">
				<h3>수퍼슈프림</h3>
				정통 피자맛의 진수! 9가지 미트&야채, 한입에 쏙쏙 고구마치즈롤까지!<br/>
				26900원/<a href="basket_add.jsp?pid=슈퍼슈프림&price=26900"><input type="button" value="장바구니"/></a><br/>피자평점*****
				</td>
			</tr>
			<tr>
				<td>
				<img src="img/pizza4.gif" alt="칠리쉬림프">
				<h3>칠리쉬림프</h3>
				매콤달콤 탱글탱글 쉬림프, 빵끝은 바사사삭!<br/>
				22900원/<a href="basket_add.jsp?pid=칠리쉬림프&price=22900"><input type="button" value="장바구니"/></a><br/>피자평점*****
				</td>
				<td>
				<img src="img/pizza5.gif" alt="베이컨포테이토">
				<h3>베이컨포테이토</h3>
				오븐에 구운 담백한 포테이토, 베이컨, 빵 끝엔 쭉~늘어나는 모짜렐라가 듬뿍!<br/>
				25900원/<a href="basket_add.jsp?pid=베이컨포테이토&price=25900"><input type="button" value="장바구니"/></a><br/>피자평점*****
				</td>
				<td>
				<img src="img/pizza6.gif" alt="페퍼로니">
				<h3>페퍼로니</h3>
				고급 페퍼로니와 진하고 고소한 팬피자의 환상적인 맛!<br/>
				14900원/<a href="basket_add.jsp?pid=페퍼로니&price=14900"><input type="button" value="장바구니"/></a><br/>피자평점*****
				</td>
			</tr>
		</tbody>
	</table>
		</div>
		</div>
	<jsp:include page="share/footer.jsp"></jsp:include>
		</div>
</body>
</html>