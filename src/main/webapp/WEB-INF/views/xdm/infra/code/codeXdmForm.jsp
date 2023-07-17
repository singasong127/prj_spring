<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>


	<title>코드 그룹 리스트</title>
    <%@ include file="../../include/includeLink.jsp" %>

	<%@ include file="../../include/includeElement.jsp" %>
    
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
	                            		<div class="form-row w-75">
	                            			<c:choose>
	                            				<c:when test="${empty item.cdSeq }">
	                            					<div class="form-group col-md-3">
	                            						<input type="text" class="form-control" name="cdSeq" id="cdSeq" value="<c:out value="${item.cdSeq}"/>" placeholder="자동 생성" readonly style="background-color: #ccc">
	                            					</div>
	                            					<div class="form-group col-md-3">
	                            						<input type="text" class="form-control" name="cdName" id="cdName" value="<c:out value="${item.cdName}"/>">
	                            					</div>
	                            					<div class="form-group col-md-3">
														<select name="codeGroup_cgSeq" class="form-control">
															<c:forEach items="${group}" var="group" varStatus="status">
																<option value="<c:out value="${group.cgSeq }"/>"><c:out value="${group.cgName}"/></option>
															</c:forEach>
														</select>		                            					
	                            					</div>
	                            				</c:when>
	                            				<c:otherwise>
	                            					<input type="text" class="form-control col-md-3" name="cdSeq" id="cdSeq" value="<c:out value="${item.cdSeq}"/>" readonly>
													<input type="text" class="form-control col-md-3" name="cdName" id="cdName" value="<c:out value="${item.cdName}"/>">
													<input type="text" class="form-control col-md-3" name="codeGroup_cgSeq" id="codeGroup_cgSeq" value="<c:out value="${item.codeGroup_cgSeq}"/>">
	                            				</c:otherwise>
	                            			</c:choose>
                                        </div>
                                        <div class="form-group col-md-3">
                                        	<!-- <button type="button" class="btn btn-success me-3" id="btnInsert">등록</button>
                                        	<button type="button" class="btn btn-danger me-3" id="btnDelete">삭제</button>
											<button type="button" class="btn btn-danger me-3" id="btnUelete">Uelete</button>
											<button type="button" class="btn btn-primary" id="btnUpdate">저장</button> -->
                                        	<c:choose>
                                        		<c:when test="${empty item.cdSeq }">
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
   	
   	<%@ include file="../../include/includeScript.jsp" %>
   	
   	<script src="/resources/js/validation.js"></script>
    
 	<script type="text/javascript">
 	
 		var objName = $("#cdName");
 		
 		validationInst = function() {
 			if(validationUpdt() == false) return false;
 		}
		
 		validationUpdt = function() {
 			if(check(objName) == false) return false;
 		}
 		
		$("#btnUpdate").on("click", function() {
			
			if(validationUpdt() == false) return false;
			$("form[name=form]").attr("action", "/cdupdate").submit();
		
		});
	
		$("#btnUelete").on("click", function() {
		
			$("form[name=form]").attr("action", "/cduelect").submit();
		
		});
	
		$("#btnDelete").on("click", function() {
		
			$("form[name=form]").attr("action", "/cddelete").submit();
		
		});
	
		$("#btnInsert").on("click", function() {
			
			if(validationInst() == false) return false;
			$("form[name=form]").attr("action", "/cdinsert").submit();
			
		});

	</script>

