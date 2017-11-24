<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

   <table b>
      <thead>
         <tr>
            <th>TITLE</th>
            <th>TITLE</th>
            <th>TITLE</th>
            <th>TITLE</th>
         </tr>
      </thead>
      <tbody>
         <c:if test="${ !empty list }">
            <c:forEach var="item" items="${list}" varStatus="status">
               <tr>
                  <td>${status.count}</td>
                  <td>${item.id}</td>
                  <td>${item.name}</td>
                  <td>${item.nickname}</td>
               </tr>
            </c:forEach>
         </c:if>


      </tbody>
   </table>
</body>
</html>