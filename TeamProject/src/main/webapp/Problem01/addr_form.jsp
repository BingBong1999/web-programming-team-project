<%-- 1_02_1번문제 --%>
<%-- 최적실행환경: 이클립스 내장 브라우저 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
</head>
<body>
<div align="center">
<h2>주소록 등록</h2>
<hr>
<form name="form1" method="post" action="addr_add.jsp">
<table border="1">
<tr>
	<td>이 름</td>
	<td><input type="text" size="20" name="username"></td>
</tr>
<tr>
	<td>전화번호</td>
	<td><input type="text" size="20" name="tel"></td>
</tr>
<tr>
	<td>이메일</td>
	<td><input type="text" size="20" name="email"></td>
</tr>
<tr>
	<td>성별</td>
	<td>
		<select name="sex">
		<option selected>남</option>
		<option>여</option>
		</select>
	</td>
</tr>
<tr>
	<td>그룹</td>
	<td>
		<select name="group">
		<option selected>가족</option>
		<option>친구</option>
		<option>직장</option>
		</select>
	</td>
</tr>
<tr><td colspan="2" align="center">
	<input type="submit" value="확인">
	<input type="reset" value="취소">
	</td>
</tr>
</table>
</form>
</div>
</body>
</html>