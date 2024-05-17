<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#btnCom").click(function() {
            var ansContent = $("#ansContent").val();
            var otoCode = "${oto.otoCode}"; // Assuming otoCode is defined in your JSP model

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
</head>
<body>

    <h1>문의글 상세</h1>
    <hr>
    
    <h3>카테고리 번호: ${oto.ctOtoNo }</h3>
    <h3>내용: ${oto.otoContent }</h3>
    
    <div id="comList">
        <c:if test="${chkNull }">
            <table class="table">
                <c:forEach var="list" items="${comments }">
                    <tr>
                        <th>답글 번호</th>
                        <td>${list.ansCode }</td>
                    </tr>
                    
                    <tr>
                        <th>답글 내용</th>
                        <td colspan="2">${list.ansContent }</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        
        <c:if test="${chkNull }">
            <p>답글 없음</p>
        </c:if>
    </div>
    
    <div>
        <input type="text" id="ansContent" name="ansContent" placeholder="답글">
        <input type="hidden" id="otoCode" value="${oto.otoCode}">
        <button id="btnCom">작성하기</button>
    </div>
    <br>
    
    <a href="./otodel?otoCode=${oto.otoCode }"><button>문의글 삭제</button></a>
    
</body>
</html>