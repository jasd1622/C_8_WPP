<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrap">
		<div id="log">
			<a href="">로그인</a> |
			<a href="">회원가입</a>
		</div>
		<div id="top">
			<div id="logo"><h1>
				<img src="pz.gif" alt="로고">
			</h1></div>
			<form action="">
				<input type="text" name="searchbox" id="searchbox">
				<input type="submit" value="Search" id="searchbt">
			</form>
		</div>
		<div id="header">
			<div id="navbar">
				<ul>
					<li><a href="">메뉴판</a></li>
					<li><a href="">장바구니</a></li>
					<li><a href="">고객의 소리</a></li>
				</ul>
			</div>
		</div>
		<div id="content">
			<div id="sub_con">
				<div id="sub_title">
					* My Page
				</div>
				<table>
					<tr>
						<th><a href="buyer_private1.html">주문내역/쿠폰 확인</a></th>
					</tr>
					<tr>
						<th><a href="buyer_private2.html">개인정보 수정</a></th>
					</tr>
				</table>
			</div>
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
	<div id="footer">
		<hr/>
		<p>사이트 소개 | 이용약관 | 개인정보취급방침 | 책임의 한계와 법적 고지 | 고객센터 </p>
		<p>
		Copyright © FANCAFE. All rights reserved.
		</p>
	</div>
</div>

</body>
</html>