<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<jsp:useBean id="CodeServiceImpl" class="com.mycompany.app.infra.code.CodeServiceImpl"/>

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
                           <c:choose>
	                           	<c:when test="${not empty sessionId }">
	                           		<ul class="navbar-nav header-right">
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
		                                    	<a href="/xdmindex" class="dropdown-item" id="btnLogout">
		                                        	<i class="icon-key"></i>
		                                        	<span class="ml-2">Logout </span>
		                                    	</a>
	                                		</div>
	                            		</li>
	                           		</ul>
	                           	</c:when>
	                           	<c:otherwise>
	                           		<button type="button" class="btn btn-primary" id="btnLogin">로그인</button>
	                           	</c:otherwise>
                           </c:choose>
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
						<li><a href="/cglist">코드 그룹 관리</a></li>
						<li><a href="/cdlist">코드 관리</a></li>
						<li><a href="/member">회원 관리</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>
        <!--**********************************
            Sidebar end
        ***********************************-->
        
 
