<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>


<header>
    <div class="headerBox">
        <div class="logo" onclick="location.href='/indexAdminView'" ><img src="/resources/team/img/logo.png" alt=""></div>
        <div class="nav">
            <div class="curtain"></div>
            <ul class="navList">
                <div class="navListBox">
                    <a class="itemBox" href="#">
                        <li>
                            파티
                        </li>
                    </a>
                        <ul class="subNavList">
                            <a href="#"><li>
                                참가 신청한 파티
                            </li></a>
                            <a href="#"><li>
                                참가 중인 파티
                            </li></a>
                        </ul>

                </div>
                
            </ul>
        </div>
                    <div onclick="location.href='/loginAdmin'" class="outBtn">
                        <span class="material-symbols-outlined">login</span>
                    </div>
    </div>
</header>