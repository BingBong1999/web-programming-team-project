<%-- 1_02_1번문제 --%>
<%-- 최적실행환경: 이클립스 내장 브라우저 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jspbook.ch07.*" import="java.util.List"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="am" class="jspbook.ch07.AddrManager" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addr_total_view_jsp</title>
<style>
table {
	width:500px;
	text-align:center;
}
td {
	width:100px;
}
</style>
</head>
<body>
<div align="center">
<h2>주소록</h2>
<hr>
<a href="addr_form.jsp">주소추가</a><p>
<table border="1">
<tr>
	<td>이름</td>
	<td>전화번호</td>
	<td>이메일</td>
	<td>성별</td>
	<td>그룹</td>
</tr>
<%
	for(AddrBean ab : am.getAddrList()) {
		out.println("<tr>");
		out.println("<td>" + ab.getUsername() + "</td>");
		out.println("<td>" + ab.getTel() + "</td>");
		out.println("<td>" + ab.getEmail() + "</td>");
		out.println("<td>" + ab.getSex() + "</td>");
		out.println("<td>" + ab.getGroup() + "</td>");
		out.println("</tr>");
	}
%>
</table>
</div>
</body>
</html>