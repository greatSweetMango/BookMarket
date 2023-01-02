package dao;

import dto.Book;
import db.DBCon;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class BookDAO {
    Connection con;
    DBCon dbc = new DBCon();
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    private Book getBook(ResultSet rs) {
    	Book book = new Book();

    	try {
			book.setBookId(rs.getString(1));
	        book.setName(rs.getString(2));
	        book.setUnitPrice(rs.getInt(3));
	        book.setAuthor(rs.getString(4));
	        book.setPublisher(rs.getString(5));
	        book.setDescription(rs.getString(6));
	        book.setCategory(rs.getString(7));
	        book.setUnitsInStock(rs.getLong(8));
	        book.setTotalPages(rs.getLong(9));
	        book.setReleaseDate(rs.getString(10));
	        book.setCondition(rs.getString(11));
	        book.setFilename(rs.getString(12));
        } catch (SQLException e) {
            System.out.println("오류 SQLException : " + e.getSQLState());
            System.out.println("오류 Message : " + e.getErrorCode() + " - " + e.getMessage());
            e.printStackTrace(System.out);
        } catch (Exception e) {
            System.out.println("오류 Message : " + e.getMessage());
            e.printStackTrace(System.out);
        }

    	return book;
    }

    public List<Book> selectAllBooks() {
        List<Book> list = new ArrayList<Book>();
        BookDAO dao = new BookDAO();

        try {
            rs = dbc.getRS("SELECT * FROM BOOK");
            while (rs.next()) {
            	Book book = new Book();
                book = dao.getBook(rs);
                list.add(book);
            }
        } catch (SQLException e) {
            System.out.println("오류 SQLException : " + e.getSQLState());
            System.out.println("오류 Message : " + e.getErrorCode() + " - " + e.getMessage());
            e.printStackTrace(System.out);
        } catch (Exception e) {
            System.out.println("오류 Message : " + e.getMessage());
            e.printStackTrace(System.out);
        }

        return list;
    }

    public Book selectBook(String bookId) {
    	Book book = new Book();
    	BookDAO dao = new BookDAO();

    	try {
            pstmt = dbc.getPStmt("SELECT * FROM BOOK WHERE B_ID = ?");
            pstmt.setString(1, bookId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
            	book = dao.getBook(rs);
            }
        } catch (SQLException e) {
            System.out.println("오류 SQLException : " + e.getSQLState());
            System.out.println("오류 Message : " + e.getErrorCode() + " - " + e.getMessage());
            e.printStackTrace(System.out);
        } catch (Exception e) {
            System.out.println("오류 Message : " + e.getMessage());
            e.printStackTrace(System.out);
        }

    	return book;
    }

    public int insertBook(Book book) {
    	int cntResult = 0;

    	try {
			pstmt = dbc.getPStmt("INSERT INTO BOOK VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            pstmt.setString(1, book.getBookId());
            pstmt.setString(2, book.getName());
            pstmt.setInt(3, book.getUnitPrice());
            pstmt.setString(4, book.getAuthor());
            pstmt.setString(5, book.getPublisher());
            pstmt.setString(6, book.getDescription());
            pstmt.setString(7, book.getCategory());
            pstmt.setLong(8, book.getUnitsInStock());
            pstmt.setLong(9, book.getTotalPages());
            pstmt.setString(10, book.getReleaseDate());
            pstmt.setString(11, book.getCondition());
           	pstmt.setString(12, book.getFilename());

            cntResult = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("오류 SQLException : " + e.getSQLState());
            System.out.println("오류 Message : " + e.getErrorCode() + " - " + e.getMessage());
            e.printStackTrace(System.out);

        } catch (Exception e) {
            System.out.println("오류 Message : " + e.getMessage());
            e.printStackTrace(System.out);
        }

    	return cntResult;
    }

    public int updateBook(Book book) {
    	int cntResult = 0;

    	try {
			String sqlUpdate = "UPDATE BOOK SET "
								+ "B_NAME=?, B_UNITPRICE=?, B_AUTHOR=?, B_PUBLISHER=?, "
								+ "B_DESCRIPTION=?, B_CATEGORY=?, B_UNITSINSTOCK=?, B_TOTALPAGES=?, "
								+ "B_RELEASEDATE=?, B_CONDITION=?";
			if (book.getFilename() != null && book.getFilename().length() > 0) {
				sqlUpdate += ", B_FILENAME=?";
			}
			sqlUpdate += " WHERE B_ID = ?";

			pstmt = dbc.getPStmt(sqlUpdate);
            pstmt.setString(1, book.getName());
            pstmt.setInt(2, book.getUnitPrice());
            pstmt.setString(3, book.getAuthor());
            pstmt.setString(4, book.getPublisher());
            pstmt.setString(5, book.getDescription());
            pstmt.setString(6, book.getCategory());
            pstmt.setLong(7, book.getUnitsInStock());
            pstmt.setLong(8, book.getTotalPages());
            pstmt.setString(9, book.getReleaseDate());
            pstmt.setString(10, book.getCondition());
            if (book.getFilename() != null && book.getFilename().length() > 0) {
            	pstmt.setString(11, book.getFilename());
	            pstmt.setString(12, book.getBookId());            	
            } else {
	            pstmt.setString(11, book.getBookId());
            }

            cntResult = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("오류 SQLException : " + e.getSQLState());
            System.out.println("오류 Message : " + e.getErrorCode() + " - " + e.getMessage());
            e.printStackTrace(System.out);

        } catch (Exception e) {
            System.out.println("오류 Message : " + e.getMessage());
            e.printStackTrace(System.out);
        }

		return cntResult;
    }

    public int deleteBook(String bookId) {
    	int cntResult = 0;

    	try {
			pstmt = dbc.getPStmt("DELETE FROM BOOK WHERE B_ID = ?");
            pstmt.setString(1, bookId);
            cntResult = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("오류 SQLException : " + e.getSQLState());
            System.out.println("오류 Message : " + e.getErrorCode() + " - " + e.getMessage());
            e.printStackTrace(System.out);

        } catch (Exception e) {
            System.out.println("오류 Message : " + e.getMessage());
            e.printStackTrace(System.out);
        }

		return cntResult;
    }
}
