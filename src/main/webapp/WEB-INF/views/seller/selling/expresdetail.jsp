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
/* 전체 기본 설정 */
* {
	margin: 0;
	padding: 0;
	border: 0;
	vertical-align: baseline;
	box-sizing: border-box;
	font: inherit;
	font-size: 100%;
	line-height: 1.5;
	color: #333;
}

h3 {
	color: #333;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 5px;
	margin-bottom: 20px;
}

/* 외부 레이아웃 설정 */
.full {
	width: 1200px;
	border: 1px solid #ccc;
	margin: 0 auto;
	background-color: #f9f9f9;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	overflow: hidden;
}

aside {
	width: 100%;
	background-color: #f1f1f1;
	border-right: 1px solid #ddd;
	box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.05);
}

.wrap {
	flex: 1;
	display: flex;
	flex-direction: column;
	padding: 20px;
}

/* 상단 페이지 */
.page {
	margin-bottom: 20px;
	font-size: 24px;
	font-weight: bold;
	display: flex;
	align-items: center;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 10px;
}

/* [우]중단 페이지 */
.section {
	margin-top: 20px;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* [우]하단 페이지 */
.btn_bot_style {
	display: flex;
	float: right;
	margin: 0 0 20px 0;
}

/* ------------------------------------- */
/* 상단 */
/* 검색 */
.search_form_wrap {
	padding-top: 20px;
	margin: 0 0 20px 0;
	display: flex;
	border-top: 3px solid #d8d8d8;
	flex-direction: row-reverse;
}
/* 검색창 */
.search_form {
	display: flex;
	align-items: center;
	margin-top: 20px;
	border-radius: 5px;
}

.search_form button[type="submit"] {
	padding: 6px 15px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px; /* 버튼 둥글게 */
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.search_form button[type="submit"]:hover {
	background-color: #0056b3;
}

/* 버튼 */
button[type="submit"] {
	padding: 6px 12px;
	background-color: #007BFF;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button[type="submit"]:hover {
	background-color: #0056b3;
}

/* 본문 */
/* 테이블 세팅 */
table {
	border-collapse: collapse;
	border-top: 3px solid #168;
	width: 100%;
	text-align: center;
	white-space: nowrap;
}

table td {
	padding: 9px;
}

table th {
	color: #168;
	background: #f0f6f9;
	text-align: center;
}

table th, .table td {
	padding: 10px;
	border: 1px solid #ddd;
}

table th:first-child, .table td:first-child {
	border-left: 0;
}

table th:last-child, .table td:last-child {
	border-right: 0;
}

table tr td:first-child {
	text-align: center;
}

table caption {
	caption-side: bottom;
	display: none;
}

table tr:hover {
  background-color: #f5f5f5;
}


/* 버튼세팅 */
.btn_section_detail {
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	font-size: 16px;
	cursor: pointer;
	border-radius: 4px;
	cursor: pointer;
}

/* 하단 */
.btn_bot_wrap {
	padding-top: 10 px;
	display: flex;
	float: right;
	margin:20px 0;
	justify-content: flex-end
}

/* 버튼 세팅 */
.btn_bot_inform, .btn_bot_del {
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	font-size: 16px;
	cursor: pointer;
	border-radius: 4px;
	cursor: pointer;
}

.btn_bot_inform {
	background-color: #4CAF50;
	color: white;
}

.btn_bot_inform:hover {
	background-color: #45a049;
}

.btn_bot_del {
	background-color: #f44336;
	color: white;
	margin-left: 10px;
}

.btn_bot_del:hover {
	background-color: #da190b;
}

button[type="submit"]:hover,
.btn_section_detail:hover,
.btn_bot_inform:hover,
.btn_bot_del:hover {
  background-color: #0056b3;
}


#cnt_change_update{
	width: 67px;
    text-align: center;
    border: 1px solid #ccc;
    animation: blink 1s infinite;
}

table .expName_fix{
	width: 150px;
	text-align: left;	
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
    <div class="full">
    	<aside>
			<c:import url="/WEB-INF/views/layout/seller/sellerheader.jsp"/>
		</aside>
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
            <c:import url="/WEB-INF/views/layout/seller/sellerfooter.jsp"/>
        </div>
    </div>


</body>
</html>