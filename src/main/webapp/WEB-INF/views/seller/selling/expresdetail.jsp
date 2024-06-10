<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>체험단 예약 관리</title>

<!-- css -->
<style type="text/css">

/* [우]중단 페이지 */
.section {
	margin-top: 20px;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	text-align: center;
}

/* ------------------------------------- */
/* 상단 */

#cnt_change_update{
	width: 67px;
    text-align: center;
    border: 1px solid #ccc;
    animation: blink 1s infinite;
}

.btn_bot_box{
	margin-top: 20px;
	text-align: center;
}
.btn_bot_box .btn {
	width:105px;
}

.button-group {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 10px; /* 버튼 간의 간격 */
    margin-top: 20px;
}

</style>

<script type="text/javascript">
/* 예약 확정버튼 클릭시[] */
$(function() {
	$("#btn_reserve_complete").click(function() {

		var len = $("input[name=chkBox]:checked").length;
		var chk = new Array();

		$("input:checkbox[name=chkBox]").each(function() {
			if ($(this).is(":checked") == true) {
				chk.push($(this).attr('id'));
			}
		})

		if (len == 0) {
			alert("게시물을 선택해주세요");
		} else {
			$.ajax({
				url : "./expresupdate",
				type : "post",
				data : {
					chBox : chk
                    , actionType: "complete"
				},
				success : function(res) {
					if (res <= 0) {
						alert("오류");
					} else {
						alert("예약 성공");
						location.reload();
					}
				},
				error : function() {
					console.log("error");
				}
			})
		}

	})//btn_reserve_complete

/* 예약 취소버튼 클릭시[예약대기 변경] */
	$("#btn_reserve_wait").click(function() {

		var len = $("input[name=chkBox]:checked").length;
		var chk = new Array();

		$("input:checkbox[name=chkBox]").each(function() {
			if ($(this).is(":checked") == true) {
				chk.push($(this).attr('id'));
			}
		})

		if (len == 0) {
			alert("게시물을 선택해주세요");
		} else {
			$.ajax({
				url : "./expresupdate",
				type : "post",
				data : {
					chBox : chk
					, actionType: "cancel"
				},
				success : function(res) {
					if (res <= 0) {
						alert("오류");
					} else {
						alert("예약 대기");
						location.reload();
					}
				},
				error : function() {
					console.log("error");
				}
			})
		}

	})//btn_reserve_wait

	//예약관리 삭제기능
	$("#btn_reserve_cancel").click(function() {

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
				url : "./expresdetaillistdel",
				type : "post",
				data : {
					chBox : chk
				},
				success : function(res) {
					if (res <= 0) {
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

	})//btn_reserve_cancel
})
</script>
</head>
<body>
<c:import url="/WEB-INF/views/layout/seller/sellerheader.jsp"/>
    <div class="full">
        <div class="wrap">
        <c:import url="/WEB-INF/views/layout/seller/sellermenu.jsp"/>
            <div class="main-section">
	            <h1>체험단 예약 관리</h1>
        
	            <div class="section">
	
				<table class="s-table">
					
					<thead>
				        <tr>
				            <th>상품 번호</th>
				            <th>체험 제목</th>
				            <th>참가 비용</th>
				            <th>모집 날짜</th>
				            <th>시간</th>
				            <th>가능인원</th>
				            <th>모집일</th>
				            <th>상태</th>
				        </tr>
				    </thead>
					<tbody>
				            <tr>
				                <td class="expCode">${exp.expCode}</td>
				                <td class="expName_fix">${exp.expName}</td>
				                <td>${exp.expPrice}</td>
				
				                <td>
				                	<fmt:parseDate value="${expSch.schDate}" var="schDate" pattern="yyyy-MM-dd" />
				                	<fmt:formatDate value="${schDate }" pattern="yyyy-MM-dd"/>
				                </td>
				                <td>${expSch.schTime }</td>
				                <td>
				                	<input type="text" name="schCnt" value="${expSch.schCnt }" id="cnt_change_update" readonly> 
				                	<input type="hidden" name="schNo" value="${expSch.schNo }" class ="schNo"> 
				                </td>
				                
				                <td>
				                	<fmt:parseDate value="${exp.expDate}" var="expDate" pattern="yyyy-MM-dd" />
				               		<fmt:formatDate value="${expDate}" pattern="yyyy-MM-dd"/>
				                </td>
				                <td>
								<!-- 합계 계산 -->
								<c:set var="totalResCnt" value="0" />
									<c:forEach var="res" items="${resList}">
										<c:set var="totalResCnt" value="${totalResCnt + res.resCnt}" />
									</c:forEach>
									
				                	<c:choose>
				                		<c:when test="${expSch.schCnt == totalResCnt }">
				                			모집마감
				                		</c:when>
				                		<c:when test="${expSch.schCnt > totalResCnt }">
				                			모집중
				                		</c:when>
				                		<c:when test="${expSch.schCnt < totalResCnt }">
				                			에러
				                		</c:when>
				                	</c:choose>
				                </td>
				            </tr>
				    </tbody>
				</table>
				
				<div class="button-group">
				    <button class="btn" id="btn_reserve_complete">예약완료</button>
				    <button class="btn" id="btn_reserve_wait">예약대기</button>
				    <button class="btn" id="btn_reserve_cancel">예약취소</button>
				</div>
				
				</div>
				
				
				<hr>
				
				<h2>체험단 예약 리스트</h2>
				<div class="section">
				
				<table class="s-table">
					
					<thead>
				        <tr>
				        	<th>V</th>
				            <th>예약번호</th>
				            <th>대표자 이름</th>
				            <th>전화번호</th>
				            <th>이메일</th>
				            <th>예약인원</th>
				            <th>예약일</th>
				            <th>상태</th>
				        </tr>
				    </thead>
					<tbody>
							<c:forEach var="res" items="${resList}">
							
				            <tr>
								<td><input type="checkbox" id="${res.resCode }" name="chkBox"></td>
				                <td>${res.resCode }</td>
				                <td>${res.resName }</td>
				                <td>${res.resPhone }</td>
				                <td>${res.resEmail }</td>
				                <td>${res.resCnt }</td>
				                <td>
				                	<fmt:parseDate value="${res.resDate }" var="resDate" pattern="yyyy-MM-dd" />
				                	<fmt:formatDate value="${resDate }" pattern="yyyy-MM-dd"/>
				               </td>
								<td>
									<c:choose>
										<c:when test="${res.resCnf eq 'Y' }">
											예약확정
										</c:when>
										<c:when test="${res.resCnf eq 'N' }">
											예약대기
										</c:when>
									</c:choose>
								</td>
				            </tr>
				            </c:forEach>
				    </tbody>
				</table>
            </div>
	            <div class="btn_bot_box">
					<a href="./expdetail?expCode=${exp.expCode }"><button class="btn">상세 보기로</button></a>
				</div>
            </div>
            
        </div>
    </div>
<c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>
</body>
</html>