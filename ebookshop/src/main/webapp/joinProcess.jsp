<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
String driver = "org.mariadb.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/board";

request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");
String password=request.getParameter("password");
String name=request.getParameter("name");


	try {
		Class.forName(driver);
			
		Connection conn = DriverManager.getConnection(url,"java", "java");
		
		Statement stmt = conn.createStatement();
		
		/* 데이터 추가 INSERT */
		String insertSql = "INSERT INTO mission(id, password, name) VALUES('"+id+"','"+password+"','"+name+"')";
		stmt.executeQuery(insertSql);	
		
		response.sendRedirect("loginForm.jsp");
		
		conn.close();
		
	}

	catch(Exception e) {
		response.sendRedirect("joinForm.jsp");
		e.printStackTrace();
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