<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="../assets/vendor" var="vendor" />
<c:url value="../assets/js" var="js" />
<c:url value="../assets/imagens" var="img" />

<body class="animsition">
    <div class="page-wrapper">
        <!-- HEADER MOBILE-->
        <header class="header-mobile d-block d-lg-none">
            <div class="header-mobile__bar">
                <div class="container-fluid">
                    <div class="header-mobile-inner">
                        <button class="hamburger hamburger--slider" type="button">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                        </button>
                    </div>
                </div>
            </div>
            <nav class="navbar-mobile">
                <div class="container-fluid">
                    <ul class="navbar-mobile__list list-unstyled">
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                Projetos</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list">
                                <li>
                                    <a href="/gerenciadepjs/app/projeto">Iniciados</a>
                                </li>
                                <li>
                                    <a href="/gerenciadepjs/app/projeto">Em andamento</a>
                                </li>
                                <li>
                                    <a href="/gerenciadepjs/app/projeto">Finalizados</a>
                                </li>

                            </ul>
                        </li>
                        <li>
                            <a href="/gerenciadepjs/app/tecnologia">
                                Tecnologias</a>
                        </li>
                        <li>
                            <a href="/gerenciadepjs/app/projeto/novo">
                                Cadastro de projetos</a>
                        </li>
                        <li>
                            <a href="/gerenciadepjs/app/tecnologia/novo">
                                Cadastro de Tecnologias</a>
                        </li>
                        <li>
                            <a href="/gerenciadepjs/app/adm/usuario/novo">
                                Cadastro de usuário</a>
                        </li>

                    </ul>
                </div>
            </nav>
        </header>
        <!-- END HEADER MOBILE-->

        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="#">
                    <img src="${img}/logo.png" style="width: 130px; margin-left: 30%; margin-top: 5%;" alt="Cool Admin" />
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li class="active has-sub">
                            <a class="js-arrow" href="#">
                                Projetos</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="/gerenciadepjs/app/projeto">Iniciados</a>
                                </li>
                                <li>
                                    <a href="/gerenciadepjs/app/projeto">Em andamento</a>
                                </li>
                                <li>
                                    <a href="/gerenciadepjs/app/projeto">Finalizados</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="/gerenciadepjs/app/tecnologia">
                                Tecnologias</a>
                        </li>
                        <li>
                            <a href="/gerenciadepjs/app/projeto/novo">
                                Cadastro de Projetos</a>
                        </li>
                        <li>
                            <a href="/gerenciadepjs/app/tecnologia/novo">
                                Cadastro de Tecnologias</a>
                        </li>
                        <li>
                            <a href="/gerenciadepjs/app/adm/usuario/novo">
                                Cadastro de Usuário</a>
                        </li>
					</ul>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">
                            <form class="form-header" action="" method="POST">
                                <input class="au-input au-input--xl" type="text" name="search" placeholder="" />
                                <button class="au-btn--submit" type="submit">
                                    <i class="zmdi zmdi-search"></i>
                                </button>
                            </form>
                            <div class="header-button">
                                <div class="noti-wrap">
                                    <div class="noti__item js-item-menu"></div>
                                    <div class="noti__item js-item-menu"></div>
                                </div>
                                <div class="account-wrap">
                                    <div class="account-item clearfix js-item-menu">
                                        <div class="image">
                                            <img src="${img}/pessoa.jpg" alt="John Doe" />
                                        </div>
                                        <div class="content">
                                            <a class="js-acc-btn" href="#">${usuarioAutenticado.nome}</a>
                                        </div>
                                        <div class="account-dropdown js-dropdown">
                                            <div class="info clearfix">
                                                <div class="image">
                                                    <a href="#">
                                                        <img src="${img}/pessoa.jpg" alt="${usuarioAutenticado.nome} ${usuarioAutenticado.sobrenome}" />
                                                    </a>
                                                </div>
                                                <div class="content">
                                                    <h5 class="name">
                                                        <a href="#">${usuarioAutenticado.nome} ${usuarioAutenticado.sobrenome}</a>
                                                    </h5>
                                                    <span class="email">${usuarioAutenticado.email}</span>
                                                </div>
                                            </div>

                                            <div class="account-dropdown__footer">
                                                <a href="login2.html">
                                                    <i class="zmdi zmdi-power"></i>Sair</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- HEADER DESKTOP-->