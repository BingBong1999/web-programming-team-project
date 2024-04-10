<%--컴퓨터학과 20190936 고지수--%>
<%--최적 실행환경: Chrome browser--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jspbook.pb03.*" import="java.util.Calendar"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="lecture2" class="jspbook.pb03.LectureBean" />
<jsp:setProperty name="lecture2" property="*" />
<jsp:useBean id="lm2" class="jspbook.pb03.LectureManager" scope="session"/>

<%!
String[] titleNames = {
	"웹프로그래밍", "운영체제", "소프트웨어프로그래밍", "데이터베이스개론",
	"자료구조", "네트워크", "창의와감성", "사회봉사"
};
String[] lectureRooms = {
		"인B301", "인A302", "인A302", "인A301",
		"원305", "인B301", "백101", ""
	};

String[] typeId = {"", "id=\"mandatory\"", "id=\"selective\"", "id=\"elective\"", "id=\"free\""};

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컴퓨터학과 2학년 시간표</title>
<style>
	h3 {
		font-family: "gulim";
	}
	table, td {
		border-collapse:collapse;
		border: 1px solid black;
		text-align: center;
		font-family: "gulim";
	}
	td {
		width: 80px;
		height: 50px;
	}
	.date, .period {
		font-weight: bold;
		font-size: 20px;
	}
	caption {
	 	text-align:right; 
	 	caption-side: top; 
	 	padding: 0px 15px 15px 0px;
	}
	.subject {
		font-size: 13px;
	}
	#mandatory { /*전공필수*/
		background-color: #ffe08d; 
	}
	#selective { /*전공선택*/
		background-color: #b2ccff;
	}
	#elective { /*교양*/
		background-color: #bdbdbd;
	}
	#todayColor { /*오늘 표시*/
		
		color: #FA5882;
	}
	
</style>
</head>
<body>
<div align="center">
<h3><b>강의 시간표</b></h3>
<table border="1">
<%
//날짜 부분
Calendar cal = Calendar.getInstance();
//주말 설정
//cal.set(2020, Calendar.DECEMBER, 5);
//평일 설정
cal.set(2020, Calendar.DECEMBER, 3);
int today_day = cal.get(Calendar.DAY_OF_WEEK); //일:1 월:2 ... 토:7, 2~6이 유효.

out.println("<caption><b>" + cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH) + 1) + "-" + cal.get(Calendar.DATE) + "</b></caption>");
if (today_day == 1 || today_day == 7)
	out.println("<p style=\"color:#9EABED;\">오늘은 주말입니다! :)<p>");

//빈즈
int i2 = lecture2.getTime();
int j2 = lecture2.getDay();
int num2 = lecture2.getConsecutive();

if ((lecture2.getTime() != -1) && !lm2.duplicateCheck(i2, j2, num2)) 
	lm2.add(lecture2);
lm2.buildMatrix();

//시간표 구현 시작
String[] sdays = {"월", "화", "수", "목", "금"};

out.println("<tr class=\"date\">");
out.println("<td>2학년</td>");

//첫번째행 요일 출력
for (int i = 0; i < 5; i++) {
	if (i == (today_day - 2))
		out.println("<td id=\"todayColor\">" + sdays[i] + "</td>");
	else
		out.println("<td>" + sdays[i] + "</td>");
}
out.println("</tr>");

for (int i = 0; i < 6; i++) {
	out.println("<tr>");
	out.println("<td class=\"period\">" + (i + 1) + "</td>");
	for (int j = 0; j < 5; j++) {
		if (lm2.getSpanMatrix()[i][j] == 0)
			out.println("");
		else {
			if (lm2.getTitleMatrix()[i][j] == -1)
				out.println("<td></td>");
			else 
				out.println("<td class=\"subject\" rowspan=\"" + lm2.getSpanMatrix()[i][j] + "\"" 
				+ typeId[lm2.getTypeMatrix()[i][j]] + ">" 
				+ titleNames[lm2.getTitleMatrix()[i][j]] 
				+ "<br>" + lectureRooms[lm2.getTitleMatrix()[i][j]] + "</td>");
		}
	
	}
	out.println("</tr>");
}
%>
</table>
<br>
</div>
</body>
</html>
