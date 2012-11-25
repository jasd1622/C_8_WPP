<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입입니다.</title>
<link href="CSS/join.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="header.jsp"/>
	<div id="content">		
			<span class="head_content">
				<h1>회원가입(구매자)</h1>
			</span>
			<div class="center_content">
	<table class="t">
		<tbody>
			<tr>
				<th class="rb">아이디</th>
				<td><input type="text" name="id"  maxlength="12"/>
					<input type="button" value="중복조회" class="button"/>
					<span>* 6~12자의 영문/숫자만 가능</span>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"/>
				<span>* 6~12자의 영문/숫자만 가능</span></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="pwd2" /></td>
			</tr>
			<tr>
				<th rowspan="2">주소</th>
				<td>
					<input type="text" class="txt"/>
					<span>-</span>
					<input type="text" class="txt"/>
					<input type="button" value="주소찾기" class="button"/>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="add" style="width:386px"/>
				</td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td>
					<select name="phone">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
					</select><span>-</span>
					<input type="text" class="txt"/>
					<span>-</span>
					<input type="text" class="txt"/>
				</td>
			</tr>
		</tbody>
	</table>

	<h2>이용약관</h2>
	<textarea name="policy" cols="120" rows="5" >약관에 보여지는 내용을 모두 동의하시면 '동의'를 눌러주세요.
	</textarea>
	
	<input type="checkbox" value="agree"/><br/>약관에 동의합니다.
		<p class="center" >
			<a href=""><img src="jo.gif" alt="회원가입"></a>
			<a href=""><img src="ca.gif" alt="취소"></a>
		</p>		
	</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>