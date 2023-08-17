<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ include file="../../include/includeLink.jsp"%>

<title>회원가입</title>

<style>
.id_ok {
	color: #008000;
}

.id_already {
	color: #cc5500;
}
</style>

<div class="row">
	<div class="col-lg-12">
		<div class="card w-75 mx-auto">
			<div class="card-header justify-content-center">
				<h3 class="card-title">회원가입</h3>
			</div>
			<div class="card-body">
				<div class="form-validation">
					<form name="formSu" method="post" enctype="multipart/form-data">
						<div class="row w-75 mx-auto">
							<div class="w-100 mx-auto">
								<div class="form-group row w-50">
									<label class="col-lg-4 col-form-label" for="userType">회원 구분
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<select class="form-control" id="userType" name="userType">
											<option value="">--선택하세요--</option>
											<option value="<c:out value='0'/>">일반 사용자</option>
											<option value="<c:out value='1'/>">사업자</option>
										</select>
									</div>
								</div>
								<div class="form-group row w-50">
									<label class="col-lg-4 col-form-label" for="id">아이디 <span
										class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="id"
											oninput="checkId()" name="id"
											value="<c:out value='${item.id}'/>" placeholder="아이디를 입력하세요.">
										<span class="id_ok" style="display: none">사용 가능한
											아이디입니다.</span> <span class="id_already" style="display: none">중복된
											아이디입니다.</span>
									</div>
								</div>
								<div class="form-group row w-50">
									<label class="col-lg-4 col-form-label" for="password">비밀번호
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="password" class="form-control" id="password"
											name="password" value="<c:out value='${item.password}'/>"
											placeholder="최소 6자 이상">
									</div>
								</div>
								<div class="form-group row w-50">
									<label class="col-lg-4 col-form-label" for="confirmPwd">비밀번호
										확인 <span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="password" class="form-control" id="confirmPwd"
											name="confirmPwd" value="" placeholder="">
									</div>
								</div>
								<div class="form-group row w-50">
									<label class="col-lg-4 col-form-label" for="nickname">닉네임
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="nickname"
											name="nickname" value="<c:out value='${item.nickname}'/>"
											placeholder="">
									</div>
								</div>
								<div
									class="form-group row justify-content-start flex-nowrap w-50">
									<label class="col-lg-4 col-form-label" for="emailAccount">이메일
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="emailAccount"
											value="<c:out value='${item.emailAccount}'/>"
											name="emailAccount" placeholder="">
									</div>
									<span>@</span>
									<div class="col-lg-6 w-50">
										<select class="form-control" id="emailDomain"
											name="emailDomain">
											<option value="">--선택하세요--</option>
											<option value="<c:out value='1'/>">naver.com</option>
											<option value="<c:out value='2'/>">gmail.com</option>
											<option value="<c:out value='3'/>">daum.net</option>
										</select>
									</div>
								</div>
								<div class="form-group row w-50">
									<label class="col-lg-4 col-form-label" for="dob">생년월일
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="dob"
											name="dob" value="<c:out value='${item.dob}'/>"
											placeholder="">
									</div>
								</div>
								<div class="form-group row w-50">
									<label class="col-lg-4 col-form-label" for="gender">성별
										<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<select class="form-control" id="gender" name="gender">
											<option value="">--선택하세요--</option>
											<option value="<c:out value='4'/>">남성</option>
											<option value="<c:out value='5'/>">여성</option>
											<option value="<c:out value='6'/>">기타</option>
										</select>
									</div>
								</div>
								<div class="form-group row w-50">
									<label class="css-control css-control-primary css-checkbox"
										for="agreeCheck"> <input type="checkbox"
										class="css-control-input mr-2" id="agreeCheck"
										name="agreeCheck" value="1"> <span
										class="css-control-indicator"></span> 개인정보 수집 동의
									</label>
									<input type="hidden" name="agreeDT" value="<c:out value='${dt.nowDt }' />">
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
<script
	src="/resources/admin/vendor/jquery-validation/jquery.validate.min.js"></script>
