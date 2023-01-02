<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="navbar navbar-expand navbar-dark bg-dark">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="./">Home</a>
        </div>
    </div>
    <div>
        <ul class="navbar-nav mr-auto">
            <li class="nav-item"><a class="nav-link" href="./books.jsp">도서 목록</a></li>
            <li class="nav-item"><a class="nav-link" href="./addbook.jsp">도서 등록</a></li>
            <li class="nav-item"><a class="nav-link" href="./editbook.jsp?edit=update">도서 수정</a></li>
            <li class="nav-item"><a class="nav-link" href="./editbook.jsp?edit=delete">도서 삭제</a></li>
        </ul>
    </div>
</div>