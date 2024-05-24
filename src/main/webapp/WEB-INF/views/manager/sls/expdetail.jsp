<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	//예약관리 삭제기능
	$("#btn_expdetail_cancel").click(function() {

		var len = $("input[name=chkBox]:checked").length;
		var chk = new Array();
		
		$("input:checkbox[name=chkBox]").each(function() {
			if ($(this).is(":checked") == true) {
				chk.push($(this).attr('id'));
			}
		})
		
		console.log(len);
		console.log(chk);

		if (len == 0) {
			alert("삭제할 게시물 선택해주세요.");
			
			
		} else {
			$.ajax({
				url : "./expdetaillistdel",
				type : "post",
				data : {
					chBox : chk
					
				},
				 success: function(res) {
	                    if (res.res < 0) {
	                        alert("예약된 인원을 삭제해주세요.");
	                    } else if (res == 0) {
	                        alert("삭제 실패");
	                    } else {
	                        alert("삭제 성공");
	                        location.reload();
	                    }
	                },
				error : function() {
					console.log("error");
				}
			})
		}

	})//btn_expdetail_cancel
})
</script>



<style type="text/css">
/* 기본 설정 */
body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
    color: #333;
}

.full {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    padding: 20px;
}

.wrap {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    width: 100%;
}

.page h1 {
    font-size: 24px;
    margin-bottom: 10px;
    text-align: center;
}

.page hr {
    margin: 10px 0;
}

.section {
    margin-top: 20px;
}

.section div {
    margin-bottom: 15px;
}

.section label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.section input[type="text"],
.section select,
.section textarea {
    width: calc(100% - 22px);
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    background-color: #f5f5f5;
    cursor: default;
}

.section textarea {
    height: 100px;
    resize: none;
}

.section button {
    background-color: #007BFF;
    color: #fff;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    border-radius: 5px;
    font-size: 16px;
    margin-right: 10px;
    display: inline-block;
}

.section button[type="button"] {
    background-color: #6c757d;
}

.section button:hover {
    background-color: #0056b3;
}

.section button[type="button"]:hover {
    background-color: #5a6268;
}

.section img {
    width: 100%;
    height: auto;
    margin-bottom: 15px;
    border-radius: 4px;
}
</style>
</head>

<body>
	<div class="full">
		<div class="wrap">
			<div class="page">
				<h1>체험 상세조회</h1>
				<hr>
			</div>

			<div class="section">
			    
	    		<img alt="없음" src="/upload/${fileimage.storedName }">
		
				<div>
					<label>체험제목</label> <input type="text" value="${view.expName}" readonly="readonly">
				</div>

				<div>
					<label>참가비용</label> <input type="text" value="${view.expPrice}" readonly onclick="this.blur()"> 원
				</div>

				<div>
					<label>체험설명</label>
					<textarea readonly onclick="this.blur()">${view.expDetail}</textarea>
				</div>

				<div>
					<a href="./expupdate?expCode=${view.expCode }" ><button type="button">수정하기</button></a>
				</div>				
				<div class="section">
	<table>
		<thead>
			<tr>
				<th></th>
				<th>모집날짜</th>
				<th>시간</th>
				<th>신청한인원</th>
				<th>등록가능인원</th>
				<th>예약관리</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
		<!-- 합계 합산 -->
	
			<c:forEach var="expSchList" items="${expSchList}">
				<tr>
					<td><input type="checkbox" id="${expSchList.schNo }" name="chkBox"></td>
					<td>
						<fmt:parseDate value="${expSchList.schDate}" var="schDate" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${schDate}" pattern="yyyy-MM-dd" /></td>
					<td>${expSchList.schTime}</td>
					
						<!-- 예약인원 합계계산 -->
						<c:set var="totalResCnt" value="0" />
						<c:forEach var="resCnt" items="${resCnt}">
							<c:if test="${expSchList.schNo == resCnt.schNo}">
								<c:set var="totalResCnt" value="${totalResCnt + resCnt.resCnt}" />
							</c:if>
						</c:forEach>
						<td class ="totalResCnt">${totalResCnt }</td>
					
					<td>${expSchList.schCnt}</td>
					<td>
						<c:choose>
	                		<c:when test="${expSchList.schCnt == totalResCnt }">
	                			모집마감
	                		</c:when>
	                		<c:when test="${expSchList.schCnt > totalResCnt }">
	                			모집중
	                		</c:when>
	                		<c:when test="${expSchList.schCnt < totalResCnt }">
	                			에러
	                		</c:when>
                		</c:choose>
					</td>
					<td><a href="./expresdetail?expCode=${expSchList.expCode}&schNo=${expSchList.schNo }"><button>예약관리</button></a>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
				
				
				<div>
					<button type="button" id ="btn_expdetail_cancel">삭제하기</button>
				<a href="./explist" ><button type="button">돌아가기</button></a>
				</div>
				<div></div>
			</div>
		</div>
	</div>
</body>



</html>