<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ include file="../../include/includeLink.jsp"%>

<title>회원가입</title>

<!--*******************
        Preloader start
    ********************-->
<div id="preloader">
	<div class="sk-three-bounce">
		<div class="sk-child sk-bounce1"></div>
		<div class="sk-child sk-bounce2"></div>
		<div class="sk-child sk-bounce3"></div>
	</div>
</div>
<!--*******************
        Preloader end
    ********************-->

<div class="row">
	<div class="col-lg-12">
			<div class="card w-75 mx-auto">
				<div class="card-header justify-content-center">
					<h3 class="card-title">회원가입</h3>
				</div>
				<div class="card-body">
					<div class="form-validation">
						<form name="formSu" method="post">
							<div class="row w-75 mx-auto">
								<div class="w-100 mx-auto">
									<div class="form-group row w-50">
										<label class="col-lg-4 col-form-label" for="val-username">아이디
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" id="id"
												name="id" value="<c:out value='${item.id }'/>" placeholder="아이디를 입력하세요.">
										</div>
									</div>
									<div class="form-group row w-50">
										<label class="col-lg-4 col-form-label" for="val-password">비밀번호
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<input type="password" class="form-control" id="password"
												name="password" value="<c:out value='${item.password }'/>" placeholder="최소 6자 이상">
										</div>
									</div>
									<div class="form-group row w-50">
										<label class="col-lg-4 col-form-label"
											for="val-confirm-password">비밀번호 확인 <span
											class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<input type="password" class="form-control"
												id="val-confirm-password" name="val-confirm-password"
												value="<c:out value='${item.password }'/>"
												placeholder="">
										</div>
									</div>
									<div class="form-group row w-50">
										<label class="col-lg-4 col-form-label"
											for="nickname">닉네임 <span
											class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<input type="text" class="form-control"
												id="nickname" name="nickname"
												value="<c:out value='${item.nickname }'/>"
												placeholder="">
										</div>
									</div>
									<div class="form-group row justify-content-start flex-nowrap w-50">
										<label class="col-lg-4 col-form-label" for="val-email">이메일
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" id="emailAccount"
												value="<c:out value='${item.email }'/>"
												name="emailAccount" placeholder="">
										</div>
											<span>@</span>
										<div class="col-lg-6 w-50">
											<select class="form-control" id="emailDomain" name="emailDomain">
												<option value="">--선택하세요--</option>
												<option value="<c:out value='${item.emailDomain} = 1'/>">naver.com</option>
												<option value="<c:out value='${item.emailDomain} = 2'/>">gmail.com</option>
												<option value="<c:out value='${item.emailDomain} = 3'/>">daum.net</option>
											</select>
										</div>
									</div>
									<div class="form-group row w-50">
										<label class="col-lg-4 col-form-label" for="gender">성별
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<select class="form-control" id="gender" name="gender">
												<option value="">--선택하세요--</option>
												<option value="<c:out value='${item.gender} = 4'/>">남성</option>
												<option value="<c:out value='${item.gender} = 5'/>">여성</option>
												<option value="<c:out value='${item.gender} = 6'/>">기타</option>
											</select>
										</div>
									</div>
									<div class="form-group row w-50">
										<label class="css-control css-control-primary css-checkbox"
												for="val-terms"> <input type="checkbox"
												class="css-control-input mr-2" id="val-terms"
												name="val-terms" value="1"> <span
												class="css-control-indicator"></span> 개인정보 수집 동의
										</label>
									</div>
									<div class="form-group row">
										<div class="col-lg-8 ml-auto">
											<button type="button" class="btn btn-primary" id="btnSu">회원가입</button>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- Required vendors -->
<script src="/resources/admin/vendor/global/global.min.js"></script>
<script src="/resources/admin/js/quixnav-init.js"></script>
<script src="/resources/admin/js/custom.min.js"></script>


<!-- Jquery Validation -->
<script src="/resources/admin/vendor/jquery-validation/jquery.validate.min.js"></script>
<!-- Form validate init -->
<script src="/resources/admin/js/plugins-init/jquery.validate-init.js"></script>

<script type="text/javascript">
	$("#btnSu").on("click", function() {
		
		$("form[name=formSu]").attr("action", '/signupIns').submit();
	
	});
	
</script>

