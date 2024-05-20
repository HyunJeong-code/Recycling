<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<div class="section">
	<table>
		<thead>
			<tr>
				<th>체험제목</th>
				<th>모집날짜</th>
				<th>시간</th>
				<th>가능인원</th>
				<th>내용보기</th>
				<th>예약관리</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="expSchList" items="${expSchList}">
				<tr>
					<td>${expName}</td>
					<td>
						<fmt:parseDate value="${expSchList.schDate}" var="schDate" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${schDate}" pattern="yyyy-MM-dd" /></td>
					<td>${expSchList.schTime}</td>
					<td>${expSchList.schCnt}</td>
					<td><a href="./expdetail?expCode=${expSchList.expCode}"><button>상세조회</button></a></td>
					<td><a href="./expresdetail?expCode=${expSchList.expCode}&schNo=${expSchList.schNo}"><button>예약관리</button></a>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

