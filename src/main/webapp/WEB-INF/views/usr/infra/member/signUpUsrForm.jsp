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
								<!-- profile -->
								<div class="col-sm-12 text-center">

									<c:set var="type" value="1" />
									<!-- #-> -->
									<c:set var="name" value="uploadImgProfile" />
									<!-- #-> -->
									<c:choose>
										<c:when test="${seq eq 0 }">
											<img id="<c:out value="${name }"/>Preview" src=""
												class="rounded-circle mx-auto d-block" width="100"
												height="100">
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${fn:length(listUploaded) eq 0 }">
													<img id="<c:out value="${name }"/>Preview"
														src="/resources/xdmin/image/default_100_100.png"
														class="rounded-circle mx-auto d-block" width="100"
														height="100">
												</c:when>
												<c:otherwise>
													<c:set var="GetNy" value="0" />
													<c:forEach items="${listUploaded}" var="listUploaded"
														varStatus="statusUploaded">
														<c:if test="${listUploaded.type eq type }">
															<input type="hidden"
																id="<c:out value="${name }"/>DeleteSeq"
																name="<c:out value="${name }"/>DeleteSeq"
																value="<c:out value="${listUploaded.seq }"/>" />
															<input type="hidden"
																id="<c:out value="${name }"/>DeletePathFile"
																name="<c:out value="${name }"/>DeletePathFile"
																value="<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>" />
															<img id="<c:out value="${name }"/>Preview"
																src="<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>"
																class="rounded-circle mx-auto d-block" width="100"
																height="100">
															<c:set var="GetNy" value="1" />
														</c:if>
													</c:forEach>
													<c:if test="${GetNy eq 0 }">
														<img id="<c:out value="${name }"/>Preview"
															src="/resources/xdmin/image/default_100_100.png"
															class="rounded-circle mx-auto d-block" width="100"
															height="100">
													</c:if>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>

									<input type="hidden" id="<c:out value="${name }"/>Type"
										name="<c:out value="${name }"/>Type"
										value="<c:out value="${type }"/>" /> <input type="hidden"
										id="<c:out value="${name }"/>MaxNumber"
										name="<c:out value="${name }"/>MaxNumber" value="0" /> <label
										for="<c:out value="${name }"/>"
										class="form-label input-file-button"><b>+</b></label> <input
										class="form-control form-control-sm"
										id="<c:out value="${name }"/>"
										name="<c:out value="${name }"/>" type="file"
										multiple="multiple" style="display: none;"
										onChange="upload('<c:out value="${name }"/>', 
										<c:out value="${type }"/>, 1, 1, 0, 0, 3);">
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
								<!-- 이미지 첨부 -->
								<div class="col-sm-6 mt-3 mt-sm-0">
									<c:set var="type" value="2" />
									<!-- #-> -->
									<c:set var="name" value="uploadImg" />
									<!-- #-> -->
									<input type="hidden" id="<c:out value="${name }"/>Type"
										name="<c:out value="${name }"/>Type"
										value="<c:out value="${type }"/>" /> <input type="hidden"
										id="<c:out value="${name }"/>MaxNumber"
										name="<c:out value="${name }"/>MaxNumber" value="0" /> <input
										type="hidden" id="<c:out value="${name }"/>DeleteSeq"
										name="<c:out value="${name }"/>DeleteSeq" /> <input
										type="hidden" id="<c:out value="${name }"/>DeletePathFile"
										name="<c:out value="${name }"/>DeletePathFile" /> <label
										for="uploadImg" class="form-label input-file-button">이미지첨부</label>
									<input class="form-control form-control-sm"
										id="<c:out value="${name }"/>"
										name="<c:out value="${name }"/>" type="file"
										multiple="multiple" style="display: none;"
										onChange="upload('<c:out value="${name }"/>', <c:out value="${type }"/>, 0, 1, 0, 0, 1);">
									<div id="<c:out value="${name }"/>Preview" class="addScroll">
										<c:forEach items="${listUploaded}" var="listUploaded"
											varStatus="statusUploaded">
											<c:if test="${listUploaded.type eq type }">
												<div
													id="imgDiv_<c:out value="${type }"/>_<c:out value="${listUploaded.sort }"/>"
													style="display: inline-block; height: 95px;">
													<img
														src="<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>"
														class="rounded" width="85px" height="85px"
														style="cursor: pointer;"
														onClick="openViewer(<c:out value="${listUploaded.type }"/>, <c:out value="${listUploaded. sort }"/>);">
													<div style="position: relative; top: -85px; left: 5px">
														<span style="color: red; cursor: pointer;"
															onClick="delImgDiv('<c:out value="${name }"/>', <c:out value="${type }"/>,<c:out value="${listUploaded.sort }"/>, <c:out value="${listUploaded.seq }"/>, '<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>')">X</span>
													</div>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
								<!-- 파일 첨부 -->
								<div class="col-sm-6 mt-3 mt-sm-0">
									<c:set var="type" value="3" />
									<!-- #-> -->
									<c:set var="name" value="uploadFile" />
									<!-- #-> -->
									<input type="hidden" id="<c:out value="${name }"/>Type"
										name="<c:out value="${name }"/>Type"
										value="<c:out value="${type }"/>" /> <input type="hidden"
										id="<c:out value="${name }"/>MaxNumber"
										name="<c:out value="${name }"/>MaxNumber" value="0" /> <input
										type="hidden" id="<c:out value="${name }"/>DeleteSeq"
										name="<c:out value="${name }"/>DeleteSeq" /> <input
										type="hidden" id="<c:out value="${name }"/>DeletePathFile"
										name="<c:out value="${name }"/>DeletePathFile" /> <label
										for="uploadFile" class="form-label input-file-button">파일첨부</label>
									<input class="form-control form-control-sm"
										id="<c:out value="${name }"/>"
										name="<c:out value="${name }"/>" type="file"
										multiple="multiple" style="display: none;"
										onChange="upload('<c:out value="${name }"/>', <c:out value="${type }"/>, 0, 2, 0, 0, 2);">
									<div class="addScroll">
										<ul id="<c:out value="${name }"/>Preview" class="list-group">
											<c:forEach items="${listUploaded}" var="listUploaded"
												varStatus="statusUploaded">
												<c:if test="${listUploaded.type eq type }">
													<li
														id="li_<c:out value="${type }"/>_<c:out value="${listUploaded.sort }"/>"
														class="list-group-item d-flex justify-content-between align-items-center">
														<a
														href="<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>"
														download="<c:out value="${listUploaded.originalName }"/>"
														class="text-decoration-none"><c:out
																value="${listUploaded.originalName }" /></a> <span
														class="badge bg-danger rounded-pill"
														onClick="delLi('<c:out value="${name }"/>', <c:out value="${type }"/>,<c:out value="${listUploaded.sort }"/>, <c:out value="${listUploaded.seq }"/>, '<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>')"><i
															class="fa-solid fa-x" style="cursor: pointer;"></i></span>
													</li>
												</c:if>
											</c:forEach>
										</ul>
									</div>
								</div>
								<div class="form-group row w-50">
									<label class="css-control css-control-primary css-checkbox"
										for="agreeCheck"> <input type="checkbox"
										class="css-control-input mr-2" id="agreeCheck"
										name="agreeCheck" value="1"> <span
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
<script
	src="/resources/admin/vendor/jquery-validation/jquery.validate.min.js"></script>
<!-- Form validate init -->
<script src="/resources/admin/js/plugins-init/jquery.validate-init.js"></script>
<script src="/resources/js/validation.js"></script>

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


