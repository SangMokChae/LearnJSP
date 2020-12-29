<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
  <%
  Calendar c=Calendar.getInstance();
  int hour = c.get(Calendar.HOUR_OF_DAY);
  int minute = c.get(Calendar.MINUTE);
  int second = c.get(Calendar.SECOND);
  %>
  <meta charset="UTF-8">
  <title>Servlet Test</title>
</head>
<body>
  <h1>현재 시간은 <%=hour %>시 <%=minute %>분 <%=second %>초 입니다.</h1>
</body>
</html>