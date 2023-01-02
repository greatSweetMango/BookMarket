package db;

import java.sql.*;

public class DBCon {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String drv = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/JSPBookDB";
	String user = "root";
	String password = "1234";

	public Connection getCon() {
		try {
			Class.forName(drv);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("오류 Message : " + e.getMessage());
			e.printStackTrace(System.out);
		} catch (SQLException e) {
			System.out.println("오류 SQLException : " + e.getSQLState());
			System.out.println("오류 Message : " + e.getErrorCode() + " - " + e.getMessage());
			e.printStackTrace(System.out);
		} catch (Exception e) {
			System.out.println("오류 Message : " + e.getMessage());
			e.printStackTrace(System.out);
		}
		return conn;
	}

	public PreparedStatement getPStmt(String sql) {
		try {
			Class.forName(drv);
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
		} catch (ClassNotFoundException e) {
			System.out.println("오류 Message : " + e.getMessage());
			e.printStackTrace(System.out);
		} catch (SQLException e) {
			System.out.println("오류 SQLException : " + e.getSQLState());
			System.out.println("오류 Message : " + e.getErrorCode() + " - " + e.getMessage());
			e.printStackTrace(System.out);
		} catch (Exception e) {
			System.out.println("오류 Message : " + e.getMessage());
			e.printStackTrace(System.out);
		}
		return pstmt;
	}

	public ResultSet getRS(String sql) {
		try {
			Class.forName(drv);
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (ClassNotFoundException e) {
			System.out.println("오류 Message : " + e.getMessage());
			e.printStackTrace(System.out);
		} catch (SQLException e) {
			System.out.println("오류 SQLException : " + e.getSQLState());
			System.out.println("오류 Message : " + e.getErrorCode() + " - " + e.getMessage());
			e.printStackTrace(System.out);
		} catch (Exception e) {
			System.out.println("오류 Message : " + e.getMessage());
			e.printStackTrace(System.out);
		}
		return rs;
	}
}
