<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/app/adm/usuario" var="urlListar" />
<c:url value="/app/adm/usuario/novo" var="urlNovo" />

<!DOCTYPE html>
<html>
<head>
<c:import url="../templates/head2.jsp"/>
</head>
<body>
<c:import url="../templates/header2.jsp"/>
	<h1>Usuarios</h1>
			
	<c:forEach items="${usuarios}" var="usuario">	
		<tr>
			<div>
			<td>
				<a href="${urlListar}?id=${usuario.id}">${usuario.nome}</a>
			</td>
			</div>			
		</tr>
	</c:forEach>
	
	<a href="${urlNovo}">Novo</a>	

</body>
</html>