<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypagepri</title>

<script type="text/javascript">
    window.onload = function() {
        var profileImg = document.getElementById('profileImg');
        if (profileImg) {
            console.log('Profile image path:', profileImg.src);
        } else {
            console.log('Profile image element not found.');
        }
    };
</script>

<style>
@import url("buyer.css");
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
	                                <img src="${pageContext.request.contextPath}/resources/image/basicProf.png" alt="기본 프로필 이미지" style="width: 100px; height: 100px;">
	                            </c:otherwise>
                        </c:choose>
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>${buyer.bName }</td>
					</tr>
					<tr>
						<td>멤버쉽 등급</td>
						<td>${buyerRank.rankName }</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/layout/buyer/buyerfooter.jsp"/>
	
</body>
</html>