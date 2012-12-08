<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"
	import="org.apache.commons.lang3.StringUtils"%>
<%
	String actionUrl = "";
	if (session.getAttribute("id") != null) {
		actionUrl = "update.jsp";
	}
	String[] seller_phones = { "02", "031", "032", "033", "041", "042",
			"043", "044", "051", "052", "053", "054", "055", "061",
			"062", "063", "064" };
	String[] buyer_phones = { "010", "011", "016", "018", "019" };
	
	String phone1=(String)session.getAttribute("phone1");
	String phone2=(String)session.getAttribute("phone2");
	String phone3=(String)session.getAttribute("phone3");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" http-equiv=" Content-Type" content="text/html;">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="CSS/buyer_private2.css">
</head>
<script type="text/javascript">
	function del() {
		var del;
		del=confirm("정말로 탈퇴하시겠습니까?");
		if(del==true){
			location.href="delete.jsp";
		}
		else{
			alert("취소되었습니다.");
		}
	}
</script>
<body>
	<div id="wrap" style="width: 930px; margin: 0px auto;">
		<jsp:include page="share/header.jsp"></jsp:include>
		<div id="content"
			style="width: 98%; margin: 0 auto; margin-top: 50px;">
			<jsp:include page="share/buyer_nav.jsp" />
			<form action="<%=actionUrl%>" method="post">
				<div id="main_con">
					<table border="3" class="table1">
						<tr>
							<th>아이디</th>
							<td><%=session.getAttribute("id")%></td>
						</tr>
						<tr>
							<%
								if (session.getAttribute("grade").equals("S")) {
							%>
							<th>가게 주소</th>
							<%
								} else {
							%>
							<th>주소</th>
							<%
								}
							%>
							<td><input type="text" name="address" id="pass"
								value=<%=session.getAttribute("address")%> /></td>
						</tr>
						<tr>
							<%
								if (session.getAttribute("grade").equals("S")) {
							%>
							<th>가게 전화번호</th>
							<td class="control-group"><select
									name="phone1">
										<%
												for (String pnum : seller_phones) {
													out.print("<option");
													if (pnum.equals(session.getAttribute("phone1"))) {
														out.print(" selected");
													}
													out.println(">" + pnum + "</option>");
												}
											%>
								</select>
								<span>-</span> <input type="text" class="txt" name="phone2" style="width:53px" value="<%=phone2%>"/>
									<span>-</span> <input type="text" class="txt" name="phone3" style="width:53px" value="<%=phone3%>"/>
							</td>
							<%
								} else {
							%>
							<th>휴대폰 번호</th>
							<td class="control-group"><span class="controls"> <select
									name="phone1">
										<%
												for (String pnum : buyer_phones) {
													out.print("<option");
													if (pnum.equals(session.getAttribute("phone1"))) {
														out.print(" selected");
													}
													out.println(">" + pnum + "</option>");
												}
											%>
								</select>
							</span>
							<span>-</span> <input type="text" class="txt" name="phone2" style="width:53px" value="<%=phone2%>"/>
									<span>-</span> <input type="text" class="txt" name="phone3" style="width:53px" value="<%=phone3%>"/>
							</td>
							<%
								}
							%>
						</tr>
					</table>
					<table border="3" class="table2">
						<tr>
							<th>현재 비밀번호</th>
							<td><input type="password" name="cu_pw" id="pass" /> <b>현재
									사용중인 비밀번호를 입력하시오.</b></td>
						</tr>
						<tr>
							<th>새로운 비밀번호</th>
							<td><input type="password" name="new_pw" id="pass" /> <b>새로운
									비밀번호를 4자~20자 사이로 입력해주세요.</b></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="password" name="new2_pw" id="pass" /> <b>새롭게
									사용할 비밀번호를 한 번 더 입력해주세요.</b></td>
						</tr>
					</table>
					<div id="btn">
						<input type="submit" value="수정" class="btn" /> <input
							type="button" value="회원탈퇴" class="btn" onclick="del()" />
					</div>
				</div>
			</form>
		</div>
		<jsp:include page="share/footer.jsp"></jsp:include>
	</div>
</body>
</html>
