<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/app/usuario/salvar" var="urlSalvar" />

<c:url value="../../assets/vendor" var="vendor" />
<c:url value="../../assets/js" var="js" />
<c:url value="/assets/imagens" var="img" />

<!DOCTYPE html>
<html>
<head>
<c:import url="../templates/head2.jsp"/>
<title>Cadastro de Usuário</title>
</head>
<c:import url="../templates/header2.jsp"/>
            
             <!-- MAIN CONTENT-->
            <div class="main-content">

                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row d-flex justify-content-center">
                            <div class="col-lg-12">
                                <div class="card card-tecnologias">
                                    <div class="card-header card-header-tecnologias">
                                        <h2 class="title-1" style="font-size: 20px; color: #fff;">Cadastro de Usuários</h2>
                                    </div>
                                    
                                    <form:form modelAttribute="usuario" action="${urlSalvar}" method="post" id="formulario">
                                    <div class="card-body card-block">                         
                                  	<form:hidden path="id" />
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label class=" form-control-label">Nome</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <form:input path="nome" type="text" id="text-input" name="text-input" class="form-control"/>
                                                    <small class="form-text text-muted">Por favor insira seu nome</small>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label class=" form-control-label">Sobrenome</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <form:input path="sobrenome" type="text" id="text-input" name="text-input" class="form-control"/>
                                                    <small class="form-text text-muted">Por favor insira seu sobrenome</small>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label class=" form-control-label">Cargo</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <form:input path="cargo" type="text" id="text-input" name="text-input" class="form-control"/>
                                                    <small class="form-text text-muted">Por favor insira seu cargo</small>
                                                </div>
                                            </div>                                            
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="tel-input" class=" form-control-label">Telefone</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <form:input path="telefone" type="tel" id="tel-input" name="tel-input" class="form-control"/>
                                                    <small class="form-text text-muted">Insira o seu telefone</small>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label class=" form-control-label">Senha antiga</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="password" id="password-input" name="senha"
                                                        class="form-control"/>
                                                    <small class="form-text text-muted">Insira sua senha antiga</small>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label class=" form-control-label">Nova senha</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="password" id="password-input" name="senhaNova"
                                                        class="form-control"/>
                                                    <small class="form-text text-muted">Insira a sua nova senha</small>
                                                </div>
                                            </div>                                                                                   
                                    </div>
                                    <div class="card-footer">
                                        <button type="submit" class="btn btn-secundary btn-tecnologias btn-sm">
                                            <i class="fa fa-dot-circle-o"></i> Salvar
                                        </button>
                                         <button type="reset" class="btn btn-danger btn-sm" onclick="limparFormulario()">
                                            <i class="fa fa-ban"></i> ${projeto.id != null ? 'Reset' : 'Limpar'}
                                        </button>
                                    </div>
                                </div>                              
                                </form:form>
                                <div class="copyright">
                                    <p>.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="${vendor}/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="${vendor}/bootstrap-4.1/popper.min.js"></script>
    <script src="${vendor}/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="${vendor}/slick/slick.min.js"></script>
    <script src="${vendor}/wow/wow.min.js"></script>
    <script src="${vendor}/animsition/animsition.min.js"></script>
    <script src="${vendor}/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <script src="${vendor}/counter-up/jquery.waypoints.min.js"></script>
    <script src="${vendor}/counter-up/jquery.counterup.min.js"></script>
    <script src="${vendor}/circle-progress/circle-progress.min.js"></script>
    <script src="${vendor}/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="${vendor}/chartjs/Chart.bundle.min.js"></script>
    <script src="${vendor}/select2/select2.min.js"></script>
    <!-- Main JS-->
    <script src="${js}/main.js"></script>
   </body>
</html>