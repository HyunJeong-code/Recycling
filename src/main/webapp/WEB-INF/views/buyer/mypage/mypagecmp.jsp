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
    margin: 0;
    padding: 0;
}

.full {
    width: 1200px;
    height: auto;
    margin: 0 auto;
    padding: 50px 20px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.wrap {
    display: flex;
    width: 100%;
    justify-content: center;
    align-items: center;
    border-radius: 8px;
    padding: 20px;
}

.page {
    margin-top: 20px;
    border-bottom: 3px solid #333;
    width: 100%;
    text-align: center;
    padding-bottom: 30px;
}

h3 {
    margin-bottom: 20px;
    color: #333;
}

table, th, td {
    border: 1px solid #dddddd;
    border-collapse: collapse;
    margin: 0 auto;
}

th, td {
    padding: 15px;
    text-align: center;
}

th {
    background-color: #f2f2f2;
}

td:first-child {
    background-color: #CEE741;
    font-weight: bold;
}

table {
	width: 50%;
}
</style>

</head>
<body>

	<c:import url="/WEB-INF/views/layout/buyer/buyerheader.jsp"/>

	<div class="full">
		<div class="wrap">
		
			<c:import url="/WEB-INF/views/layout/buyer/buyermymenu.jsp"/>
		
			<div class="page">
			<h3>프로필 정보</h3>
				<table>
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