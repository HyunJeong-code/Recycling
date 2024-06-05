<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 상세</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#btnCom").click(function() {
            var ansContent = $("#ansContent").val().trim();
            var otoCode = "${oto.otoCode}";

            if (ansContent === "") {
                alert("답글 내용을 입력해주세요");
                return;
            }

            console.log("ansContent: ", ansContent);
            console.log("otoCode: ", otoCode);

            $.ajax({
                url: "/manager/cs/ansform",
                type: "post",
                data: {
                    "ansContent": ansContent,
                    "otoCode": otoCode
                },
                success: function(res) {
                    console.log("success");
                    console.log("res: ", res);
                    if (res > 0) {
                        location.reload();
                    }
                },
                error: function() {
                    console.log("error");
                }
            });
        });
    });
</script>
<link rel="stylesheet" href="/resources/css/manager/cs/ansform.css">
</head>
<body>
	<div class="full">
	    <aside>
	    </aside>
	    <div class="wrap">
	        <div class="page">문의글 상세</div>
	        <div class="section">
	            <%-- <h3>카테고리 번호: ${oto.ctOtoNo }</h3> --%>
	            <h3>${oto.otoTitle }</h3>
	            <h3 style="font-weight: normal;">${oto.otoContent }</h3>
	        </div>
	        
	        <div class="section">
			    <div id="comList">
			        <c:if test="${not empty comments}">
			            <table class="table">
			                <c:forEach var="list" items="${comments}">
			                    <tr>
			                        <th>답글 내용</th>
			                        <td colspan="2">${list.ansContent}</td>
			                    </tr>
			                    <tr>
			                        <th>작성일</th>
			                        <td>
			                            <fmt:parseDate value="${list.ansDate}" var="ansDate" pattern="yyyy-MM-dd" />
			                            <fmt:formatDate value="${ansDate}" pattern="yyyy-MM-dd" />
			                        </td>
			                    </tr>
			                    <tr>
			                        <td colspan="3"><hr></td>
			                    </tr>
			                </c:forEach>
			            </table>
			        </c:if>
			        
			        <c:if test="${empty comments}">
			            <p>답글 없음</p>
			        </c:if>
			    </div>
			</div>
	
	        <div class="section">
	            <textarea id="ansContent" name="ansContent" placeholder="답글"></textarea>
	            <input type="hidden" id="otoCode" value="${oto.otoCode }">
	            <button id="btnCom" class="btn_section_detail">작성하기</button>
	        </div>
	
	        <div class="btn_bot_wrap">
	            <a href="./otodel?otoCode=${oto.otoCode }"><button class="btn_bot_del">문의글 삭제</button></a>
	            <a href="./main"><button class="btn_bot_inform">목록</button></a>
	        </div>
	    </div>
	</div>
</body>
</html>
