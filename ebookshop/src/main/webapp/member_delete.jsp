<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%

request.setCharacterEncoding("UTF-8");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

String id=request.getParameter("id");

try {
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/board";
	
	Class.forName(driver);
	conn = DriverManager.getConnection(url,"java","java");
	stmt = conn.createStatement();
	String sql = "DELETE FROM mission WHERE id='"+id+"'";
	rs = stmt.executeQuery(sql);
	
	response.sendRedirect("member_list.jsp");
} catch(Exception e) {
	e.printStackTrace();
} finally {
	try {
		stmt.close();
		conn.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
}
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>