<!-- Form validate init -->
<script src="/resources/admin/js/plugins-init/jquery.validate-init.js"></script>
<script src="/resources/js/validation.js"></script>
<script src="/resources/js/commomXdm.js"></script>
<script src="/resources/js/ConstantsXdm.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script type="text/javascript">
	
	var objId = $("#id");
	var objPw = $("#password");
	var objCfPw = $("#confirmPwd"); 
	var objNick = $("#nickname");
	var objEa = $("#emailAccount");
	var objEd = $("#shEmain");
	var objGen = $("#shGen");
	var objCheck = $("#agreeCheck").is(':checked');
	
	
	validationInst = function() {
		if( check(objId) == false) return false;
		/* if( check(objPw) == false) return false;
		if( check(objCfPw) == false) return false;
		if( check(objNick) == false) return false;
		if( check(objEa) == false) return false;
		if( check(objEd) == false) return false;
		if( check(objGen) == false) return false;
		if( check(objCheck) == false) return false; */
	}

	$("#btnSu").on("click", function() {
		
		if(validationInst() == false) return false;
		
		$("form[name=formSu]").attr("action", '/signupins').submit();
		
	});
	
	$(function() {
		$("#dob").datepicker({
			dateFormat: 'yy-mm-dd'
			,showOtherMonths: true
			,showMonthAfterYear: true
			,changeYear: true //option값 년 선택 가능
			,changeMonth: true //option값  월 선택 가능                
			,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
			,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
			,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
			,buttonText: "선택" //버튼 호버 텍스트              
			,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
			,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
			,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
			,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
			,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
			,yearRange: '1950:2023'
		});
		 $('#dob').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후
	});
	
	checkId = function() {
		var id = $("#id").val();
		$.ajax({
			async: true,
			cache: false,
			url: '/signup/idCheck',
			type: 'post',
			data: {"id": id},
			success: function(response) {
				if(response.rt == "available") {
					$('.id_ok').css("display", 'inline-block');
					$('.id_already').css("display", "none");
				} else {
					$('.id_ok').css("display", 'none');
					$('.id_already').css("display", "inline-block");
				}
			}, error: function() { $("#id").focus(); }
		});
	}
	
	// 파일,이미지 업로드
	upload = function(objName, seq, allowedMaxTotalFileNumber, allowedExtdiv, allowedEachFileSize, allowedTotalFileSize, uiType) {
	
//		objName 과 seq 는 jsp 내에서 유일 하여야 함.
//		memberProfileImage: 1
//		memberImage: 2
//		memberFile : 3

    	
//		uiType: 1 => 이미지형
//		uiType: 2 => 파일형
//		uiType: 3 => 프로필형

		var files = $("#" + objName +"")[0].files;
		var filePreview = $("#" + objName +"Preview");
		var numbering = [];
		var maxNumber = 0;
		
		if(uiType == 1) {
			var uploadedFilesCount = document.querySelectorAll("#" + objName + "Preview > div > img").length;
			var tagIds = document.querySelectorAll("#" + objName + "Preview > div");
			
			for(var i=0; i<tagIds.length; i++){
				var tagId = tagIds[i].getAttribute("id").split("_");
				numbering.push(tagId[2]);
			}
			
			if(uploadedFilesCount > 0){
				numbering.sort();
				maxNumber = parseInt(numbering[numbering.length-1]) + parseInt(1);
			}
		} else if(uiType == 2){
			var uploadedFilesCount = document.querySelectorAll("#" + objName + "Preview > li").length;
			var tagIds = document.querySelectorAll("#" + objName + "Preview > li");

			for(var i=0; i<tagIds.length; i++){
				var tagId = tagIds[i].getAttribute("id").split("_");
				numbering.push(tagId[2]);
			}
			
			if(uploadedFilesCount > 0){
				numbering.sort();
				maxNumber = parseInt(numbering[numbering.length-1]) + parseInt(1);
			}
		} else {
			// by pass
		}
		
		$("#" + objName + "MaxNumber").val(maxNumber);

		var totalFileSize = 0;
		var filesCount = files.length;
		var filesArray = [];
		
		allowedMaxTotalFileNumber = allowedMaxTotalFileNumber == 0 ? MAX_TOTAL_FILE_NUMBER : allowedMaxTotalFileNumber;
		allowedEachFileSize = allowedEachFileSize == 0 ? MAX_EACH_FILE_SIZE : allowedEachFileSize;
		allowedTotalFileSize = allowedTotalFileSize == 0 ? MAX_TOTAL_FILE_SIZE : allowedTotalFileSize;
		
		if(checkUploadedTotalFileNumber(files, allowedMaxTotalFileNumber, filesCount, uploadedFilesCount) == false) { return false; }
		
		for (var i=0; i<filesCount; i++) {
			if(checkUploadedExt(files[i].name, seq, allowedExtdiv) == false) { return false; }
			if(checkUploadedEachFileSize(files[i], seq, allowedEachFileSize) == false) { return false; }

			totalFileSize += files[i].size;
			
			filesArray.push(files[i]);
		}

		if(checkUploadedTotalFileSize(seq, totalFileSize, allowedTotalFileSize) == false) { return false; }
		
		if (uiType == 1) {
			for (var i=0; i<filesArray.length; i++) {
				var file = filesArray[i];

				var picReader = new FileReader();
			    picReader.addEventListener("load", addEventListenerCustom (objName, seq, i, file, filePreview, maxNumber));
			    picReader.readAsDataURL(file);
			}			
		} else if(uiType == 2) {
			for (var i = 0 ; i < filesCount ; i++) {
				addUploadLi(objName, seq, i, $("#" + objName +"")[0].files[i].name, filePreview, maxNumber);
			}
		} else if (uiType == 3) {
			var fileReader = new FileReader();
			 fileReader.onload = function () {
				 $("#uploadImgProfilePreview").attr("src", fileReader.result);		/* #-> */
			 }	
			 fileReader.readAsDataURL($("#" + objName +"")[0].files[0]);
		} else {
			return false;
		}
		return false;
	}
	
	
	addEventListenerCustom = function (objName, type, i, file, filePreview, maxNumber) { 
		return function(event) {
			var imageFile = event.target;
			var sort = parseInt(maxNumber) + i;

			var divImage = "";
			divImage += '<div id="imgDiv_'+type+'_'+ sort +'" style="display: inline-block; height: 95px;">';
			divImage += '	<img src="'+ imageFile.result +'" class="rounded" width= "85px" height="85px">';
			divImage += '	<div style="position: relative; top:-85px; left:5px"><span style="color: red; cursor:pointer;" onClick="delImgDiv(0,' + type +','+ sort +')">X</span></div>';
			divImage += '</div> ';
			
			filePreview.append(divImage);
	    };
	}
	
	
	delImgDiv = function(objName, type, sort, deleteSeq, pathFile) {
		
		$("#imgDiv_"+type+"_"+sort).remove();
		
		var objDeleteSeq = $('input[name='+ objName +'DeleteSeq]');
		var objDeletePathFile = $('input[name='+ objName +'DeletePathFile]');

		if(objDeleteSeq.val() == "") {
			objDeleteSeq.val(deleteSeq);
		} else {
			objDeleteSeq.val(objDeleteSeq.val() + "," + deleteSeq);
		}
		
		if(objDeletePathFile.val() == "") {
			objDeletePathFile.val(pathFile);
		} else {
			objDeletePathFile.val(objDeletePathFile.val() + "," + pathFile);
		}
	}
	
	
	addUploadLi = function (objName, type, i, name, filePreview, maxNumber){

		var sort = parseInt(maxNumber) + i;
		
		var li ="";
		li += '<input type="hidden" id="'+ objName +'Process_'+type+'_'+ sort +'" name="'+ objName +'Process" value="1">';
		li += '<input type="hidden" id="'+ objName +'Sort_'+type+'_'+ sort +'" name="'+ objName +'Sort" value="'+ sort +'">';
		li += '<li id="li_'+type+'_'+sort+'" class="list-group-item d-flex justify-content-between align-items-center">';
		li += name;
		li +='<span class="badge bg-danger rounded-pill" onClick="delLi(0,'+ type +','+ sort +')"><i class="fa-solid fa-x" style="cursor: pointer;"></i></span>';
		li +='</li>';
		
		filePreview.append(li);
	}
	
	
	delLi = function(objName, type, sort, deleteSeq, pathFile) {
		
		$("#li_"+type+"_"+sort).remove();

		var objDeleteSeq = $('input[name='+ objName +'DeleteSeq]');
		var objDeletePathFile = $('input[name='+ objName +'DeletePathFile]');

		if(objDeleteSeq.val() == "") {
			objDeleteSeq.val(deleteSeq);
		} else {
			objDeleteSeq.val(objDeleteSeq.val() + "," + deleteSeq);
		}
		
		if(objDeletePathFile.val() == "") {
			objDeletePathFile.val(pathFile);
		} else {
			objDeletePathFile.val(objDeletePathFile.val() + "," + pathFile);
		}
	}
	
	openViewer = function (type, sort) {
		var str = '<c:set var="tmp" value="'+ type +'"/>';
		$("#modalImgViewer").append(str);
		$("#modalImgViewer").modal("show");
	}
</script>


