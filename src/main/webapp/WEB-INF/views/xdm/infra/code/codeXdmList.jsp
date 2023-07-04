<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<title>코드 리스트</title>

<%@ include file="../../include/includeElement.jsp" %>
<%@ include file="../../include/includeLink.jsp" %>


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
								<form name="formList">
									<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
									<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}"/>">
									<div class="form-row w-75">
										<div class="form-group col-md-3">
											<select name="shOptionCd" class="form-control">
												<option value="" selected>--선택하세요--</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
											</select>
										</div>
										<div class="form-group col-md-3">
											<input type="text" class="form-control" id="shKeyCd"
												name="shKeyCd" value="<c:out value="${vo.shKeyCd }" />" placeholder="코드명">
										</div>
										<div class="form-group col-md-3">
											<input type="text" class="form-control" id="cgName"
												name="cgName" value="<c:out value="${vo.cgName }" />" placeholder="코드 그룹">
										</div>
										<div class="form-group col-md-3">
											<input type="text" class="form-control" id=""
												name="" placeholder="">
										</div>
										<div class="form-group col-md-3">
											<button type="button" class="btn btn-primary" id="btn">검색</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table primary-table-bordered display"
									style="min-width: 845px">
									<thead class="mb-2 thead-primary">
										<tr>
											<th>#</th>
											<th>CODE NAME</th>
											<th>CODE GROUP</th>
										</tr>
									</thead>
									<tbody class="mb-3">
										<c:choose>
											<c:when test="${fn:length(list) eq 0}">
												<tr>
													<td class="text-center" colspan="9">There is no data!</td>
												</tr>
											</c:when>
											<c:otherwise>
												<%-- ${list} 자바에서 넘겨준 객체 이름 --%>
												<!-- var="list" jstl 블럭에서 사용할 변수 이름 -->
												<c:forEach items="${list}" var="list" varStatus="status">
													<tr>
														<td>
															<a href="/cdform?cdSeq=<c:out value="${list.cdSeq}"></c:out>">
																<c:out value="${list.cdSeq}"></c:out>
															</a>
														</td>
														<td>
															<a href="/cdform?cdSeq=<c:out value="${list.cdSeq}"></c:out>">
																<c:out value="${list.cdName}"></c:out>
															</a>
														</td>
														<td>
															<a href="/cdform?cdSeq=<c:out value="${list.cgName}"></c:out>">
																<c:out value="${list.cgName}"></c:out>
															</a>
														</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
									<tfoot>
										
									</tfoot>
								</table>
								<div class="container-fluid px-0 mt-2">
								    <div class="row mx-auto">
								        <div class="col">
								            <!-- <ul class="pagination pagination-sm justify-content-center mb-0"> -->
								            <ul class="pagination justify-content-center mb-0">
								                <!-- <li class="page-item"><a class="page-link" href="#"><i class="fa-solid fa-angles-left"></i></a></li> -->
												<c:if test="${vo.startPage gt vo.pageNumToShow}">
								                	<li class="page-item"><a class="page-link" href="javascript:goList(${vo.startPage - 1})"><i class="fa-solid fa-angle-left"></i></a></li>
												</c:if>
												<c:forEach begin="${vo.startPage}" end="${vo.endPage}" varStatus="i">
													<c:choose>
														<c:when test="${i.index eq vo.thisPage}">
								                			<li class="page-item active"><a class="page-link" href="javascript:goList(${i.index})">${i.index}</a></li>
														</c:when>
														<c:otherwise>             
												                <li class="page-item"><a class="page-link" href="javascript:goList(${i.index})">${i.index}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>                
												<c:if test="${vo.endPage ne vo.totalPages}">                
									                <li class="page-item"><a class="page-link" href="javascript:goList(${vo.endPage + 1})"><i class="fa-solid fa-angle-right"></i></a></li>
												</c:if>
								                <!-- <li class="page-item"><a class="page-link" href="#"><i class="fa-solid fa-angles-right"></i></a></li> -->
								            </ul>
								        </div>
								    </div>
								</div>
								<div class="row mx-auto d-flex justify-content-end">
									<button type="button" class="btn btn-primary" id="btnInsert">추가</button>
								</div>
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
			<p>
				Copyright © Designed &amp; Developed by <a href="#" target="_blank">Quixkit</a>
				2019
			</p>
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

<%@ include file="../../include/includeScript.jsp" %>

<script type="text/javascript">
	
	$("#btn").on("click", function(){
	
	// 	$("form[name=formList]").attr("method","get");
		$("form[name=formList]").attr("action", "/cdlist").submit();
	
	});
	
	$("#btnInsert").on("click", function() {
		
		location.href = "/cdform";
				
	});
	
	goList = function(thisPage) {
		$("input:hidden[name=thisPage]").val(thisPage);
		$("form[name=formList]").attr("action", "cdlist").submit();
	}
	
</script>


