<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.BookDAO" %>
<%@page import="dto.Book" %>
<%@page errorPage="exceptionNoBookId.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            function addToCart() {
                if (confirm("도서를 장바구니에 추가하시겠습니까?")) {
                    document.addForm.submit();
                } else {
                    document.addForm.reset();
                }
            }
        </script>
        <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
        <title>도서 정보</title>
    </head>
    <body>
        <jsp:include page="menu.jsp" />
        <div class="jumbotron">
            <div class="container">
                <h1 class="display-3">도서 정보</h1>
            </div>
        </div>
        <%
        	String bookId = request.getParameter("id");
	    	BookDAO dao = new BookDAO();
	    	Book book = new Book();
 			book = dao.selectBook(bookId);
        %>
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <img src="./resources/images/<%=book.getFilename()%>" style="width: 100%;" />
                </div>
                <div class="col-md-6">
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
                    <p> <b>도서 코드 : </b><span class="badge badge-danger"><%=book.getBookId()%></span></p>
                    <p> <b>출판사</b> : <%=book.getPublisher()%></p>
                    <p> <b>저자</b> : <%=book.getAuthor()%></p>
                    <p> <b>재고수</b> : <%=book.getUnitsInStock()%></p>
                    <p> <b>총 페이지수</b> : <%=book.getTotalPages()%></p>
                    <p> <b>출판일</b> : <%=book.getReleaseDate()%></p>
                    <h4><%=book.getUnitPrice()%>원</h4>
                    <form name="addForm" action="./addCart.jsp?id=<%=book.getBookId()%>" method="post">
                    	<p>
	                        <a href="#" class="btn btn-info" onclick="addToCart()">도서주문 &raquo;</a>
	                        <a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
	                        <a href="./books.jsp" class="btn btn-secondary">도서목록 &raquo;</a>
                        </p>
                    </form>
                </div>
            </div>
            <hr />
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
