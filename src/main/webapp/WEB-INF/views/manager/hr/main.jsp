<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/manager/hr/main.css">


<script type="text/javascript">
	$(function() {
		$("#listDel").click(function() {

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
					url : "./emplistdelete",
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
	<div class = "full" >
		<aside>
			확인
		</aside>
		<div class="wrap">		
			<div class="page">
				전체사원 조회
			</div>
			
			<div class="search_form">
			    <input type="text" id="search" name="search" placeholder="검색어를 입력하세요">
			    <button type="submit">검색</button>
			</div>
			
					<div class = "section">
						<table>
							<thead>
								<tr>
									<th></th>
									<th>부서명</th>
									<th>이름</th>
									<th>사원번호</th>
									<th>핸드폰 번호</th>
									<th>이메일</th>
									<th>상세조회</th>
								</tr>
							</thead>
				
							<tbody>
								<c:forEach var="select" items="${select }" varStatus="status">
									<!-- mgrOut상태가 'N' 이면 보여주고 'Y'이면 숨기기 -->
									<c:if test="${select.mgrOut eq 'N'}">
									<tr>
										<td><input type="checkbox" id="${select.mgrCode }"name="chkBox"></td>
										<td>${select.dName }</td>
										<td>${select.mgrName }</td>
										<td>${select.mgrCode }</td>
										<td>${select.mgrPhone }</td>
										<td>${select.mgrEmail }</td>
										<td><a href="./empdetail?mgrCode=${select.mgrCode }">
												<button class="btn_section_detail">상세정보 보기</button></a>
										</td>
									</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div><!-- section -->
							<div class="btn_bot_wrap">
									<a href="./empform"><button class="btn_bot_inform">사원정보 입력</button></a>
									<button id="listDel" class="btn_bot_del">삭제하기</button>
							</div>
		</div><!-- wrap -->
	</div><!-- full -->



</body>
</html>