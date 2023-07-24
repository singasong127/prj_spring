<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html lang="ko" class="h-100">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>로그인</title>
    <link href="/resources/admin/css/style.css" rel="stylesheet">

</head>

<body class="h-100">
    <div class="authincation h-100">
        <div class="container-fluid h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-6">
                    <div class="authincation-content">
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form">
                                    <h4 class="text-center mb-4">로그인</h4>
                                    <form action="/xdmindex">
                                        <div class="form-group">
                                            <label><strong>아이디</strong></label>
                                            <input type="text" class="form-control" value="chicken" name="id" id="id">
                                        </div>
                                        <div class="form-group">
                                            <label><strong>비밀번호</strong></label>
                                            <input type="password" class="form-control" value="010234" name="password" id="password">
                                        </div>
                                        <div class="form-row d-flex justify-content-between mt-4 mb-2">
                                            <div class="form-group">
                                                <div class="form-check ml-2">
                                                    <input class="form-check-input" type="checkbox" id="basic_checkbox_1">
                                                    <label class="form-check-label" for="basic_checkbox_1">아이디 저장</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <a href="page-forgot-password.html">비밀번호를 잊어버렸나요?</a>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <button type="button" class="btn btn-primary btn-block" id="btnLogin">로그인</button>
                                        </div>
                                    </form>
                                    <div class="new-account mt-3">
                                        <p>계정이 없으신가요? <a class="text-primary" href="/signup">회원가입</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="/resources/admin/vendor/global/global.min.js"></script>
    <script src="/resources/admin/js/quixnav-init.js"></script>
    <script src="/resources/admin/js/custom.min.js"></script>
    
    <script type="text/javascript">
	    $("#btnLogin").on("click", function(){
	    	
	    	if(validation() == false) return false;
	    	
	    	$.ajax({
	    		async: true 
	    		,cache: false
	    		,type: "post"
	    		/* ,dataType:"json" */
	    		,url: "/loginProc"
	    		/* ,data : $("#formLogin").serialize() */
	    		,data : { "id" : $("#id").val(),
	    			"password" : $("#password").val()}
	    		,success: function(response) {
	    			if(response.rt == "success") {
	    				// alert(response.rtMember.nickname);
	    				location.href = "/user";
	    			} else {
	    				alert("아이디 혹은 비밀번호를 확인해주세요.");
	    			}
	    		}
	    		,error : function(jqXHR, textStatus, errorThrown){
	    			alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
	    		}
	    	});
	    });
	
	
	    validation = function() {
	    	// if(!checkNull($("#ifmmId"), $.trim($("#ifmmId").val()), "아이디를 입력해 주세요!")) return false;
	    	// if(!checkNull($("#ifmmPassword"), $.trim($("#ifmmPassword").val()), "비밀번호를 입력해 주세요!")) return false;
	    }
    </script>
    
</body>

</html>