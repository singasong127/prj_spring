<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>


<title>관리자 리스트</title>
<!-- Datatable -->
<link
	href="/resources/admin/vendor/datatables/css/jquery.dataTables.min.css"
	rel="stylesheet">
<!-- Custom Stylesheet -->
<link href="/resources/admin/css/style.css" rel="stylesheet">


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


<!--**********************************
        Main wrapper start
    ***********************************-->
<div id="main-wrapper">

	<!--**********************************
            Nav header start
        ***********************************-->
	<div class="nav-header">
		<a href="index.html" class="brand-logo"> <img class="logo-abbr"
			src="/resources/admin/images/logo.png" alt=""> <img
			class="logo-compact" src="/resources/admin/images/logo-text.png"
			alt=""> <img class="brand-title"
			src="/resources/admin/images/logo-text.png" alt="">
		</a>

		<div class="nav-control">
			<div class="hamburger">
				<span class="line"></span><span class="line"></span><span
					class="line"></span>
			</div>
		</div>
	</div>
	<!--**********************************
            Nav header end
        ***********************************-->

	<!--**********************************
            Header start
        ***********************************-->
	<div class="header">
		<div class="header-content">
			<nav class="navbar navbar-expand">
				<div class="collapse navbar-collapse justify-content-between">
					<div class="header-left">
						<div class="search_bar dropdown">
							<span class="search_icon p-3 c-pointer" data-toggle="dropdown">
								<i class="mdi mdi-magnify"></i>
							</span>
							<div class="dropdown-menu p-0 m-0">
								<form>
									<input class="form-control" type="search" placeholder="Search"
										aria-label="검색">
								</form>
							</div>
						</div>
					</div>

					<ul class="navbar-nav header-right">
						<li class="nav-item dropdown notification_dropdown"><a
							class="nav-link" href="#" role="button" data-toggle="dropdown">
								<i class="mdi mdi-bell"></i>
								<div class="pulse-css"></div>
						</a>
							<div class="dropdown-menu dropdown-menu-right">
								<ul class="list-unstyled">
									<li class="media dropdown-item"><span class="success"><i
											class="ti-user"></i></span>
										<div class="media-body">
											<a href="#">
												<p>
													<strong>Martin</strong> has added a <strong>customer</strong>
													Successfully
												</p>
											</a>
										</div> <span class="notify-time">3:20 am</span></li>
									<li class="media dropdown-item"><span class="primary"><i
											class="ti-shopping-cart"></i></span>
										<div class="media-body">
											<a href="#">
												<p>
													<strong>Jennifer</strong> purchased Light Dashboard 2.0.
												</p>
											</a>
										</div> <span class="notify-time">3:20 am</span></li>
									<li class="media dropdown-item"><span class="danger"><i
											class="ti-bookmark"></i></span>
										<div class="media-body">
											<a href="#">
												<p>
													<strong>Robin</strong> marked a <strong>ticket</strong> as
													unsolved.
												</p>
											</a>
										</div> <span class="notify-time">3:20 am</span></li>
									<li class="media dropdown-item"><span class="primary"><i
											class="ti-heart"></i></span>
										<div class="media-body">
											<a href="#">
												<p>
													<strong>David</strong> purchased Light Dashboard 1.0.
												</p>
											</a>
										</div> <span class="notify-time">3:20 am</span></li>
									<li class="media dropdown-item"><span class="success"><i
											class="ti-image"></i></span>
										<div class="media-body">
											<a href="#">
												<p>
													<strong> James.</strong> has added a<strong>customer</strong>
													Successfully
												</p>
											</a>
										</div> <span class="notify-time">3:20 am</span></li>
								</ul>
								<a class="all-notification" href="#">See all notifications <i
									class="ti-arrow-right"></i></a>
							</div></li>
						<li class="nav-item dropdown header-profile"><a
							class="nav-link" href="#" role="button" data-toggle="dropdown">
								<i class="mdi mdi-account"></i>
						</a>
							<div class="dropdown-menu dropdown-menu-right">
								<a href="./app-profile.html" class="dropdown-item"> <i
									class="icon-user"></i> <span class="ml-2">Profile </span>
								</a> <a href="./email-inbox.html" class="dropdown-item"> <i
									class="icon-envelope-open"></i> <span class="ml-2">Inbox
								</span>
								</a> <a href="./page-login.html" class="dropdown-item"> <i
									class="icon-key"></i> <span class="ml-2">Logout </span>
								</a>
							</div></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

	<!--**********************************
            Sidebar start
        ***********************************-->
	<div class="quixnav">
		<div class="quixnav-scroll">
			<ul class="metismenu" id="menu">
				<li class="nav-label first">메인</li>
				<li>
					<a href="/xdmindex" aria-expanded="false"><i class="icon icon-single-04"></i>
						<span class="nav-text">대시보드</span>
					</a>
				</li>

				<li class="nav-label">관리</li>
				<li>
					<a class="has-arrow" href="javascript:void()"
					aria-expanded="false"><i class="icon icon-app-store"></i><span
						class="nav-text">시스템</span>
					</a>
					<ul aria-expanded="false">
						<li><a href="/cglist">코드 그룹 리스트</a></li>
						<li>
							<a href="/cgform" aria-expanded="false">코드 그룹 관리</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<!--**********************************
            Sidebar end
        ***********************************-->

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
						<div class="card-header">
							
                        </div>
						<div class="card-body">
							<div class="table-responsive">
								<form name="formList">
									<div class="row w-50">
										<div class="col-lg-6">
											<select name="shOption" class="form-control">
												<option value="" selected>--선택하세요--</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
											</select>
										</div>
										<div class="col-lg-6 mb-2 w-25">
											<input type="text" class="form-control" id="shKey"
												name="shKey" placeholder="">
										</div>
										<div class="col-lg-6 mb-2">
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
											<th>CODEGROUPNAME</th>
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
														<td><a
															href="/cgform?cgSeq=<c:out value="${list.cgSeq}"></c:out>">
																<c:out value="${list.cgSeq}"></c:out>
														</a></td>
														<td><a
															href="/cgform?cgSeq=<c:out value="${list.cgSeq}"></c:out>">
																<c:out value="${list.cgName}"></c:out>
														</a></td>
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


</div>
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
<script
	src="/resources/admin/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="/resources/admin/js/plugins-init/datatables.init.js"></script>


<script type="text/javascript">
	
	$("#btn").on("click", function(){
	
	// 	$("form[name=formList]").attr("method","get");
		$("form[name=formList]").attr("action", "/cglist").submit();
	
	});
	
	$("#btnInsert").on("click", function() {
		
		location.href = "/cgform";
				
	});
	
</script>


