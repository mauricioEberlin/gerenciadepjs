<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="../../assets/vendor" var="vendor" />
<c:url value="../../assets/js" var="js" />
<c:url value="../../assets/imagens" var="img" />

<c:url value="/app/tecnologia/salvar" var="urlSalvar" />

<head>
    <!-- Title Page-->
    <title>Cadastro de Tecnologias</title>
    <c:import url="../templates/head2.jsp"/>

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
                                        <h2 class="title-1" style="font-size: 20px; color: #fff;">Cadastro de
                                            Tecnologias</h2>
                                    </div>
                                    <div class="card-body card-block">
                                        <form:form modelAttribute="tecnologia" action="${urlSalvar}" method="post" class="form-horizontal">

                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class="form-control-label">Nome</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <form:input path="nome" type="text" id="text-input" name="text-input" placeholder="Nome"
                                                        class="form-control"/>

                                                </div>
                                            </div>

                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="textarea-input" class=" form-control-label">Descrição</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <form:textarea path="descricao" name="textarea-input" id="textarea-input" rows="9"
                                                        placeholder="Descrição..." class="form-control"/>
                                                </div>
                                            </div>
                                       
                                    </div>
                                    <div class="card-footer">
                                        <button type="submit" class="btn btn-secundary btn-tecnologias btn-sm">
                                            <i class="fa fa-dot-circle-o"></i> Salvar
                                        </button>
                                        <button type="reset" class="btn btn-danger btn-sm">
                                            <i class="fa fa-ban"></i> Limpar
                                        </button>
                                        
                                    </div>  
                                    </form:form>                                 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="${vendor}/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="${vendor}/bootstrap-4.1/popper.min.js"></script>
    <script src="${vendor}/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="${vendor}/slick/slick.min.js">

    </script>
    <script src="${vendor}/wow/wow.min.js"></script>
    <script src="${vendor}/animsition/animsition.min.js"></script>
    <script src="${vendor}/bootstrap-progressbar/bootstrap-progressbar.min.js">
    
    </script>
    <script src="${vendor}/counter-up/jquery.waypoints.min.js"></script>
    <script src="${vendor}/counter-up/jquery.counterup.min.js">

    </script>
    <script src="${vendor}/circle-progress/circle-progress.min.js"></script>
    <script src="${vendor}/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="${vendor}/chartjs/Chart.bundle.min.js"></script>
    <script src="${vendor}/select2/select2.min.js">

    </script>

    <!-- Main JS-->
    <script src="${js}/main.js"></script>

</body>

</html>
<!-- end document-->