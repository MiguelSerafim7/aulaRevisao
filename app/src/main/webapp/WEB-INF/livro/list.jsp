
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Lista de Livros</title>
        <link rel="stylesheet" href="/css/bootstrap.min.css">
    </head>
    <body>
        <%@ include file = "../_templates/navbar.jsp" %>
        <div class="container">
            <h1>Lista de Livros</h1>
            <a href="/livros/insert" class="btn btn-primary">Novo Livro</a>
            <table class="table">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Gênero</th>
                    <th>&nbsp;</th>
                </tr>
                <c:forEach var="item" items="${livros}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.titulo}</td>
                        <td>${item.genero.nome}</td>
                        <td>
                            <a class="btn btn-secondary" href="/livros/update?id=${item.id}">Editar</a>
                            <a class="btn btn-danger" href="/livros/delete?id=${item.id}">Deletar</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>

