<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String driver = "org.mariadb.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/board";

request.setCharacterEncoding("UTF-8");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

Class.forName(driver);
conn = DriverManager.getConnection(url, "java","java");
stmt = conn.createStatement();
String id=request.getParameter("id");
String sql = "Select * from mission WHERE id='"+ id +"'";
rs=stmt.executeQuery(sql);
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 관리자모드(회원 정보 보기)</title>
<style>
	table{
		margin : auto;
		width : 400px;
		border : 1px solid gray;
		text-align : center;
	}
</style>
</head>
<body>
<table>
<%while(rs.next()){ %>
	<tr>
		<td>아이디 : </td>
		<td><%=rs.getString("id") %></td>
	</tr>
	<tr>
		<td>비밀번호 : </td>
		<td><%=rs.getString("password") %></td>
	</tr>
	<tr>
		<td>이름 : </td>
		<td><%=rs.getString("name") %></td>
	</tr>
	<tr>
		<td>레벨 : </td>
		<td><%=rs.getString("level") %></td>
	</tr>
	<tr>
		<td colspan=2><a href="member_list.jsp">리스트로돌아가기</a></td>
	</tr>
	<%} %>
</table>
</body>
</html>