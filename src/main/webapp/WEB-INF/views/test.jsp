<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="./test" method="post">
	<label for="test">TEST : </label>
	<input id="test" name="test">
	
	<button>TEST!</button>
</form>

<c:if test="${res eq 1 }">
	<p>TEST SUCCESS</p>
</c:if>

<c:if test="${res eq 0 }">
	<p>TEST SUCCESS</p>
</c:if>

</body>
</html>