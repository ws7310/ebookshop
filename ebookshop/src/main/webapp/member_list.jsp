<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String driver = "org.mariadb.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/board";

request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");
String password=request.getParameter("password");
String sql="SELECT * FROM mission";
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

Class.forName(driver);
conn = DriverManager.getConnection(url, "java","java");
stmt = conn.createStatement();
rs=stmt.executeQuery(sql);
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 시스템 관리자모드(회원 목록 보기)</title>
<style>
	table{
		margin : auto;
		width : 400px;
		border : 1px solid gray;
		text-align: center;
	}
	.td_title{
		font-weight: bold;
		font-size: x-large;
	}
</style>
</head>
<body>
<table>
	<tr><td colspan=2 class="td_title">회원 목록</td></tr>
	<%while(rs.next()){%>
	<tr>
		<td>
			<a href="member_info.jsp?id=<%=rs.getString("id") %>">
				<%=rs.getString("id") %>
			</a>
		</td>
		<td>
		    <a href="member_delete.jsp?id=<%=rs.getString("id") %>">삭제</a>
		</td>
	</tr>
	<%} %>
</table>
</body>
</html>