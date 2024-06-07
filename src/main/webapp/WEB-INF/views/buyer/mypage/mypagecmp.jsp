<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypagecmp</title>

<script type="text/javascript">

</script>

<style>
body {
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}
.container {
    display: flex;
    justify-content: center;
    padding: 20px;
}
.content {
    background: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    width: 600px;
}
h2 {
    margin-top: 0;
    color: #333;
}
hr {
    border: 0;
    border-top: 1px solid #ccc;
    margin: 20px 0;
}
.page a {
    display: block;
    margin: 10px 0;
    color: #0066cc;
    text-decoration: none;
}
.page a:hover {
    text-decoration: underline;
}
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}
table, th, td {
    border: 1px solid #dddddd;
}
th, td {
    padding: 15px;
    text-align: left;
}
th {
    background-color: #f2f2f2;
}
</style>

</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

	<div class="full">
		<div class="wrap">
		
			<c:import url="/WEB-INF/views/layout/buyer/buyermymenu.jsp"/>
		
			<div class="page">
				<table>
					<tr>
						<th colspan="2">프로필 정보</th>
					</tr>
					<tr>
						<td>프로필 이미지</td>
						<td>
							<c:choose>
	                            <c:when test="${buyerProf != null }">
	                                <img src="/resources/image/${buyerProf.originName}" alt="${buyerProf.storedName}" style="width: 100px; height: 100px;">
	                            </c:when>
	                            <c:otherwise>
	                                <img src="${pageContext.request.contextPath }/resources/image/basicProf.png" alt="기본 프로필 이미지" style="width: 100px; height: 100px;">
	                            </c:otherwise>
                        	</c:choose>
						</td>
					</tr>
					<tr>
						<td>회사 이름</td>
						<td>${cmp.cmpName }</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>${buyer.bName }</td>
					</tr>
					<tr>
						<td>사업자 등록증</td>
						<td>
							<c:choose>
	                            <c:when test="${cmpFile != null }">
	                                <img src="/resources/image/${cmpFile.originName}" alt="${cmpFile.storedName}" style="width: 100px; height: 100px;">
	                            </c:when>
	                            <c:otherwise>
	                                <span>등록된 사업자 등록증이 없습니다.</span>
	                            </c:otherwise>
                        	</c:choose>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
	
</body>
</html>