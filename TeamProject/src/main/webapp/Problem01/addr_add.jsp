<%-- 1_02_1번문제 --%>
<%-- 최적실행환경: 이클립스 내장 브라우저 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="jspbook.ch07.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="addr" class="jspbook.ch07.AddrBean" />
<jsp:setProperty name="addr" property="*" />
<jsp:useBean id="am" class="jspbook.ch07.AddrManager" scope="session" />
<% am.add(addr); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addr_add_jsp</title>
</head>
<body>
<div align="center">
<h2>등록내용</h2>
이름 : <%= addr.getUsername() %><p>
전화번호: <%= addr.getTel() %><p>
이메일: <%= addr.getEmail() %><p>
성별: <%= addr.getSex() %><p>
그룹: <%= addr.getGroup() %>
<hr>
<a href="addr_list.jsp">2줄씩 보기</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="addr_list_group.jsp">그룹별 목록 보기</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="addr_total_view.jsp">전체 한번에 보기</a>
</div>
</body>
</html>