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
                                    <form name="formProfile" method="post" enctype="multipart/form-data">
                                    	<div class="col-sm-12 text-center">
								      		<c:set var="type" value="1"/>		<!-- #-> -->
								        	<c:set var="name" value="uploadImgProfile"/>		<!-- #-> -->
											<c:choose>
												<c:when test="${ulSeq eq 0 }">
													<img id="<c:out value="${name }"/>Preview" src="/resources/xdmin/image/default_100_100.png" class="rounded-circle mx-auto d-block" width="100" height="100">
												</c:when>
												<c:otherwise>
													<c:choose>
														<c:when test="${fn:length(listUploaded) eq 0 }">
															<img id="<c:out value="${name }"/>Preview" src="/resources/xdmin/image/default_100_100.png" class="rounded-circle mx-auto d-block" width="100" height="100">
														</c:when>
														<c:otherwise>
														<c:set var="GetNy" value="0"/>
														<c:forEach items="${listUploaded}" var="listUploaded" varStatus="statusUploaded">
															<c:if test="${listUploaded.type eq type }">
													        	<input type="hidden" id="<c:out value="${name }"/>DeleteSeq" name="<c:out value="${name }"/>DeleteSeq" value="<c:out value="${listUploaded.ulSeq }"/>"/>
													        	<input type="hidden" id="<c:out value="${name }"/>DeletePathFile" name="<c:out value="${name }"/>DeletePathFile" value="<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>"/>  
																<img id="<c:out value="${name }"/>Preview" src="<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>" class="rounded-circle mx-auto d-block" width="100" height="100">
																<c:set var="GetNy" value="1"/>		
															</c:if>
														</c:forEach>
														<c:if test="${GetNy eq 0 }">
															<img id="<c:out value="${name }"/>Preview" src="/resources/xdmin/image/default_100_100.png" class="rounded-circle mx-auto d-block" width="100" height="100">
														</c:if>
														</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>
									            
												<input type="hidden" id="<c:out value="${name }"/>Type" name="<c:out value="${name }"/>Type" value="<c:out value="${type }"/>"/>
												<input type="hidden" id="<c:out value="${name }"/>MaxNumber" name="<c:out value="${name }"/>MaxNumber" value="0"/>
												<label for="<c:out value="${name }"/>" class="form-label input-file-button"><b>+</b></label>
									 			<input class="form-control form-control-sm" id="<c:out value="${name }"/>" name="<c:out value="${name }"/>" type="file" multiple="multiple" style="display: none;" onChange="upload('<c:out value="${name }"/>', <c:out value="${type }"/>, 1, 1, 0, 0, 3);">
									        </div>
                                        <div class="form-group">
                                            <label><strong>아이디</strong></label>
                                            <input type="text" class="form-control" name="id" value="${mem.id }"
                                             style="background-color: #ccc" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label><strong>비밀번호</strong></label>
                                            <div class="d-flex">
	                                            <input type="password" class="form-control" value="${mem.password }" readonly>
	                                            <button type="button" class="btn btn-sm btn-primary" id="btnChPwd">변경</button>
                                            </div>
                                            <div id="newPwdWrap" style="display: none">
                                            	<div class="mb-2">
	                                            	<label><strong>새 비밀번호</strong></label>
		                                            <input type="password" oninput="checkPwd()" class="form-control" 
		                                            	name="password" value="<c:out value='${vo.password }' />" id="newPwd">
		                                            <span class="id_ok" style="display: none">사용 가능한 비밀번호입니다.</span>
                                            	</div>
	                                            <div>
		                                            <label><strong>새 비밀번호 확인</strong></label>
		                                            <input type="password" oninput="checkPwd()" class="form-control" value="" id="newPwdConfirm">
		                                            <span class="id_already" style="display: none">비밀번호가 일치하지 않습니다.</span>
	                                            </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label><strong>닉네임</strong></label>
                                            <input type="text" class="form-control" value="<c:out value="${mem.nickname }" />"
                                            	name="nickname" id="nickname" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label><strong>이메일</strong></label>
                                        	<span><c:out value="${mem.emailAccount }" />@<c:out value="${mem.emailDomain }" /></span>
                                        </div>
                                        <div class="d-grid d-flex justify-content-center">
                                            <button type="button" class="btn btn-primary mx-2" id="btnUpdt">저장</button>
                                            <button type="button" class="btn btn-secondary mx-2" onclick="/user">취소</button>
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
    
    <script type="text/javascript" src="/resources/js/commonXdm.js"></script>
    <script type="text/javascript" src="/resources/js/ConstantsXdm.js"></script>
    
    <script type="text/javascript">

		var pwd = $("#newPwd").val();
		var confirmPwd = $("#newPwdConfirm").val();
	    
		$("#btnChPwd").on("click", function() {
			$("#newPwdWrap").show();
		});
		
		function checkPwd() {
			
			if(pwd == null || pwd == "") {
				$(".id_ok").hide();
			} else {
				if(pwd == confirmPwd) {
					$(".id_ok").show();
					$(".id_already").hide();
				} else {
					$(".id_ok").hide();
					$(".id_already").show();
				}
			}
		}
	    
		$("#btnUpdt").on("click", function() {
			if(pwd === confirmPwd) {
				$("form[name=formProfile]").attr("action", "/profile/update").submit();
				alert("성공적으로 변경됐습니다!")
			} else {
				alert("새 비밀번호를 확인해주세요.");
				$("#newPwd").focus();
			}
		});
		
		upload = function(objName, seq, allowedMaxTotalFileNumber, allowedExtdiv, allowedEachFileSize, allowedTotalFileSize, uiType) {
			
//			objName 과 seq 는 jsp 내에서 유일 하여야 함.
//			memberProfileImage: 1
//			memberImage: 2
//			memberFile : 3

//			uiType: 1 => 이미지형
//			uiType: 2 => 파일형
//			uiType: 3 => 프로필형

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
    
	</body>
</html>