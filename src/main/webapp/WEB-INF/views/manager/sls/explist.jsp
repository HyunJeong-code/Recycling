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
<script type="text/javascript">
/* 상세조회 클릭에 따른 exp_sch보여주기 */
$(function() {
    $(".expSch").click(function() {
    	console.log($(this).attr("id"));
        $.ajax({
            type: "GET", // HTTP 요청 방법을 지정
            url: "./expschlist",
            data: {
            	expCode : $(this).attr("id") 
				, expName : $(this).closest('tr').find('td:eq(2)').text()
            },
            dataType: "html",
            success: function(res) {
                console.log("AJAX 성공");
                console.log(res);
                
                $("#expSchResult").html(res)
            },
            error: function() {
                console.log("AJAX 실패");
            }
        });
    });
});

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
<style type="text/css">
/* 기본 설정 */
body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
    color: #333;
}

/* 전체 페이지 레이아웃 */
.full {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}

.wrap {
    width: 90%;
    max-width: 1200px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    border-radius: 8px;
}

/* 헤더 스타일 */
.page h1 {
    text-align: center;
    color: #007BFF;
}

.page hr {
    border: 0;
    height: 1px;
    background-color: #007BFF;
}

/* 섹션 스타일 */
.section {
    margin-top: 20px;
}

.section table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

.section table th,
.section table td {
    padding: 10px;
    border: 1px solid #ddd;
    text-align: center;
}

.section table th {
    background-color: #f9f9f9;
    font-weight: bold;
}

.section table td input[type="checkbox"] {
    cursor: pointer;
}

/* 버튼 스타일 */
button {
    background-color: #007BFF;
    color: #fff;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    border-radius: 5px;
    font-size: 16px;
    margin-top: 10px;
}

button:hover {
    background-color: #0056b3;
}

/* 링크 버튼 스타일 */
a button {
    background-color: #6c757d;
    margin-right: 10px;
}

a button:hover {
    background-color: #5a6268;
}

/* 상세조회 결과 스타일 */
#expSchResult {
    margin-top: 20px;
    padding: 20px;
    background-color: #f9f9f9;
    border: 1px solid #ddd;
    border-radius: 5px;
}
</style>

</head>
<body>
	<div class="full">
		<div class="wrap">

			<div class="page">
				<h1>체험단 조회 페이지[판매자 기준 정렬]</h1>
				<hr>
			</div>

			<div class="section">
				<table>
					<thead>
						<tr>
							<th>V</th>
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
								
								<td><button id ="${explist.expCode }" class = "expSch" >상세조회</button></td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div>
				<button id="expListDel">삭제</button>
			</div>
			<div>
				<a href="./expform"><button>체험단 등록</button></a>
			</div>
			<!-- ---------------------------------------------------------------------------------- -->

			<div class="page">
				<h1>체험단 조회 페이지[exp_code 판매상품별 기준 정렬]</h1>
				<hr>
			</div>
			
			<div id = expSchResult></div>

		</div>
		<!-- wrap -->
	</div>
	<!-- full -->
</body>
</html>