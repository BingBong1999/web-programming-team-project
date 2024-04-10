<%
//20190978 오윤아
//최적화: eclipse
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%!
public String parseDay (int cnt, String day) {
   if(cnt % 7 == 6) {
      return "<font color='blue'>" + day + "</font>";
   } if(cnt % 7 == 0) {
      return "<font color='red'>" + day + "</font>";
   } else {
      return day;
   }
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar</title>
<style type="text/css">
#tab {
   border: 3px solid #ECE9D8;
   border-collapse: collapse;
}
table {
   width: 700px;
   height: 200px;
   text-align: center;
   
}
#left {
    padding: 0px 220px 0px 0px;
}
#right {
    padding: 0px 0px 0px 220px;
}
hr {
  border: 1px solid #ECE9D8   ;
}
</style>

</head>
<body>
<%
//------------------ <선언부> ------------------
Calendar today = Calendar.getInstance();

int tYear = today.get(Calendar.YEAR);
int tMonth = today.get(Calendar.MONTH);
int tDate = today.get(Calendar.DATE);
today.set(tYear, tMonth, 1);
int tStart = today.get(Calendar.DAY_OF_WEEK);

// 년도 불러오기
String sYear = request.getParameter ("YEAR");
int year;
String temp = "";
//년도가 null 일 때 오늘 날짜의 년도를 가져옴
if(sYear == null) { 
    year = tYear;
} else {
   //년도가 null이 아닐 때 입력된 년도 중 숫자만 변수에 입력
   temp = sYear.replaceAll("[^0-9]", "");
   
   //입력된 년도 값이 없을 때 오늘 날짜로 초기화
   //경고창을 통해 올바르지 않은 입력값임을 알려줌
   if(temp.equals("")) {
      year = tYear;
      out.println("<script>alert(\"올바르지 않은 값입니다.\")</script>");
   }
   else
      //정상적으로 년도 입력 받음
      year = Integer.parseInt(temp);
}

String sMonth = request.getParameter("MONTH");
int month;
//달이 null일 때 오늘 날짜의 달을 변수에 입력
if(sMonth == null)
   month = tMonth;
else
   // 달 정상 입력
   month = Integer.parseInt(sMonth);

int date = today.get(Calendar.DATE);

Calendar cal = Calendar.getInstance();
cal.set(year, month, 1);

int start = cal.get(Calendar.DAY_OF_WEEK);
int end = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
int cnt = 0, line = 0;

String week[] = {"일", "월", "화", "수", "목", "금", "토"};

// 출력부
out.println("<div align=\"center\">");

//------------------ < 상단 - 추가 기능 > ------------------
out.println("<h2>날짜 검색</h2>");
out.println("<form name=form2 action=\"calendar.jsp\">");

//년도 검색(text input)
out.println("<input type=\"text\" size=4 name=\"YEAR\"/>년");

//달 검색 (select input)
out.println("<select name=\"MONTH\">");
for(int i = 0; i < 12; i ++) {
   out.println("<option value=\"" + i + "\"> " + (i+1) + "</option>");
}
out.println("</select>");

out.println("<input type=submit value=\"검색하기\">");
out.println("</form><hr>");

// ------------------ < 중앙 > ------------------
year=cal.get(cal.YEAR);
month=cal.get(cal.MONTH);

//왼쪽 상단 년도 선택 부분
out.print("<b id=\"left\">");
out.print("<a href=\"calendar.jsp?YEAR=" + (year-1) + "&MONTH=" + month + "\" >◀ </a>" + year);
out.print("<a href=\"calendar.jsp?YEAR=" + (year+1) + "&MONTH=" + month + "\" >▶</a>");
out.println("</b>");

//중앙 상단 월 선택 부분
if(month != 0) { 
out.println("<a href=\"calendar.jsp?YEAR=" + year + "&MONTH=" + (month-1) + "\" >◀ </a>");
}
out.println((month+1));
if (month != 11) {
out.println("<a href=\"calendar.jsp?YEAR=" + year + "&MONTH=" + (month+1) + "\" >▶</a>");
}

//오른쪽 상단 날짜 부분
int tWeek = (tDate+tStart-1) % 7 - 1;
if(tWeek == -1) {
   tWeek = 6;
}
out.println("<b id=\"right\">" + tYear + "-" + (tMonth + 1) + "-" + tDate + "-" + week[tWeek] + "</b>");
out.println("<p></p>");


//------------------ < 하단 > ------------------
out.println("<table id=\"tab\">");

// 첫번째 행(요일)
out.println("<tr style=\"height:10px\" id=\"tab\">");
for(int i=0; i<7; i++){
   out.print("<th id=\"tab\">");
   out.print(parseDay(cnt++, week[i]));
   out.println("</th>");
}
out.println("</tr>");

//두번째 행 빈 부분
out.println("<tr id=\"tab\">");
for(int i=0; i<start-1; i++){
   out.println("<td id=\"tab\">&nbsp;</td>");
   cnt++;
   line++;
}

// 숫자 출력
for(int i=1; i<=end; i++) {
   out.print("<td id=\"tab\">");
   String str = Integer.toString(i);
   out.print(parseDay(cnt++, str));
   line++;
   out.println("</td id=\"tab\">");
   if(cnt % 7 == 0) {
      out.println("</tr>");
      line = 0;
   }
}

//마지막 행 빈 부분
while(line>0 && line < 7) {
   out.println("<td id=\"tab\">&nbsp;</td>");
   line++;
}
out.println("</tr>");

out.println("</table>");
out.println("<div>");

%>

</body>
</html>