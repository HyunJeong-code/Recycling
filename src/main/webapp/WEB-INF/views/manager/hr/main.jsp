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
<style type="text/css">body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f5f5f5;
    color: #333;
}

.full {
    display: flex;
    justify-content: center;
    padding: 20px;
}

.wrap {
    width: 80%;
    max-width: 1200px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    border-radius: 8px;
}

.page {
    text-align: center;
    margin-bottom: 20px;
}

h1 {
    font-size: 2em;
    margin-bottom: 10px;
}

hr {
    border: none;
    height: 1px;
    background-color: #ddd;
    margin-bottom: 20px;
}

/* Notice Search Form */
#noticeSearch {
    margin-bottom: 20px;
    text-align: center;
}

#noticeSearch form {
    display: inline-block;
}

#category {
    padding: 5px;
    margin-right: 10px;
}

#search {
    padding: 5px;
    width: 200px;
}

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

/* Notice Table */
.section {
    margin-top: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

thead {
    background-color: #007BFF;
    color: #fff;
}

th, td {
    padding: 10px;
    text-align: left;
    border: 1px solid #ddd;
}

th {
    font-weight: bold;
}

td a {
    color: #007BFF;
    text-decoration: none;
}

td a:hover {
    text-decoration: underline;
}

/* Paging Styles */
.paging {
    text-align: center;
    margin-top: 20px;
}

.paging a {
    display: inline-block;
    padding: 6px 12px;
    margin: 0 5px;
    border: 1px solid #ddd;
    border-radius: 4px;
    color: #007BFF;
    text-decoration: none;
}

.paging a:hover {
    background-color: #f1f1f1;
}
</style>
</head>
<body>
	<div class = "full" >
		<div class="wrap">		
			<div class="page">
				<h1>전체사원 조회</h1>
			</div>
					<div class = "section">
						<table border="1">
							<thead>
								<tr>
									<th></th>
									<th>사원번호</th>
									<th>부서명</th>
									<th>이름</th>
									<th>핸드폰 번호</th>
									<th>이메일</th>
									<th>입사일</th>
									<th>상세조회</th>
								</tr>
							</thead>
				
							<tbody>
								<c:forEach var="select" items="${select }" varStatus="status">
									<!-- mgrOut상태가 'N' 이면 보여주고 'Y'이면 숨기기 -->
									<c:if test="${select.mgrOut eq 'N'}">
									<tr>
										<td><input type="checkbox" id="${select.mgrCode }"name="chkBox"></td>
										<td>${select.mgrCode }</td>
										<td>${select.dName }</td>
										<td>${select.mgrName }</td>
										<td>${select.mgrPhone }</td>
										<td>${select.mgrEmail }</td>
										<td>
											<!-- 데이터 타입이 Date일 경우 사용 -->
											<%-- 	<fmt:formatDate value="${manager.mgrEntDate }" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
					
												<!-- 데이터 타입이 String일 경우 사용 --> 
												<fmt:parseDate value="${select.mgrEntDate }" var="mgrEntDate" pattern="yyyy-MM-dd" />
												<fmt:formatDate value="${mgrEntDate }" pattern="yyyy-MM-dd" />
										</td>
					
										<td><a href="./empdetail?mgrCode=${select.mgrCode }">
												<button>상세정보 보기</button>
										</a></td>
									</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
		</div>
	</div>

	<div>
		<div>
			<a href="./empform"><button>사원정보 입력</button></a>
		</div>
	
		<div>
			<button id="listDel">삭제하기</button>
		</div>
	</div>


</body>
</html>