<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>


	<title>관리자 리스트</title>
    <!-- Datatable -->
    <link href="/resources/admin/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
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
            <a href="index.html" class="brand-logo">
                <img class="logo-abbr" src="/resources/admin/images/logo.png" alt="">
                <img class="logo-compact" src="/resources/admin/images/logo-text.png" alt="">
                <img class="brand-title" src="/resources/admin/images/logo-text.png" alt="">
            </a>

            <div class="nav-control">
                <div class="hamburger">
                    <span class="line"></span><span class="line"></span><span class="line"></span>
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
                                    	<input class="form-control" type="search" placeholder="Search" aria-label="검색">
                                    </form>
                                </div>
                            </div>
                        </div>

                        <ul class="navbar-nav header-right">
                            <li class="nav-item dropdown notification_dropdown">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <i class="mdi mdi-bell"></i>
                                    <div class="pulse-css"></div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <ul class="list-unstyled">
                                        <li class="media dropdown-item">
                                            <span class="success"><i class="ti-user"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>Martin</strong> has added a <strong>customer</strong> Successfully
                                                    </p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="primary"><i class="ti-shopping-cart"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>Jennifer</strong> purchased Light Dashboard 2.0.</p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="danger"><i class="ti-bookmark"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>Robin</strong> marked a <strong>ticket</strong> as unsolved.
                                                    </p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="primary"><i class="ti-heart"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong>David</strong> purchased Light Dashboard 1.0.</p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                        <li class="media dropdown-item">
                                            <span class="success"><i class="ti-image"></i></span>
                                            <div class="media-body">
                                                <a href="#">
                                                    <p><strong> James.</strong> has added a<strong>customer</strong> Successfully
                                                    </p>
                                                </a>
                                            </div>
                                            <span class="notify-time">3:20 am</span>
                                        </li>
                                    </ul>
                                    <a class="all-notification" href="#">See all notifications <i
                                            class="ti-arrow-right"></i></a>
                                </div>
                            </li>
                            <li class="nav-item dropdown header-profile">
                                <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                    <i class="mdi mdi-account"></i>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a href="./app-profile.html" class="dropdown-item">
                                        <i class="icon-user"></i>
                                        <span class="ml-2">Profile </span>
                                    </a>
                                    <a href="./email-inbox.html" class="dropdown-item">
                                        <i class="icon-envelope-open"></i>
                                        <span class="ml-2">Inbox </span>
                                    </a>
                                    <a href="./page-login.html" class="dropdown-item">
                                        <i class="icon-key"></i>
                                        <span class="ml-2">Logout </span>
                                    </a>
                                </div>
                            </li>
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
						class="nav-text">데이터</span>
					</a>
					<ul aria-expanded="false">
						<li><a href="/cglist">데이터 검색</a></li>
						<li><a href="/cgform" aria-expanded="false">데이터 추가</a></li>
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
                            <h4>데이터 추가</h4>
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
		                            			<input type="text" class="form-control mb-3 mx-3 w-25" name="cgSeq" id="cgSeq" value="<c:out value="${item.cgSeq }"/>" disabled readonly>
												<input type="text" class="form-control mb-3 w-25" name="cgName" id="cgName" value="<c:out value="${item.cgName }"/>">
	                                        </div>
                                        </div>
                                        <div class="col-lg-6 mb-4">
	                                        <button type="button" class="btn btn-danger me-3" id="btnDelete">삭제</button>
											<button type="button" class="btn btn-danger me-3" id="btnUelete">Uelete</button>
											<button type="button" class="btn btn-success me-3" id="btnInsert">등록</button>
											<button type="button" class="btn btn-primary" id="btnUpdate">저장</button>
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
    <script src="/resources/admin/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/resources/admin/js/plugins-init/datatables.init.js"></script>
    
 	<script type="text/javascript">

		$("#btnUpdate").on("click", function() {
		
			$("form[name=form]").attr("action", "/cgupdate").submit();
		
		});
	
		$("#btnUelete").on("click", function() {
		
			$("form[name=form]").attr("action", "/cguelect").submit();
		
		});
	
		$("#btnDelete").on("click", function() {
		
			$("form[name=form]").attr("action", "/cgdelete").submit();
		
		});
	
		$("#btnInsert").on("click", function() {
		
			$("form[name=form]").attr("action", "/cginsert").submit();
		
		});

	</script>

