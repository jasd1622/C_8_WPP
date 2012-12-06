<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils"%>
<%
	String items=(String) session.getAttribute("session_item");
	String prices=(String) session.getAttribute("session_price");
	int total=0;
	StringTokenizer stItem=null;
	StringTokenizer stPrice=null;
	if(items!=null && items.length()>0){
		stItem=new StringTokenizer(items,"|");
		stPrice=new StringTokenizer(prices,"|");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="basket.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap" style="width:930px; margin:0px auto;">
	<jsp:include page="share/header.jsp"/>
	<div id="content">	
		<div class="center_content">
		<table class="t">
		<thead>
		<tr>
				<th>제품명</th>
				<th>금액</th>
				<th>삭제하기</th>
		</tr>
		</thead>
		<tbody>
			<%if(items!=null && items.length()>0){ 
				while(stItem.hasMoreTokens()){
					String itemTemp = stItem.nextToken();
					String kitemTemp = new String(itemTemp.getBytes("8859_1"),"UTF-8");
					String priceTemp = stPrice.nextToken();
					
					total += Integer.parseInt(priceTemp);
			%>
			<tr>
				<td><%=kitemTemp %></td>
				<td><%=priceTemp %></td>
				<td><a href="basket_del.jsp?pid=<%=kitemTemp%>">삭제</a></td>
			</tr>
			<%}}else{ %>
			<tr><td colspan="3">선택 목록이 존재하지 않습니다</td></tr>
			<%} %>
			</tbody>
			<tfoot>
			<tr><td colspan="3">금액합계: <%=total %></td></tr>
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
		<center><a href="">돌아가기</a>&nbsp&nbsp&nbsp<a href="">구매</a></center>		
		</div>		
	</div>
	<jsp:include page="share/footer.jsp"/>
		</div>
</body>
</html>