<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="Main.css">	
<link rel="stylesheet" type="text/css" href="seller_private.css">
<link rel="stylesheet" type="text/css" href="seller_private_1_3.css">
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
						<th><a href="seller_private1.html">매출내역 확인</a></th>
					</tr>
					<tr>
						<th><a href="">피자정보 수정</a></th>
					</tr>
					<tr>
						<th><a href="seller_private3.html">개인정보 수정</a></th>
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
				<div id="select">
					<form action="">
						<input type="radio" name="select" value="day" class="select1"/><b>날짜별</b> 
						<input type="radio" name="select" value="month" class="select1"/ ><b>월별</b>
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