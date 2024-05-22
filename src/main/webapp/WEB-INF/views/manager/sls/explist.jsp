<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/explist.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
/* 상세조회 클릭에 따른 exp_sch보여주기 */
// $(function() {
//     $(".expSch").click(function() {
//     	console.log($(this).attr("id"));
//         $.ajax({
//             type: "GET", // HTTP 요청 방법을 지정
//             url: "./expschlist",
//             data: {
//             	expCode : $(this).attr("id") 
// 				, expName : $(this).closest('tr').find('td:eq(2)').text()
//             },
//             dataType: "html",
//             success: function(res) {
//                 console.log("AJAX 성공");
//                 console.log(res);
                
//                 $("#expSchResult").html(res)
//             },
//             error: function() {
//                 console.log("AJAX 실패");
//             }
//         });
//     });
// });

/* 체험 리스트 삭제기능 */
$(function() {
	$("#expListDel").click(function() {

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
				url : "./explistdel",
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

	})
})

</script>


</head>
<body>
	<div class="full">
			<aside>
				왼쪽
			</aside>
		<div class="wrap">

			<div class="page">
				<h1 class ="explist_title">체험단 조회</h1>
			</div>
			
			<form action="./explist" method="post" class="search_form">
			    <select id="explist_category" name="category">
			        <option value="title">제목</option>
			        <option value="writerId">작성자</option>
			    </select>
			    <input type="text" id="search" name="search" placeholder="검색어를 입력하세요">
			    <button type="submit">검색</button>
			</form>
			
			<div class="section">
				<table>
					<thead>
						<tr>
							<th></th>
							<th>판매자 ID</th>
							<th>체험 제목</th>
							<th>참가 비용</th>
							<th>등록일</th>
							<th>상세보기</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="explist" items="${explist }">
							<tr>
								<td><input type="checkbox" id="${explist.expCode }" name="chkBox"></td>
								<td>${explist.sCode }</td>
								<td>${explist.expName }</td>
								<td>${explist.expPrice }</td>
								<td>
									<fmt:parseDate value="${explist.expDate }" var="expDate" pattern="yyyy-MM-dd" />
									<fmt:formatDate value="${expDate }" pattern="yyyy-MM-dd" />
								</td>
								
								<td><a href="./expdetail?expCode=${explist.expCode }"><button id ="${explist.expCode }">상세조회</button></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
				    <div class="btn_explist_form_del">
				        <a href="./expform"><button>체험단 등록</button></a>
				        <button id="expListDel">삭제</button>
				    </div>
			<!-- ---------------------------------------------------------------------------------- -->

<!-- 			<div class="page"> -->
<!-- 				<h1>체험단 조회 페이지[exp_code 판매상품별 기준 정렬]</h1> -->
<!-- 				<hr> -->
<!-- 			</div> -->
			
<!-- 			<div id = expSchResult></div> -->

		</div>
		<!-- wrap -->
	</div>
	<!-- full -->
</body>
</html>