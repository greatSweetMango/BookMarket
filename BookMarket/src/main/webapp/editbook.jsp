<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Iterator" %>
<%@page import="java.util.List" %>
<%@page import="dao.BookDAO" %>
<%@page import="dto.Book" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function deleteConfirm(id) {
                if (confirm("해당 도서를 정말 삭제하시겠습니까?") == true) {
                    location.href = "./deletebook.jsp?id=" + id;
                } else {
                    return;
                }
            }
        </script>
        <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
        <title>도서 편집</title>
    </head>
    <%
        String edit = request.getParameter("edit");
    %>
    <body>
        <jsp:include page="menu.jsp" />
        <div class="jumbotron">
            <div class="container">
                <h1 class="display-3">도서 편집</h1>
            </div>
        </div>
        <div class="container">
            <%
	        	List<Book> list = new ArrayList<Book>();
	        	BookDAO dao = new BookDAO();
	        	Book book = new Book();
	
	        	list = dao.selectAllBooks();
	        	Iterator<Book> it = list.iterator();
	
	            while (it.hasNext()) {
	            	book = (Book) it.next();
            %>
            <div class="row-md-4">
                <img src="./resources/images/<%=book.getFilename()%>" style="width: 200px;" />
                <h3>[<%=book.getCategory()%>] <%=book.getName()%> <%
                    String condition = book.getCondition();
                    if (condition == null) {
                        condition = "New";
                    }
                    if (condition.equals("New")) {
                        out.print("(신규)");
                    } else if (condition.equals("Old")) {
                        out.print("(중고)");
                    } else if (condition.equals("EBook")) {
                        out.print("(E-Book)");
                    } else {
                        out.print("(신규)");
                    }
                    %></h3>
                <p><%=book.getDescription()%></p>
                <p><%=book.getAuthor()%> | <%=book.getPublisher()%> | <%=book.getUnitPrice()%>원</p>
                <p>
                    <%
                        if (edit.equals("update")) {
                    %>
                    <a href="./updatebook.jsp?id=<%=book.getBookId()%>" class="btn btn-secondary" role="button">수정 &raquo;</a>
                    <%
                    } else if (edit.equals("delete")) {
                    %>
                    <a href="#" onclick="deleteConfirm('<%=book.getBookId()%>')" class="btn btn-secondary" role="button">삭제 &raquo;</a>
                    <%
                        }
                    %>
                </p>
            </div>
            <hr />
            <%
                }
            %>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
