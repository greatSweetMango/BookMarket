<%@page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
session.invalidate();
response.sendRedirect("addbook.jsp");
%>