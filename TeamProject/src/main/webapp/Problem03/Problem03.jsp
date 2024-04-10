<%--컴퓨터학과 20190936 고지수--%>
<%--최적 실행환경: Chrome browser--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jspbook.pb03.*"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="lecture" class="jspbook.pb03.LectureBean" />
<jsp:setProperty name="lecture" property="*" />
<jsp:useBean id="lm" class="jspbook.pb03.LectureManager" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간표 작성</title>
<script>
	function popUp() {
		var result = confirm(\"중복된 시간표입니다. 새로운 과목으로 대체하시겠습니까?\");
		
		return result;
	}
</script>
</head>
<body>
<%

String[] typeNames = {"전공필수", "전공선택", "교양", "자유선택"};
String[] titleNames = {"웹프로그래밍", "운영체제", "소프트웨어프로그래밍", "데이터베이스개론", "자료구조",
		"네트워크", "창의와감성", "사회봉사"};
String[] days = {"월", "화", "수", "목", "금"};

out.println("<div align=\"center\">");
out.println("<form method=\"post\" action=\"Problem03.jsp\">");
out.println("과목타입 : <select name=\"type\">");
for (int i = 0; i < typeNames.length; i++)
	out.println("<option value=\"" + i + "\">" + typeNames[i] + "</option>");
out.println("</select>");

out.println("과목명 : <select name=\"title\">");
for (int i = 0; i < titleNames.length; i++)
	out.println("<option value=\"" + i + "\">" + titleNames[i] + "</option>");
out.println("</select>");

out.println("요일 : <select name=\"day\">");
for (int i = 0; i < days.length; i++)
	out.println("<option value=\"" + i + "\">" + days[i] + "</option>");
out.println("</select>");

out.println("시간 : <select name=\"time\">");
for (int i = 0; i < 6; i++)
	out.println("<option value=\"" + i + "\">" + (i + 1) + "</option>");
out.println("</select>");

out.println("연강여부 : <select name=\"consecutive\">");
for (int i = 1; i <= 6; i++)
	out.println("<option value=\"" + i + "\">" + i + "</option>");
out.println("</select>");

out.println("&nbsp&nbsp&nbsp&nbsp<input type=\"submit\" value=\"등록\">");
out.println("</form>");
out.println("<hr>");
%>
<!-- 시간표 부분 -->
<%@ include file="timeTable.jsp" %>
<%
out.println("<hr>");


int i = lecture.getTime();
int j = lecture.getDay();
int num = lecture.getConsecutive();

//첫 실행 때 실행되지 않기 위함 
if (lecture.getType() != -1) {
	//같은 시간에 시간표가 이미 존재하면 경고창 띄우고 시간표를 추가하지 않음
	if (lm.duplicateCheck(i, j, num)) 
		out.println("<script>alert(\"중복된 시간표입니다. 시간표를 추가하실 수 없습니다.\")</script>");
	else {
		//lm에 lecture 객체 추가
		lm.add(lecture);
		//학점추가
		lm.calcCredit(lecture);
	}	
	
	//지금까지 추가한 학점을 출력
	out.println("<b style=\"color: blue;\">학점: " + lm.getTotalCredit() + "</b><br><br>");
	
	//lecture 
	for (LectureBean lb : lm.getLectureList()) 
		out.print(lb + "<br>");
}

lm.buildMatrix();

out.println("</div>");
%>

</body>
</html>