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

	})
})

/* 예약 취소버튼 클릭시[예약취소 변경] */
$(function() {
	$("#btn_reserve_cancel").click(function() {

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
						alert("예약 취소");
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
    max-width: 1000px;
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

.table th, .table td {
    border: 1px solid #dee2e6;
    padding: 8px;
    text-align: center;
}

.table th {
    background-color: #007bff;
    color: #fff;
}

.table th:first-child, .table td:first-child {
    background-color: #f8f9fa;
    font-weight: bold;
}

.btn {
    padding: 5px 15px;
    border-radius: 4px;
}

.btn-primary {
    background-color: #007bff;
    border-color: #007bff;
}

.btn-primary:hover {
    background-color: #0056b3;
    border-color: #0056b3;
}

.btn-danger {
    background-color: #dc3545;
    border-color: #dc3545;
}

.btn-danger:hover {
    background-color: #c82333;
    border-color: #bd2130;
}
</style>

</head>
<body>
    <div class="full">
        <div class="wrap">
            <div class="page">
	            <h1>체험단 예약 관리</h1>
				<hr>
				<br>
            </div>
        
            <div class="section">
                <table border="1" class="table table-hover table-sm" style="width:1000px;">
	
	<thead>
        <tr>
            <th>상품 번호</th>
            <th>체험 제목</th>
            <th>참가 비용</th>
            <th>등록일</th>
        </tr>
    </thead>
	<tbody>
            <tr>
                <td>${exp.expCode}</td>
                <td>${exp.expName}</td>
                <td>${exp.expPrice}</td>
                <td>
                	<fmt:parseDate value="${exp.expDate}" var="expDate" pattern="yyyy-MM-dd HH:mm:ss" />
               		<fmt:formatDate value="${expDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>
            </tr>
    </tbody>
</table>

<table>
	<tbody>
	<tr>
		<td>예약 관리</td>
		<td><button id = "btn_reserve_complete">예약완료</button></td>
		<td><button id = "btn_reserve_cancel">예약취소</button></td>
	</tr>
	</tbody>
</table>

<hr>
<h2>체험단 예약 리스트</h2>

<table border="1" class="table table-hover table-sm" style="width:1000px;">
	
	<thead>
        <tr>
        	<th>V</th>
            <th>예약번호</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>이메일</th>
            <th>인원</th>
            
            
            <th>예약시간</th>
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
                
                
                <td>${res.resTime }</td>
				<td>
					<c:choose>
						<c:when test="${res.resCnf eq 'Y' }">
							예약확정
						</c:when>
						<c:when test="${res.resCnf eq 'N' }">
							예약취소
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


</body>
</html>