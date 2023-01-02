<%@page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="dao.BookDAO" %>
<%@page import="dto.Book" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
        <script type="text/javascript" src="./resources/js/validation.js"></script>
        <style>
            label {
                width: 10em;
            }

            textarea {
                width: 16em !important;
                height: 7em !important;
                resize: none !important;
            }

            input[type="radio"] {
                margin-left: 0.4em;
                margin-right: 0.2em;
            }

            input[type="radio"]:first-of-type {
                margin-left: 0 !important;
            }
        </style>
        <fmt:setLocale value='<%= request.getParameter("language")%>' />
        <fmt:bundle basename="bundle.message">
            <title><fmt:message key="titleUpdate" /></title>
        </fmt:bundle>
    </head>
    <body>
        <fmt:bundle basename="bundle.message">
            <jsp:include page="menu.jsp" />
            <div class="jumbotron">
                <div class="container">
                    <h1 class="display-3"><fmt:message key="titleUpdate" /></h1>
                </div>
            </div>
            <%
            	String bookId = request.getParameter("id");
		    	BookDAO dao = new BookDAO();
		    	Book book = new Book();
	 			book = dao.selectBook(bookId);
            %>
            <div class="container">
                <div class="text-right">
                    <a href="?language=ko&id=<%=book.getBookId()%>">Korean</a> | <a href="?language=en&id=<%=book.getBookId()%>">English</a>
                    <a href="logout.jsp" class="btn btn-sm btn-success pull-right">Logout</a>
                </div>
                <div style="margin-bottom: 1em">
                    <img src="./resources/images/<%=book.getFilename()%>" style="width: 40%;" />
                </div>
                <form name="newBook" action="./processUpdateBook.jsp"
                      class="form-horizontal" method="post" enctype="multipart/form-data">
                    <div class="form-group row">
                        <label class="col-sm-2"><fmt:message key="bookId" /></label>
                        <div class="col-sm-3">
                            <input type="text" id="bookId" name="bookId" class="form-control" value="<%=book.getBookId()%>" readonly required />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2"><fmt:message key="name" /></label>
                        <div class="col-sm-3">
                            <input type="text" id="name" name="name" class="form-control" value="<%=book.getName()%>" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2"><fmt:message key="unitPrice" /></label>
                        <div class="col-sm-3">
                            <input type="text" id="unitPrice" name="unitPrice" class="form-control" value="<%=book.getUnitPrice()%>" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2"><fmt:message key="author" /></label>
                        <div class="col-sm-3">
                            <input type="text" id="author" name="author" class="form-control" value="<%=book.getAuthor()%>" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2"><fmt:message key="publisher" /></label>
                        <div class="col-sm-3">
                            <input type="text" id="publisher" name="publisher" class="form-control" value="<%=book.getPublisher()%>" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2"><fmt:message key="releaseDate" /></label>
                        <div class="col-sm-3">
                            <input type="text" id="releaseDate" name="releaseDate" class="form-control" value="<%=book.getReleaseDate()%>" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2"><fmt:message key="totalPages" /></label>
                        <div class="col-sm-3">
                            <input type="text" id="totalPages" name="totalPages" class="form-control" value="<%=book.getTotalPages()%>" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2"><fmt:message key="description" /></label>
                        <div class="col-sm-5">
                            <textarea id="description" name="description" cols="50" rows="2" class="form-control"><%=book.getDescription()%></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2"><fmt:message key="category" /></label>
                        <div class="col-sm-3">
                            <input type="text" id="category" name="category" class="form-control" value="<%=book.getCategory()%>" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2"><fmt:message key="unitsInStock" /></label>
                        <div class="col-sm-3">
                            <input type="text" id="unitsInStock" name="unitsInStock" class="form-control" value="<%=book.getUnitsInStock()%>" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2"><fmt:message key="condition" /></label>
                        <div class="col-sm-5">
                            <%
                                String condition = book.getCondition();
                                if (condition == null) {
                                    condition = "New";
                                }
                            %>
                            <input type="radio" name="condition" value="New" <% if (condition.equals("New")) {out.print("checked ");} %>/><fmt:message key="new" />
                            <input type="radio" name="condition" value="Old" <% if (condition.equals("Old")) {out.print("checked ");} %>/><fmt:message key="old" />
                            <input type="radio" name="condition" value="EBook" <% if (condition.equals("EBook")) {out.print("checked ");} %>/><fmt:message key="ebook" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2"><fmt:message key="bookImage" /></label>
                        <div class="col-sm-3">
                            <input type="file" id="bookImage" name="bookImage" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-offset-2 col-sm-10">
                            <input type="button" class="btn btn-primary" value="<fmt:message key="button" />" onClick="checkAddBook()" />
                        </div>
                    </div>
                </form>
            </div>
            <jsp:include page="footer.jsp" />
        </fmt:bundle>
    </body>
</html>
