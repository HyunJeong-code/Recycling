<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS -->
<link rel="stylesheet" href="/resources/css/manager/manager.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>


<script type="text/javascript">
$(function() {
   // 이미지 클릭 시 파일 선택 창 열기
   $("#profilePreview").on('click', function() {
       $("#empFileUpdate").click();
       console.log(profilePreview)
       console.log(empFileUpdate)
       
   });
   
   // 파일 선택 시 미리보기 이미지 업데이트
   $("#empFileUpdate").on('change', function() {
       if (this.files && this.files[0]) {
           var reader = new FileReader();
           reader.onload = function(e) {
               $("#profilePreview").attr("src", e.target.result);
               console.log(profilePreview)
           }
           reader.readAsDataURL(this.files[0]);
       }
   })
   
    // 일반 파일 이름 표시
  $(document).ready(function() {
        var existingFileName = "${file.mgrFlNo}"; // 기존 파일 이름을 가져옴
        if (existingFileName) {
            $('#file_name').text(existingFileName);
        }

        $('#docfile').on('change', function(event) {
            var file = event.target.files[0]; // 선택된 파일 하나만 처리
            if (file) {
                $('#file_name').text(file.name);
            } else {
                $('#file_name').text("선택된 파일 없음");
            }
        });
    });
	
	// 직접 입력 선택 시 입력 필드 표시
    $("#inPhone").hide();
    
    $("#sPhone").change(function() {
        if ($("#sPhone").val() === "in") {
            $("#inPhone").show();      
            $("#sPhone").hide();    
        } else {
            $("#inPhone").hide();               
            $("#sPhone").show();
        }
    });
    
    // 전화번호를 분리하여 각 필드에 값 설정
    var phone = "${view.mgrPhone}";
    console.log("Full phone number: " + phone); // 전체 전화번호 출력
    var phoneParts = phone.split("-");
    
    if (["010", "011", "017", "016"].includes(phoneParts[0])) {
        $("#sPhone").val(phoneParts[0]);
    } else {
        $("#sPhone").val("in");
        $("#inPhone").val(phoneParts[0]).show();
    }

    $("#mPhone").val(phoneParts[1]);
    
    $("#lPhone").val(phoneParts[2]);
    

    // 폼 제출 시 핸드폰 번호를 합쳐서 숨겨진 입력 필드에 설정
   $("form").submit(function() {

      var sPhone = $("#inPhone").val();
        var email1 = $("#inPhone").val();
        var mPhone = $("#mPhone").val();
        var lPhone = $("#lPhone").val();
        var fullPhone;
        
        // sPhone에서 직접 입력을 선택한 경우
        if ($("#sPhone").val() === "in") {
            fullPhone = inPhone + "-" + mPhone + "-" + lPhone;
        } else {
            // sPhone에서 직접 입력이 아닌 경우
            var sPhone = $("#sPhone").val();
            fullPhone = sPhone + "-" + mPhone + "-" + lPhone;
        }
        
        // 숨겨진 입력 필드에 값 설정
        $("#mgrPhone").val(fullPhone);
        console.log("mgrPhone : " + $("#mgrPhone").val()); // 값 확인
    });
    
	// 직접 입력 선택 시 입력 필드 표시
	$("#inEmail").hide();
	
	$("#mgrEmail2").change(function() {
		if($("#mgrEmail2").val() === "in") {
			$("#inEmail").show();
			$("#mgrEmail2").hide();
		} else {
			$("#inEmail").hide();
			$("#mgrEmail2").show();
		}
	})
	
	// 이메일을 분리하여 각 필드에 값 설정
    var phone = "${view.mgrEmail}";
    var phoneParts = phone.split("@");
    
    if (["@naver.com", "@gmail.com", "@daum.net"].includes(phoneParts[1])) {
        $("#mgrEmail2").val(phoneParts[1]);
    } else {
        $("#mgrEmail1").val("in");
        $("#mgrEmail2").val(phoneParts[1]).show();
    }

    $("#mgrEmail1").val(phoneParts[0]);
    $("#mgrEmail2").val(phoneParts[1]);
    
	// 이메일 처리
	$("form").submit(function() {
	    var empEmail1 = $("#mgrEmail1").val();
	    var empEmail2 = $("#mgrEmail2").val();
	    var inEmail = $("#inEmail").val();
	    var fullEmail;
	    
	    // sPhone에서 직접 입력을 선택한 경우
	    if ($("#mgrEmail2").val() === "in") {
	    	fullEmail = empEmail1 + "@" + empEmail2;
	    } else {
	        // sPhone에서 직접 입력이 아닌 경우
	        var inEmail = $("#inEmail").val();
	        fullEmail = empEmail1 + "@" + empEmail2;
	    }
	    
	    // 숨겨진 입력 필드에 값 설정
	    $("#mgrEmail").val(fullEmail);
	    $("#mgrEmail").val(fullEmail);
	});

   //부서
   $("#update").click(function() {
      console.log("deptno : " + $("#detpno").val());
      
      if($("#detpno").val() === 'CEO') {
         $("#detpno").val(10);
      } else if ($("#detpno").val() === '인사팀') {
         $("#detpno").val(20);
      } else if($("#detpno").val() === '판매제휴팀') {
         $("#detpno").val(30);         
      } else {
         $("#detpno").val(40);                  
      }
   })
   
	var rexPw = /[a-zA-Z0-9!@#$%]{8, 15}/;
	
	// 비밀번호
	$("#mgrPw").blur(function() {
		if($("#mgrPw").val() == '') {
			$("#pw").css("display", "block");
		} else {
			$("#pw").css("display", "none");
			
			if(rexPw.test($("#mgrPw"))) {
				$("#chkPw").css("display", "block");				
			} else {
				$("#chkPw").css("display", "none");								
			}
		}
	})
	
	// 비밀번호 확인
	$("#newPw").blur(function() {
		if($("#newPw").val() == '') {
			$("#cfmPw").css("display", "block");			
		} else {
			$("#cfmPw").css("display", "none");
			
			// 비밀번호 일치
			if($("#newPw").val() === $("#mgrPw").val()) {
				$("#okPw").css("display", "block");				
				$("#noPw").css("display", "none");				
			} else {
				$("#okPw").css("display", "none");				
				$("#noPw").css("display", "block");				
			}
		}
	})
	
	$("#newPw").blur(function() {
		var mgrPw = $("#mgrPw").val();
		var newPw = $("#newPw").val();
		
		console.log("mgrPw : " + mgrPw);
		console.log("newPw : " + newPw);
		
		if(newPw == '') {
			$("#cfmPw").css("display", "block");						
		} else {
			$("#cfmPw").css("display", "none");
			
			if(mgrPw === newPw) {
				$("#okPw").css("display", "block");
				$("#noPw").css("display", "none");					
			} else {
				$("#okPw").css("display", "none");		
				$("#noPw").css("display", "block");					
			}
		}
	})
})

function cancelUpdate() {
      
   window.history.back();
      
}

//핸드폰 번호 처리
var mgrPhone = "${manager.mgrPhone}".split("-");
console.log("mgrPhone : " + mgrPhone);

</script>
<style type="text/css">
/* 중단 페이지 */
.section {
	margin-top: 20px;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.section_top {
	display: flex;
	align-items: flex-start;
	margin-bottom: 20px;
}

.section img {
	height: 200px;
	width: 200px;
	border-radius: 50%;
	object-fit: cover;
	margin: 20px;
}

.section .deptno_box, .section .mgrName_box, .section .mgrCode_box,
	.section .mgrEntDate_box {
	margin-bottom: 15px;
	display: flex;
	margin-left: 20px;
}

label {
	color: #373f57;
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 5px;
	width: 200px;
	text-align: justify;
}

input[type="text"], select {
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 14px;
}

.section h3 {
	color: #333;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 5px;
	margin-bottom: 20px;
}

.section_top_privacy {
	padding: 20px;
	margin-left: 20px;
	margin-top: 20px;
	flex: 1;
}

.section_top_privacy div {
	margin-bottom: 10px;
}

/* --------------------------------------- */
/* 색션 하단 */
.section_bot_title {
	margin-bottom: 20px;
	font-size: 24px;
	font-weight: bold;
	display: flex;
	align-items: center;
	border-bottom: 2px solid #007BFF;
	padding-bottom: 10px;
}

.section_bot_itembox {
	width: 800px;
	margin-left: 280px;
}

/* 파일버튼 디자인 */
.bot_document_filebox {
	display: flex;
	margin-bottom: 15px;
}


.bot_document_filebox .file_find {
	text-align: right;
	width: 100px;
}

.bot_document_filebox .file_name{
	overflow: auto;
}

.bot_document_filebox input[type="file"] {
	width: 0;
	height: 0;
	overflow: hidden;
	display: none;
}

.bot_document_filebox .document_file {
	display: inline-block;
	height: 46px;
	padding: 0 10px;
	vertical-align: middle;
	width: 79%;
	color: #999999;
}

.btnRight{
	margin-right: 20px;
}

.phone_box{
	display: flex;
	padding-bottom: 20px
}

.email_box{
	display: flex;
	padding-bottom: 20px
}

.mgrBirth_box{
	display: flex;
	padding-bottom: 20px
}

.mgrGender_box{
	display: flex;
	padding-bottom: 20px
}

.mgrPw_box{
	display: flex;
	padding-bottom: 20px
}

.newPw_box{
	display: flex;
	padding-bottom: 20px
}

.btn_bot_wrap{

}


</style>


</head>
<body>

	<c:import url="/WEB-INF/views/layout/manager/managerheader.jsp"/>
    <div class="admin-container">
					<sec:authentication var="managerLogin" property="principal"/>
	<c:if test="${managerLogin.deptno eq 10}">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
	</c:if>
	<c:if test="${managerLogin.deptno eq 20}">
		<c:import url="/WEB-INF/views/layout/manager/managerhrmenu.jsp"/>
	</c:if>
	<c:if test="${managerLogin.deptno eq 30}">
		<c:import url="/WEB-INF/views/layout/manager/managerslsmenu.jsp"/>
	</c:if>
	<c:if test="${managerLogin.deptno eq 40}">
		<c:import url="/WEB-INF/views/layout/manager/managercsmenu.jsp"/>
	</c:if>
		<div class = "full content" >
		<div class="wrap">
			<div class="page">
				사원정보 수정하기
			</div>

         <div class="section">
            <form action="./empupdate?mgrCode=${view.mgrCode }" method="post" enctype="multipart/form-data">
               
               <div class ="section_top">
                     
               <input type="file" id="empFileUpdate" name="empFileUpdate" style="display: none;" />
               <div class="select_img">
                   <img alt="없음" id="profilePreview" src="${pageContext.request.contextPath}/upload/${profileList.storedName}" />
                  <input type="hidden" id="mgrFlNo" name="mgrFlNo" value="${profileList.mgrFlNo }"/>
               </div>
               
                  <div class="section_top_privacy">
                     <div class="mgrCode_box">
                        <label for ="mgrCode">사원번호</label>
                        <div>${view. mgrCode }</div>
                     </div>
                  
                     <div class="deptno_box">
                        <label for="detpno">부 서 명</label>
                        <select name="deptno" id="deptno">
                           <option value="20">인사팀</option>
                           <option value="30">판매제휴팀</option>
                           <option value="40">구매CS팀</option>
                        </select>
                     </div>
                     
                     <div class="mgrName_box">
                        <label for ="mgrName">이 름</label>
                        <input type="text" name ="mgrName" id="mgrName" value="${view.mgrName }">
                     </div>
                     

                     <div class="mgrEntDate_box">
                        <label for ="mgrEntDate">입 사 일</label>
                           <div>
                              <fmt:parseDate value="${view. mgrEntDate }" var="mgrEntDate" pattern="yyyy-MM-dd" />
                              <fmt:formatDate value="${mgrEntDate }" pattern="yyyy-MM-dd" />
                           </div>
                     </div>
                  </div>
               </div>

					<div class="section_bot_title">사원 정보</div>
					
				<div class="section_bot_itembox">
				
				<div class="mgrPw_box">
					<label for="mgrPw">새 비밀번호</label>
					<input type="text" id="mgrPw" name="mgrPw"><br>
					<div id="pw" style="display:none; color:red;">비밀번호는 필수입니다.</div>
				</div>
				
				<div class ="newPw_box">
					<label for="newPw">새 비밀번호 확인</label>
					<input type="text" id="newPw" name="newPw"><br>
					<div id="cfmPw" style="display: none; color: red;">비밀번호를 입력해주세요.</div>
					<div id="okPw" style="display: none; color: green;">비밀번호가 일치합니다.</div>
					<div id="noPw" style="display: none; color: red;">비밀번호가 일치하지 않습니다.</div>
				</div>
				<div class="phone_box">
				<label for="sPhone">전화 번호</label>
				<select class="sPhone" id="sPhone" name="sPhone">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="017">017</option>
					<option value="016">016</option>
					<option value="in">직접 입력</option>
				</select>
	                <input type="text" class="s" id="inPhone" name="inPhone" maxlength="3">
						<div class="hyphen">-</div>
	                <input type="text" class="s" id="mPhone" name="mPhone" maxlength="4">
	                    <div class="hyphen">-</div>
	                <input type="text" class="s" id="lPhone" name="lPhone" maxlength="4" >
                </div>
                <input type="hidden" id="mgrPhone" name="mgrPhone">
                
					
				<div class="email_box">
				<label for="mgrEmail1">이메일</label>	
				
					<input type="text" id="mgrEmail1" name="mgrEmail1" required="required">
			
					<select class="mgrEmail2" name="mgrEmail2" id="mgrEmail2" required="required">
						<option value="naver.com">@naver.com</option>
						<option value="gmail.com">@gmail.com</option>
						<option value="daum.net">@daum.net</option>
						<option value="in">직접 입력</option>
					</select>
					<input type="text" id="inEmail" name="inEmail" placeholder="@test.com 형식으로 입력하세요.">
				</div>
				<input type="hidden" id="mgrEmail" name="mgrEmail">
					
					<div class="mgrBirth_box">
						<label for ="mgrBirth">생년월일</label>	
						<fmt:parseDate value="${view.mgrBirth }" var="mgrBirth" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${mgrBirth }" pattern="yyyy-MM-dd" />
					</div>
					
					<div class="mgrGender_box">
						<label for ="mgrGender">성별</label>
						<div>${view.mgrGender }</div>
					</div>

					<!-- 개명, 주소지변경 등 -->
					<div class="bot_document_filebox">
					    <label>필요서류 파일</label>		
					    <input class="document_file" type="file" id="docfile" name="docfile" value="${file.storedName }" required="required">
					    <div id="file_name" class="file_name">선택된 파일 없음</div>
					    <label class="file_find" for="docfile">파일찾기</label>
					</div>
				</div>
	
				<div class="btn_bot_wrap">
					<a href="./empupdate"><button class="btn btnRight">수정하기</button></a>
					<button class="btn btnLeft" onclick="cancelUpdate()">돌아가기</button>
				</div>
				</form>
				
			</div>
		</div>
	</div>
</div>


</body>
</html>