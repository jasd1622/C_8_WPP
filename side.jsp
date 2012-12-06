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
	<table class="t">
		<tbody>
			<tr>
				<td>
				<img src="img/side1.gif" alt="펩시콜라">
				<h3>펩시콜라</h3>
				피자와 찰 떡 궁 합 펩시 콜라 캬 ~<br/>
				1500원/<a href="basket_add.jsp?pid=펩시콜라&price=1500&type=S"><input type="button" value="장바구니"/></a><br/>
				</td>
				<td>
				<img src="img/side2.gif" alt="펩시넥스">
				<h3>펩시넥스</h3>
				0kcal! 살이 안 쪄!! 마구먹자!!<br/>
				1800원/<a href="basket_add.jsp?pid=펩시넥스&price=1800&type=S"><input type="button" value="장바구니"/></a><br/>
				</td>
				<td>
				<img src="img/side3.gif" alt="마운틴듀">
				<h3>마운틴듀</h3>
				초록초록맛 헐크가 될꺼야!!<br/>
				1800원/<a href="basket_add.jsp?pid=마운틴듀&price=1800&type=S"><input type="button" value="장바구니"/></a><br/>
				</td>
			</tr>
			<tr>
				<td>
				<img src="img/side4.gif" alt="레몬에이드">
				<h3>레몬에이드</h3>
				직접 갈아 만든 새콤 달콤 레몬에이드<br/>
				3500원/<a href="basket_add.jsp?pid=레몬에이드&price=3500&type=S"><input type="button" value="장바구니"/></a><br/>
				</td>
				<td>
				<img src="img/side5.gif" alt="자몽에이드">
				<h3>자몽에이드</h3>
				100% 자몽만으로 만든 달달한 자몽에이드<br/>
				3700원/<a href="basket_add.jsp?pid=자몽에이드&price=3700&type=S"><input type="button" value="장바구니"/></a><br/>
				</td>
				<td>
				<img src="img/side6.gif" alt="칠성사이다">
				<h3>칠성사이다</h3>
				우리 사이는 칠성사이다ㅋㅋㅋㅋ<br/>
				1600원/<a href="basket_add.jsp?pid=칠성사이다&price=1600&type=S"><input type="button" value="장바구니"/></a><br/>
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