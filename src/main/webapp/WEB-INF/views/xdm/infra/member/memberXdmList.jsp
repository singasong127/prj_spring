<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ include file="../../include/includeElement.jsp" %>
<%@ include file="../../include/includeLink.jsp" %>

<title>회원 리스트</title>

<div class="content-body">
	<div class="container-fluid">
		<div class="row page-titles mx-0">
			<div class="col-sm-6 p-md-0">
				<div class="welcome-text">
					<h4>회원 관리</h4>
				</div>
			</div>
		</div>
		<!-- row -->
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
                </div>
				<div class="card-body">
					<div class="table-responsive">
						<form name="formMem">
							<div class="form-row w-75">
								<div class="form-group col-md-3">
									<input type="text" class="form-control" id="shKey"
										name="shKey" value="<c:out value="${vo.shKey }"/>" placeholder="">
								</div>
								<div class="form-group col-md-3">
									<input type="text" class="form-control" id="emain"
										name="emain" value="<c:out value="${vo.emain }"/>" placeholder="도메인">
								</div>
								<div class="form-group col-md-3">
									<input type="text" class="form-control" id=""
										name="" placeholder="">
								</div>
								<div class="form-group col-md-3">
									<select name="shGen" class="form-control">
										<option value="" selected>--성별--</option>
										<option value="4">남성</option>
										<option value="5">여성</option>
										<option value="6">기타</option>
									</select>
								</div>
								<div class="form-group col-md-3">
									<button type="button" class="btn btn-primary" id="btn">검색</button>
									<button type="button" class="btn btn-primary" id="btnInit">Init</button>
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
									<th>아이디</th>
									<th>비밀번호</th>
									<th>닉네임</th>
									<th>이메일 계정</th>
									<th>이메일 도메인</th>
									<th>성별</th>
									<th>나이</th>
									<th>개인정보 동의 날짜</th>
									<th>삭제 여부</th>
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
													<a href="/member?seq=<c:out value="${list.seq}"></c:out>">
														<c:out value="${list.seq}"></c:out>
													</a>
												</td>
												<td>
													<a href="/member?id=<c:out value="${list.seq}"></c:out>">
														<c:out value="${list.id}"></c:out>
													</a>
												</td>
												<td>
													<a href="/member?pw=<c:out value="${list.seq}"></c:out>">
														<c:out value="${list.password}"></c:out>
													</a>
												</td>
												<td>
													<a href="/member?nick=<c:out value="${list.seq}"></c:out>">
														<c:out value="${list.nickname}"></c:out>
													</a>
												</td>
												<td>
													<a href="/member?emailAcc=<c:out value="${list.seq}"></c:out>">
														<c:out value="${list.emailAccount}"></c:out>
													</a>
												</td>
												<td>
													<a href="/member?emailDom=<c:out value="${list.seq}"></c:out>">
														<c:out value="${list.emailDomain}"></c:out>
													</a>
												</td>
												<td>
													<a href="/member?gender=<c:out value="${list.seq}"></c:out>">
														<c:out value="${list.gender}"></c:out>
													</a>
												</td>
												<td>
													<a href="/member?age=<c:out value="${list.seq}"></c:out>">
														<c:out value="${list.age}"></c:out>
													</a>
												</td>
												<td>
													<a href="/member?agreeDT=<c:out value="${list.seq}"></c:out>">
														<c:out value="${list.agreeDT}"></c:out>
													</a>
												</td>
												<td>
													<a href="/member?del=<c:out value="${list.seq}"></c:out>">
														<c:out value="${list.delNy}"></c:out>
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
	
	$("#btn").on("click", function() {
		
		$("form[name='formMem']").attr("action", "/member");
		
	});
	
</script>


