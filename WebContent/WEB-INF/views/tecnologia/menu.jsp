<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:url value="/app/tecnologia/deletar" var="urlDeletar" />
<c:url value="/app/tecnologia/novo" var="urlEditar" />
<c:url value="/app/projeto" var="urlListar" />

<c:url value="../assets/vendor" var="vendor" />
<c:url value="../assets/js" var="js" />
<c:url value="/assets/imagens" var="img" />

<!DOCTYPE html>
<html>
<head>
<c:import url="../templates/head.jsp" />
<title>Tecnologias</title>
</head>

<c:import url="../templates/header.jsp" />

<!-- MAIN CONTENT-->
<div class="main-content">
	<div class="section__content section__content--p30">
		<div class="container-fluid">
			<c:if test="${not empty sucesso}">
				<div id="a" class="alert alert-primary" role="alert" style="text-align: center;width: 50%;margin-left: 24%;">
            		Tecnologia cadastrada/editada com sucesso!                            
            	</div>
            </c:if>
            <c:if test="${not empty erro}">
				<div id="a" class="alert alert-warning" role="alert" style="text-align: center;width: 50%;margin-left: 24%;">
            		Erro ao deletar tecnologia: Possuí um ou mais projetos.                            
            	</div>
            </c:if>	
            <c:if test="${not empty sucessoUsr}">
				<div id="a" class="alert alert-success" role="alert" style="text-align: center;width: 50%;margin-left: 24%;">
            		Usuario cadastrado com sucesso!                            
            	</div>
            </c:if>					
			<div class="row "
				style="max-width: 800px; display: block; margin: auto;">
				<div class="col-lg-12">
					<div class="table-responsive table--no-card m-b-30">
						<table id="lista" class="table table-borderless table-striped table-earning">
							<thead>
								<tr>
									<th>
									<button type="button" name="quantidade" class="btn btn-primary pro" style="background-color:#dee2e6; color: black;">
                                    	Tecnologias <span class="badge badge-light"></span>
                                     </button>
                                     </th>
									<th></th>
									<th></th>
									<th class="text-right"></th>
									<th class="text-right"></th>
									<th class="text-right"><button type="button" name="quantidade" class="btn btn-primary pro" style="background-color:#dee2e6; color: black;">
                                    <span class="badge badge-light">${fn:length(tecnologias)}</span>
                                    </button></th>									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${tecnologias}" var="tecnologia">
									<tr>
										<spring:htmlEscape defaultHtmlEscape="true">
											<td>${tecnologia.nome}</td>
										</spring:htmlEscape>
										<td><a href="${urlListar}?idTec=${tecnologia.id}">Ver
												projetos</a></td>
										<td></td>
										<td class="text-right"></td>
										<td class="text-right"></td>
										<td>
											<div class="table-data-feature">
												<a href="${urlEditar}?id=${tecnologia.id}">
													<button class="item" data-toggle="tooltip"
														data-placement="top" title="Editar">
														<i class="zmdi zmdi-edit"></i>
													</button>
												</a> 
													<button class="item" title="Excluir" data-toggle="modal" 
                                                            data-target="#${tecnologia.id}">
														<i class="zmdi zmdi-delete"></i>
													</button>											
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- END USER DATA-->
			</div>

			<div class="col-md-12">
				<div class="copyright">
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

 	<script>// depois de um tempo (4 segundos), ele vai buscar o item pelo id, no caso 'a', que é da div, e irá 'esconder' - hide()
    $(document).ready(function () {     
    setTimeout(function () { $('#a').hide() }, 4000);
                        });
    </script>

<c:forEach items="${tecnologias}" var="tecnologia">
<div class="modal" id="${tecnologia.id}">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title"></h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    Você tem certeza que quer excluir a tecnologia?
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <a href="${urlDeletar}?id=${tecnologia.id}">
                    <button type="button" class="btn btn-danger">Sim</button>
                    </a>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Não</button>
                </div>
            </div>
        </div>
    </div>
</c:forEach>

</body>
</html>