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
<title>search_name_jsp</title>
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
<a href="addr_list.jsp">되돌아가기</a><p>
<%
	int none = 1, onceOrMore = 1;

	for(AddrBean ab : am.getAddrList()) {
		if(ab.getUsername().equals(request.getParameter("searchName"))) {
			if (onceOrMore == 1) {
				out.println("<table border=\"1\"");
				out.println("<tr>");
				out.println("<td>이름</td>");
				out.println("<td>전화번호</td>");
				out.println("<td>이메일</td>");
				out.println("<td>성별</td>");
				out.println("<td>그룹</td>");
				out.println("</tr>");
			
				out.println("<tr>");
				out.println("<td>" + ab.getUsername() + "</td>");
				out.println("<td>" + ab.getTel() + "</td>");
				out.println("<td>" + ab.getEmail() + "</td>");
				out.println("<td>" + ab.getSex() + "</td>");
				out.println("<td>" + ab.getGroup() + "</td>");
				out.println("</tr>");
				
				none = 0;
				onceOrMore = 0;
			}
			else {
				out.println("<tr>");
				out.println("<td>" + ab.getUsername() + "</td>");
				out.println("<td>" + ab.getTel() + "</td>");
				out.println("<td>" + ab.getEmail() + "</td>");
				out.println("<td>" + ab.getSex() + "</td>");
				out.println("<td>" + ab.getGroup() + "</td>");
				out.println("</tr>");
			}
		}
	}
	out.println("</table>");
	
	if (none == 1)
		out.println("자료에 해당하는 이름이 없습니다.");
%>
</div>
</body>
</html>