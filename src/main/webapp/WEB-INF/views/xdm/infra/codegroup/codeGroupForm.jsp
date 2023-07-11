<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ include file="../../include/includeElement.jsp" %>
<%@ include file="../../include/includeLink.jsp" %>

	<title>코드 그룹 리스트</title>

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>시스템 관리</h4>
                        </div>
                    </div>
                </div>
                <!-- row -->

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                	<form name="form" method="post">
	                            		<div class="col-lg-6">
		                            		<div class="row">
		                            			<%-- <input type="text" class="form-control mb-3 mx-3 w-25" name="cgSeq" id="cgSeq" value="<c:out value="${item.cgSeq }"/>" disabled readonly>
												<input type="text" class="form-control mb-3 w-25" name="cgName" id="cgName" value="<c:out value="${item.cgName }"/>"> --%>
		                            			<c:choose>
		                            				<c:when test="${empty item.cgSeq }">
		                            					<input type="text" class="form-control mb-3 mx-3 w-25" name="cgSeq" id="cgSeq" value="<c:out value="${item.cgSeq }"/>" placeholder="자동 생성" readonly style="background-color: #ccc">
														<input type="text" class="form-control mb-3 w-25" name="cgName" id="cgName" value="<c:out value="${item.cgName }"/>">
		                            				</c:when>
		                            				<c:otherwise>
		                            					<input type="text" class="form-control mb-3 mx-3 w-25" name="cgSeq" id="cgSeq" value="<c:out value="${item.cgSeq }"/>" readonly>
														<input type="text" class="form-control mb-3 w-25" name="cgName" id="cgName" value="<c:out value="${item.cgName }"/>">
		                            				</c:otherwise>
		                            			</c:choose>
	                                        </div>
                                        </div>
                                        <div class="col-lg-6 mb-4">
                                        	<!-- <button type="button" class="btn btn-success me-3" id="btnInsert">등록</button>
                                        	<button type="button" class="btn btn-danger me-3" id="btnDelete">삭제</button>
											<button type="button" class="btn btn-danger me-3" id="btnUelete">Uelete</button>
											<button type="button" class="btn btn-primary" id="btnUpdate">저장</button> -->
                                        	<c:choose>
                                        		<c:when test="${empty item.cgSeq }">
                                        			<button type="button" class="btn btn-success me-3" id="btnInsert">등록</button>
                                        		</c:when>
                                        		<c:otherwise>
                                        			<button type="button" class="btn btn-danger me-3" id="btnDelete">삭제</button>
													<button type="button" class="btn btn-danger me-3" id="btnUelete">Uelete</button>
													<button type="button" class="btn btn-primary" id="btnUpdate">저장</button>
                                        		</c:otherwise>
                                        	</c:choose>
	                                    </div>
                            		</form>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->


        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright © Designed &amp; Developed by <a href="#" target="_blank">Quixkit</a> 2019</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->

        <!--**********************************
           Support ticket button start
        ***********************************-->

        <!--**********************************
           Support ticket button end
        ***********************************-->

        
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="/resources/admin/vendor/global/global.min.js"></script>
    <script src="/resources/admin/js/quixnav-init.js"></script>
    <script src="/resources/admin/js/custom.min.js"></script>
    


    <!-- Datatable -->
    <script src="/resources/admin/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/resources/admin/js/plugins-init/datatables.init.js"></script>
    
    <script src="/resources/js/validation.js"></script>
    
 	<script type="text/javascript">
 		
 		var objName = $('#cgName');
 		
 		validationInst = function() {
 			if(validationUpdt() == false) return false;
 		}
 		
 		validationUpdt = function() {
 			
			if(check(objName) == false || !null) return false;
			
 		}

		$("#btnUpdate").on("click", function() {
			
			if(validationUpdt() == false) return false;
			
			$("form[name=form]").attr("action", "/cgupdate").submit();
		
		});
	
		$("#btnUelete").on("click", function() {
		
			$("form[name=form]").attr("action", "/cguelect").submit();
		
		});
	
		$("#btnDelete").on("click", function() {
		
			$("form[name=form]").attr("action", "/cgdelete").submit();
		
		});
	
		$("#btnInsert").on("click", function() {
			
			if(validationInst() == false) return false;
			
			$("form[name=form]").attr("action", "/cginsert").submit();
			
			/* if($.trim($("#cgName").val()) == "" || $.trim($("#cgName").val()) == null) {
				alert("데이터를 입력해주세요!");
				$("#cgName").focus();
			} else {
				$("form[name=form]").attr("action", "/cginsert").submit();
			} */
				
		
		});

	</script>

