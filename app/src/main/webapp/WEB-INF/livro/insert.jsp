<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <title>Novo Livro</title>
        <link rel="stylesheet" href="/css/bootstrap.min.css">
    </head>
    <body>
        <%@ include file = "../_templates/navbar.jsp" %>
        <div class="container">
            <h1>Novo Livro</h1>
            <form action="/livros/insert" method="post">
                <div>
                    <label class="form-label" for="nome">Título do Livro</label>
                    <input class="form-control" type="text" id="titulo" name="titulo" placeholder="Digite o título do Livro" />
                </div>
                <label class="form-label for="generos">Selecione o gênero do livro</label>
                <select class="form-select" name="genero" id="generos">
                    <c:forEach var="item" items="${generos}">
                        <option value="${item.id}">${item.nome}</option>
                    </c:forEach>
                </select>
                <button type="submit" class="btn btn-success">Salvar</button>
           
                </form>
                <br />
                <a href="/livros/list" class="btn btn-secondary">Voltar</a>
            </form>
        </div>
    </body>
</html>

