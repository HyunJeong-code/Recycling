<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link rel="stylesheet" href="/resources/css/manager/manager.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<title>체험단 예약 관리</title>


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

	/* 체험시간별 인원변경 */
		$("#cnt_change_update").change(function() {
					var parentRow = $(this).closest('tr');
					var schCntInput = parentRow.find('.expCode').text();
					var schCntInputNo = parseInt(parentRow.find('.schNo').val());
			
			$.ajax({
				type: "post"
				, url: "./cntchangeupdate"
				, data: {
					
					expCode : schCntInput
					, schNo : schCntInputNo
					, schCnt : $(this).val()
				}
				, dataType : "json"
				, success: function(res) {
					console.log("AJAX 성공");

		            if (res.success) {
		                alert("인원이 변경되었습니다.");
		                console.log("succes")
		            	/* 원래페이지로 이동 */
						location.href = "./expresdetail?expCode=" + schCntInput + "&schNo=" + schCntInputNo;
		            } else {
		                alert("변경이 불가능합니다. 예약된 인원보다 적은 값을 입력하세요.");
		            	console.log("fail")
		            }
				
					
				}
				, error: function() {
					console.log("AJAX 실패");
				}
			})
		}) // cnt_change_update

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
	<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
    <div class="admin-container">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
		<div class = "full content" >
        <div class="wrap">
            <div class="page">
	            <h1>체험단 예약 관리</h1>
				<hr>
				<br>
            </div>
        
            <div class="section">

<table>
	
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
                	<input type="text" name="schCnt" value="${expSch.schCnt }" id="cnt_change_update"> 
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

<table>
	<tbody>
	<tr>
		<td>예약 관리</td>
		<td><button id = "btn_reserve_complete">예약완료</button></td>
		<td><button id = "btn_reserve_wait">예약대기</button></td>
		<td><button id = "btn_reserve_cancel">예약취소</button></td>
	</tr>
	</tbody>
</table>

<hr>
<h2>체험단 예약 리스트</h2>

<table>
	
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
            <th>예약변경</th>
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
				<td>
				
					<c:choose>
						<c:when test="${res.resCnf eq 'N' }">
							<a href="./changeexpres?expCode=${exp.expCode}&schNo=${expSch.schNo }&resCode=${res.resCode }"><button>예약변경</button></a>
						</c:when>
						<c:when test="${res.resCnf eq 'Y' }">
							변경불가
						</c:when>
					</c:choose>
				
				</td>
            </tr>
            </c:forEach>
    </tbody>
</table>
            </div>
        </div>
    </div>
</div>

</body>
</html>