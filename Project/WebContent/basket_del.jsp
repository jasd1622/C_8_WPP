<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils"%>
<%
	String items=(String) session.getAttribute("session_item");
	String prices=(String) session.getAttribute("session_price");
	StringTokenizer stItem=new StringTokenizer(items,"|");
	StringTokenizer stPrice=new StringTokenizer(prices,"|");
	items="";
	prices="";
	while(stItem.hasMoreTokens()){
		String itemTemp = stItem.nextToken();
		String priceTemp = stPrice.nextToken();
		if(!itemTemp.equals(request.getParameter("pid"))){
			items = items+"|" + itemTemp;
			prices = prices+"|" + priceTemp;
		}
	}
	session.setAttribute("session_item", items);
	session.setAttribute("session_price", prices);
%>
<%="<script>alert('선택 항목이 장바구니에서 삭제 되었습니다.')</script>" %>
<%="<meta http-equiv='Refersh' content='0; URL=basket_view.jsp'>"%>