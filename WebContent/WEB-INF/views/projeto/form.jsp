<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:url value="../../assets/vendor" var="vendor" />
<c:url value="../../assets/js" var="js" />
<c:url value="../../assets/imagens" var="img" />

<c:url value="/app/projeto/salvar" var="urlSalvar" />
<c:url value="/app/projeto/deletar" var="urlDeletar" />

<!DOCTYPE html>
<html>
<head>
<c:import url="../templates/head2.jsp" />
<title>Projeto ${projeto.nome}</title>
</head>

<c:import url="../templates/header2.jsp" />

<!-- MAIN CONTENT-->
<div class="main-content">
	<div class="section__content section__content--p30">
		<div class="container-fluid">

			<button>
				<a href="/gerenciadepjs/app/projeto"> <img
					src="${img}/voltar.png" title="Voltar"
					style="color: #005fa3; margin-top: -20px; width: 45px;"
					alt="voltar para a página anterior">
				</a>
			</button>

			<div class="row d-flex justify-content-center">
				<div class="col-lg-12">
					<div class="card card-tecnologias">
						<div class="card-header card-header-tecnologias">
							<h2 class="title-1" style="font-size: 20px; color: #fff;">Cadastro
								de Projetos</h2>

						</div>
						<form:form modelAttribute="projeto" action="${urlSalvar}"
							method="post" id="formulario">
							<div class="card-body card-block">

								<c:if test="${projeto.id == null}">
									<div class="row form-group">
										<div class="col col-md-3">
											<label class=" form-control-label">ID<b
												class="obrigatorio">*</b></label>
										</div>
										<div class="col-12 col-md-9">
											<form:input path="id" type="number" id="number-input"
												name="text-input" class="form-control" />
												<span class="obrigatorio"><form:errors path="id" /></span>
											<small class="form-text text-muted">Insira o id do
												projeto (não poderá ser alterado).</small>
										</div>
									</div>
								</c:if>
								<form:hidden path="id" value="${projeto.id}" />
								<c:if test="${projeto.id != null}">
									<div class="row form-group">
										<div class="col col-md-3">
											<label class=" form-control-label">ID</label>
										</div>
										<div class="col-12 col-md-9">
											<input type="number" id="number-input"
												name="text-input" class="form-control" disabled="true" value="${projeto.id}"/>
											<small class="form-text text-muted">Id do
												projeto não pode ser alterado</small>
										</div>
									</div>
								</c:if>
								<div class="row form-group">
									<div class="col col-md-3">
										<label class=" form-control-label">Nome<b
											class="obrigatorio">*</b></label>
									</div>
									<div class="col-12 col-md-9">
										<form:input path="nome" type="text" id="text-input"
											name="text-input" class="form-control" />
										<span class="obrigatorio"><form:errors path="nome" /></span>
										<small class="form-text text-muted">Por favor insira o
											nome do projeto</small>
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Data
											Início</label>
									</div>
									<div class="col-12 col-md-9">
										<form:input path="dataInicio" type="date" id="date-input"
											name="date-input" class="form-control" />
										<span class="obrigatorio"><form:errors
												path="dataInicio" /></span> <small class="form-text text-muted">Coloque
											a data de início do seu projeto</small>
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Data
											Fim</label>
									</div>
									<div class="col-12 col-md-9">
										<form:input path="dataFim" type="date" id="date-input"
											name="date-input" class="form-control" />
										<span class="obrigatorio"><form:errors path="dataFim" /></span>
										<small class="form-text text-muted">Coloque a data de
											fim do seu projeto</small>
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label class=" form-control-label">Horas</label>
									</div>
									<div class="col-12 col-md-9">
										<form:input path="horas" type="number" id="number-input"
											name="number-input" class="form-control" />
										<span class="obrigatorio"><form:errors path="horas" /></span>
										<small class="form-text text-muted">Coloque as horas
											necessarias para ser realizado </small>
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label class=" form-control-label">Responsável BRQ<b
											class="obrigatorio">*</b></label>
									</div>
									<div class="col-12 col-md-9">
										<form:input path="responsavelBRQ" type="text" id="text-input"
											name="text-input" class="form-control" />
										<span class="obrigatorio"><form:errors
												path="responsavelBRQ" /></span> <small
											class="form-text text-muted">Por favor insira o
											usuario Responsável </small>
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label class=" form-control-label">Responsável cliente<b
											class="obrigatorio">*</b></label>
									</div>
									<div class="col-12 col-md-9">
										<form:input path="responsavelCliente" type="text"
											id="text-input" name="text-input" class="form-control" />
										<span class="obrigatorio"><form:errors
												path="responsavelCliente" /></span> <small
											class="form-text text-muted">Por favor insira o
											Responsável Cliente</small>
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="select" class=" form-control-label">Tecnologias<span
											class="obrigatorio">*</span></label>
									</div>
									<div class="col-12 col-md-9">

										<select name="tecnologias" class="selectpicker" multiple>
											<c:forEach items="${tecnologias}" var="tecnologia">
												
												<option value="${tecnologia.id}"
													<c:forEach items="${projeto.tecnologia}" var="ptec">												
														${ptec.id eq tecnologia.id ? 'selected' : ''}
													</c:forEach>
													>${tecnologia.nome}												
												</option>
																									
											</c:forEach>
										</select></br>
										
										<span class="obrigatorio"><form:errors path="tecnologia"/></span>
										
										<small class="form-text text-muted">Por favor escolha
											as tecnologias do seu projeto</small>
									</div>
									
								</div>

								<div class="row form-group">
									<div class="col col-md-3">
										<label for="select" class=" form-control-label">Status</label>
									</div>
									<div class="col-12 col-md-9">
										<form:select path="status.id" id="select" class="form-control">
											<c:forEach items="${status}" var="status">
												<option value="${status.id}"
													${projeto.status.id eq status.id ? 'selected' : ''}>
													${status.nome}</option>
											</c:forEach>
										</form:select>
										<small class="form-text text-muted">Por favor insira o
											status </small>
									</div>
								</div>

								<div class="row form-group">
									<div class="col col-md-3">
										<label for="textarea-input" class=" form-control-label">Descrição</label>
									</div>
									<div class="col-12 col-md-9">
										<form:textarea path="descricao" id="textarea-input" rows="6"
											class="form-control" />
										<span class="obrigatorio">
											<form:errors path="descricao"/>
										</span>
										<small>Descreva o seu projeto</small>
									</div>
								</div>
							</div>
							<div class="card-footer">

								<button type="reset" class="btn btn-danger btn-sm">
									<i class="fa fa-ban"></i> ${projeto.id != null ? 'Reset' : 'Limpar'}
								</button>

								<button type="submit"
									class="btn btn-secundary btn-tecnologias btn-sm">
									<i class="fa fa-dot-circle-o"></i> Salvar
								</button>


								<c:if test="${projeto.id != null}">									
										<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" 
                                                            data-target="#myModal">
											<i class="fa fa-ban"></i> Deletar
										</button>								
								</c:if>

							</div>
						</form:form>
					</div>
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
<!-- Jquery JS-->
<script src="${vendor}/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JS-->
<script src="${vendor}/bootstrap-4.1/popper.min.js"></script>
<script src="${vendor}/bootstrap-4.1/bootstrap.min.js"></script>
<!-- Vendor JS       -->
<script src="${vendor}/slick/slick.min.js"></script>
<script src="${vendor}/wow/wow.min.js"></script>
<script src="${vendor}/animsition/animsition.min.js"></script>
<script
	src="${vendor}/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<script src="${vendor}/counter-up/jquery.waypoints.min.js"></script>
<script src="${vendor}/counter-up/jquery.counterup.min.js"></script>
<script src="${vendor}/circle-progress/circle-progress.min.js"></script>
<script src="${vendor}/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="${vendor}/chartjs/Chart.bundle.min.js"></script>
<script src="${vendor}/select2/select2.min.js"></script>
<!-- Main JS-->
<script src="${js}/main.js"></script>
<script src="${js}/bootstrap-select.js"></script>
<script src="${js}/bootstrap-select.js.map"></script>

<div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title"></h4>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    Você tem certeza que quer excluir o projeto?
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <a href="${urlDeletar}?id=${projeto.id}">
                    <button type="button" class="btn btn-danger">Sim</button>
                    </a>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Não</button>
                </div>

            </div>
        </div>
    </div>

</body>
</html>