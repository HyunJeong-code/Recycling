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
	
	let qstCt = {100: "상품 문의", 110: "결제 문의", 120: "배송 문의", 130: "기타"}
	
	
	
</script>

</head>
<body>
	<c:import url="/WEB-INF/views/layout/seller/sellerheader.jsp"/>

    <div class="full">
        <div class="wrap">
            <div class="page">
            
            </div>
        
            <div class="section">
            	<h1>미답변 문의 조회</h1>
            	
            	<div class="search">
					<form action="./main" method="get">
						<input type="hidden" name="sCtg" value="UP">
						<input type="text" id="uppersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
						<button>검색</button>
					</form>
				</div>
				
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
				                	<script>document.write(qstCt[${qst.ctQstNo}])</script>
				                </td>
				                <td>
				                	<c:choose>
					                	<c:when test="${qst.qnaCode == null}">
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
				
				<c:import url="/WEB-INF/views/layout/upperpaging.jsp"/>
            </div>
            
            <div class="section">
            	<h1>모든 문의 조회</h1>
            	
            	<div class="search">
					<form action="./main" method="get">
						<input type="hidden" name="sCtg" value="UN">
						<input type="text" id="undersearch" name="search" placeholder="검색어를 입력해주세요." class="search">
						<button>검색</button>
					</form>
				</div>
            	
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
				        <c:forEach items="${qlistA}" var="qst">
				            <tr>
				                <td>${qst.qstCode}</td>
				                <td>
				                	<c:choose>
					                	<c:when test="${qst.qnaCode == null}">
					                		미답변
					                	</c:when>
					                	<c:otherwise>
					                		답변 완료
					                	</c:otherwise>
			                		</c:choose>
				                </td>
				                <td>
				                	<script>document.write(qstCt[${qst.ctQstNo}])</script>
				                </td>
				                <td>
				                	<c:choose>
					                	<c:when test="${qst.qnaCode == null}">
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
				
				<c:import url="/WEB-INF/views/layout/underpaging.jsp"/>
            </div>
        </div>
    </div>
    
    <c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>
    
</body>
</html>