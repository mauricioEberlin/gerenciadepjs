<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
	<c:import url="../templates/head.jsp"/>
</head>
<body>

${projeto.id}</br>
${projeto.nome}</br>
${projeto.tecnologia.nome}</br>
${projeto.responsavelBRQ}</br>
${projeto.responsavelCliente}</br>
${projeto.horas}</br>
${projeto.dataInicio}</br>
${projeto.dataFim}</br>
${projeto.descricao}</br>
${projeto.status}</br>

</body>
</html>