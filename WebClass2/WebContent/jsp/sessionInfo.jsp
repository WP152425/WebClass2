<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="org.dimigo.vo.UserVO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Info</title>
</head>
<body>
<h1>User Info</h1>
<% UserVO user = (UserVO)session.getAttribute("user"); %>

<h2>${ user.id }</h2>
<h2>${ user.name }</h2>
<h2>${ user.nickname }</h2>
</body>
</html>