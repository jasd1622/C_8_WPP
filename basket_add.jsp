<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*" 
		import="org.apache.commons.lang3.StringUtils"%>
<%
	String items=(String) session.getAttribute("session_item");
	String prices=(String) session.getAttribute("session_price");
	items=""; prices="";
	if(items==null){
		items=new String(request.getParameter("pid"));
		prices=new String(request.getParameter("price"));
	} else {
		items = items+"|" +request.getParameter("pid");
		prices = prices+"|" +request.getParameter("price");
	}
	
	session.setAttribute("session_item", items);
	session.setAttribute("session_price", prices);
	
%>
<%="<script>alert('선택 항목이 장바구니에 추가 되었습니다.')</script>" %>
<%="<meta http-equiv='Refersh' content='0; URL=basket_view.jsp'>"%>