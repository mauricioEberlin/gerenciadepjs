<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:url value="/app/projeto" var="urlListar" />
<c:url value="/app/projeto/novo" var="urlNovoProjeto" />
<c:url value="/app/projeto/editar" var="urlEditar" />
<c:url value="/app/projeto/visualizar" var="urlVisualizar" />

<c:url value="../assets/imagens" var="img" />
<c:url value="/assets/vendor" var="vendor" />
<c:url value="/assets/js" var="js" />

<!DOCTYPE html>
<html>
<head>
<c:import url="../templates/head.jsp" />
<title>Projetos ${tecnologia.nome}</title>
</head>

<c:import url="../templates/header.jsp"/>

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <h2 class="title-1" style="text-align:center;">Projetos</h2>
                <br>
                <br>


                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row" >
                        
							<c:forEach items="${projetos}" begin="1" end="9" var="projeto">
                            <div id="lista" class="col-md-4">
                                <div class="card card-projetos border border-primary">
                                    <div class="card-header">
                                        <strong class="card-title">#${projeto.id} - ${projeto.nome}</strong>
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text">Status: ${projeto.status.nome} <br>${projeto.descricao}</p>
                                        <button type="button" class="btn btn-info" style="margin-top:7%;" data-toggle="modal"
                                            data-target="#${projeto.id}">Ver detalhes</button>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                                                      
                            <div class="col-md-12">
                                <div class="copyright">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-center" style="color: #005fa3;">
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>
                                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>

                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <c:forEach items="${projetos}" var="projeto">
		<div class="modal fade" id="${projeto.id}" tabindex="-1" role="dialog"
			aria-labelledby="smallmodalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<div class="modal-header">
							<h5 class="modal-title" id="mediumModalLabel">Detalhes do
								Projeto</h5>
							<!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button> -->
						</div>
						<div class="table-responsive">
							<table class="table table-top-campaign">
								<tbody>
									<tr>
										<td>#</td>
										<td>${projeto.id}</td>
									</tr>
									<tr>
										<td>Nome</td>
										<td>${projeto.nome}</td>
									</tr>
									<tr>
										<td>Tecnologia</td>
										<td>${projeto.tecnologia.nome}</td>
									</tr>
									<tr>
										<td>Data Início</td>
										<td>${projeto.dataInicio}</td>
									</tr>
									<tr>
										<td>Data Fim</td>
										<td>${projeto.dataFim}</td>
									</tr>
									<tr>
										<td>Descrição</td>
										<td>${projeto.descricao}</td>
									</tr>

									<tr>
										<td>Horas</td>
										<td>${projeto.horas} horas</td>
									</tr>
									<tr>
										<td>Responsável BRQ</td>
										<td>${projeto.responsavelBRQ}</td>
									</tr>
									<tr>
										<td>Responsável cliente</td>
										<td>${projeto.responsavelCliente}</td>
									</tr>
									<tr>
										<td>Status</td>
										<td>${projeto.status.nome}</td>
									</tr>								
								</tbody>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-warning" data-dismiss="modal">Fechar</button>
						<a href="${urlEditar}?id=${projeto.id}"><button type="button" class="btn btn-success">Editar</button></a>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
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
    
    	<script>
                var filtro = document.getElementById('filtro-nome');
				var tabela = document.getElementById('lista');
				filtro.onkeyup = function() {
				    var nomeFiltro = filtro.value;
				    for (var i = 1; i < tabela.rows.length; i++) {
				        var conteudoCelula = tabela.rows[i].cells[0].innerText;
				        var corresponde = conteudoCelula.toLowerCase().indexOf(nomeFiltro) >= 0;
				        tabela.rows[i].style.display = corresponde ? '' : 'none';         
    }
};                       
     	</script>  
    </body>
</html>