<%@page contentType="text/html; charset=utf-8"%>
<%@page import="dao.BookDAO"%>
<%
    String bookId = request.getParameter("id");

	BookDAO dao = new BookDAO();
	int cntResult;
	cntResult = dao.deleteBook(bookId);

    response.sendRedirect("editbook.jsp?edit=delete");
    //editBook.jsp 또는 editbook.jsp 등 프로젝트에 맞게 수정
%>