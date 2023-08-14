<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ include file="../../include/includeLink.jsp"%>

<!DOCTYPE html>
<html lang="ko" class="h-100">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width,initial-scale=1">
		<title>프로필</title>
		<link href="/resources/admin/css/style.css" rel="stylesheet">
	</head>
	<body>
		 <div class="authincation h-100">
        <div class="container-fluid h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-6">
                    <div class="authincation-content">
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form">
                                    <h4 class="text-center mb-4">프로필</h4>
                                    <button type="button" class="btn btn-primary" onclick="/user">홈</button>
                                    <form name="formProfile" method="post">
                                        <div class="form-group">
                                            <label><strong>아이디</strong></label>
                                            <input type="text" class="form-control" name="id" value="${member.id }" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label><strong>비밀번호</strong></label>
                                            <input type="password" class="form-control" value="${member.password }"
                                            	name="password" id="password" readonly>
                                            <input type="password" class="form-control" value="" id="checkPwd" style="display: none">
                                            <button type="button" class="btn btn-primary" id="btnChPwd">변경</button>
                                        </div>
                                        <div class="form-group">
                                            <label><strong>닉네임</strong></label>
                                            <input type="text" class="form-control" value="<c:out value="${member.nickname }" />"
                                            	name="nickname" id="nickname" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label><strong>이메일</strong></label>
                                        	<span><c:out value="${member.emailAccount }" />@<c:out value="${member.emailDomain }" /></span>
                                        </div>
                                        <div class="text-center">
                                            <button type="button" class="btn btn-primary btn-block" id="btnUpdt">저장</button>
                                        </div>
                                    </form>
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
	    
	
	    
    </script>
    
	</body>
</html>