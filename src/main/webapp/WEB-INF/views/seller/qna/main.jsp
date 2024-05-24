<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>

<script type="text/javascript">
	
	let qstA = {0: "미답변", 1: "답변완료"}
	
</script>

</head>
<body>
    <div class="full">
        <div class="wrap">
            <div class="page">
            
            </div>
        
            <div class="section">
            	<h1>미답변 문의 조회</h1>
	            <table border="1">
				    <thead>
				        <tr>
				            <th>번호</th>
				            <th>답변 여부</th>
				            <th>문의 분류</th>
				            <th>제목</th>
				            <th>작성자</th>
				            <th>등록일</th>
				        </tr>
				    </thead>
				    <tbody>
				        <c:forEach items="${qlist}" var="qst">
				            <tr>
				                <td>${qst.qstCode}</td>
				                <td>
				                	<script>document.write(qstA[${qst.qstA}])</script>
				                </td>
				                <td>
				                	<!-- <script>document.write(pdtList[${prd.ctPdtNo}])</script> -->
				                </td>
				                <td>
				                	<c:choose>
					                	<c:when test="${qst.qstA == 0}">
					                		<a href="./qnaform?qstCode=${qst.qstCode}">${qst.qstTitle}</a>
					                	</c:when>
					                	<c:otherwise>
					                		<a href="./qnadetail?qstCode=${qst.qstCode}">${qst.qstTitle}</a>
					                	</c:otherwise>
			                		</c:choose>
				                </td>
				                <td>${qst.qstName}</td>
				                <td>
				                	<fmt:parseDate value="${qst.qstDate}" var="qstDate" pattern="yyyy-MM-dd HH:mm:ss" />
				               		<fmt:formatDate value="${qstDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				                </td>
				            </tr>
				        </c:forEach>
				    </tbody>
				</table>
            </div>
            
            <div class="section">
            	<h1>모든 문의 조회</h1>
	            <table border="1">
				    <thead>
				        <tr>
				            <th>번호</th>
				            <th>답변 여부</th>
				            <th>문의 분류</th>
				            <th>제목</th>
				            <th>작성자</th>
				            <th>등록일</th>
				        </tr>
				    </thead>
				    <tbody>
				        <c:forEach items="${qlist}" var="qst">
				            <tr>
				                <td>${qst.qstCode}</td>
				                <td>미답변</td>
				                <td>
				                	<!-- <script>document.write(pdtList[${prd.ctPdtNo}])</script> -->
				                </td>
				                <td>
				                	<c:choose>
					                	<c:when test="${qst.qstA == 0}">
					                		<a href="./qnaform?qstCode=${qst.qstCode}">${qst.qstTitle}</a>
					                	</c:when>
					                	<c:otherwise>
					                		<a href="./qnadetail?qstCode=${qst.qstCode}">${qst.qstTitle}</a>
					                	</c:otherwise>
			                		</c:choose>
				                </td>
				                <td>${qst.qstName}</td>
				                <td>
				                	<fmt:parseDate value="${qst.qstDate}" var="qstDate" pattern="yyyy-MM-dd HH:mm:ss" />
				               		<fmt:formatDate value="${qstDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				                </td>
				            </tr>
				        </c:forEach>
				    </tbody>
				</table>
            </div>
            
        </div>
    </div>
</body>
</html>