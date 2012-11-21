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
					<tr>
						<th>아이디</th>
						<td></td>
					</tr>
					<tr>
						<th>가게 주소</th>
						<td></td>
					</tr>
					<tr>
						<th>가게 전화번호</th>
						<td></td>
					</tr>
				</table>
				<table border="3" class="table3">
					<tr>
						<th>현재 비밀번호</th>
						<td><input type="password" name="cu_pw" id="pass">
							<b>현재 사용중인 비밀번호를 입력하시오.</b>
						</td>
					</tr>
					<tr>
						<th>새로운 비밀번호</th>
						<td><input type="password" name="new_pw" id="pass">
							<b>새로운 비밀번호를 4자~20자 사이로 입력해주세요.</b>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="new2_pw" id="pass">
							<b>새롭게 사용할 비밀번호를 한 번 더 입력해주세요.</b>
						</td>
					</tr>
				</table>
				<div id="btn">
					<input type="submit" value="수정" class="btn1">
					<input type="button" value="취소" class="btn1">
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