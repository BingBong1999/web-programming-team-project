<%-- 1_02_1번문제 --%>
<%-- 최적실행환경: 이클립스 내장 브라우저 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="jspbook.ch07.*" import="java.util.List" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="am" class="jspbook.ch07.AddrManager" scope="session" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addr_list_jsp</title>
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
<form name="form" method="post" action="search_name.jsp">
이름 검색하기: <input type="text" size="5" name="searchName">
<input type="submit" value="검색"><p>
</form>
<hr>
<a href="addr_form.jsp">주소추가</a><p>
<%
	out.println("<table border=\"1\"");
	out.println("<tr>");
	out.println("<td>이름</td>");
	out.println("<td>전화번호</td>");
	out.println("<td>이메일</td>");
	out.println("<td>성별</td>");
	out.println("<td>그룹</td>");
	out.println("</tr>");
	
	int startIndex = 0;
	int lastIndex = 0;
	int currentPage = 0;
	int rpp = 2;
	int allpage = (am.getAddrList().size() - 1) / rpp + 1;
	
	if (request.getParameter("sindex") == null) { //sindex값이 null이라는 뜻은 페이지를 처음 방문했다는 뜻이다. addr_list페이지를 처음 방문한 경우
		currentPage = 1; //현재 페이지를 1로 설정해준다.
		startIndex = 1; //해당 페이지를 처음 방문했으므로, 현재 추가된 행이 인덱스 1의 값을 갖는다.
	}
	else { //sindex가 null이 아니면 (= 페이지를 처음 방문한 것이 아니라면)
		currentPage = Integer.parseInt(request.getParameter("sindex")); //현재 페이지를 sindex값으로 설정해준다.
		startIndex = currentPage * rpp - rpp + 1;  //시작페이지 계산에 대한 예)현재 페이지가 3이고 rpp가 4라면 해당 페이지의 시작하는 인덱스는 8이다.
	}
	
	if (am.getAddrList().size() % rpp == 0 || currentPage != allpage) //모든 행의 개수를 rpp로 나눈 나머지가 0이거나, 현재 페이지가 마지막 페이지가 아니라면
		lastIndex = startIndex + rpp - 1;
	else  //모든 행의 개수를 rpp로 나눈 나머지가 0이 아니고 현재 페이지가 마지막 페이지라면
		lastIndex = am.getAddrList().size(); //인덱스는 1부터 시작하므로
	
	List<AddrBean> list = am.getAddrList();
	
	if (list != null) {
		for (int i = startIndex - 1; i < lastIndex; i++) {
			out.println("<tr>");
			out.println("<td>" + list.get(i).getUsername() + "</td>");
			out.println("<td>" + list.get(i).getTel() + "</td>");
			out.println("<td>" + list.get(i).getEmail() + "</td>");
			out.println("<td>" + list.get(i).getSex() + "</td>");
			out.println("<td>" + list.get(i).getGroup() + "</td>");
			out.println("</tr>");
		}
	}
	
	out.println("</table><br>");
	
	for (int i = 1; i <= allpage; i++) {
		if (i == currentPage)
			out.println(i);
		else
			out.println("<a href=\"addr_list.jsp?sindex=" + i + "\">" + i + "</a>&nbsp;");
	}
%>
</div>
</body>
</html>