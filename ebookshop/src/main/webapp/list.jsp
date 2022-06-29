<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%
int level = (Integer)session.getAttribute("level");
%>

<html>
<head>
<title>게시판</title>
</head>
<body>
	<h3>게시글 리스트</h3>
	<table border="2">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>날짜</td>
		<td>이메일</td>
	</tr>
	
	<%
		Connection con = null;
		Statement stmt = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/board";
			con = DriverManager.getConnection(url, "java", "java");
		}catch (Exception e){
			out.println("데이터베이스 접속에 문제가 있습니다.<hr>");
			out.println(e.getMessage());
			e.printStackTrace();
		}
		stmt = con.createStatement();
		String sql = "SELECT * FROM message order by id asc";
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs !=null){
			while (rs.next()){
				int id = Integer.parseInt(rs.getString("id"));
			
	%>
	<tr>
		<td><%=id %></td>
		<td><a href=display.jsp?id=<%=id %>>
		<%=rs.getString("subject") %></a></td>
		<td><%=rs.getString("name") %></td>
		<td><%=rs.getString("time") %></td>
		<td><%=rs.getString("email") %></td>
		
		<%if(level==3) {%>
		<td>
		<a href="delete.jsp?id=<%=rs.getString("id") %>">삭제</a>
		<%} %>
		
		</td>
	</tr>
	<%
			}
		}
	%>
	</table>
	<%if(level<=2){%>
	<h3>레벨3이상만 글 작성 가능</h3>
	<%} else if(level==3) {%>
	<a href="write.jsp">게시글 쓰기</a>
	<br>
	<a href="main.jsp">메인 페이지로</a>
	<br>
	<a href="loginForm.jsp">로그인 페이지로</a>
	<%} %>
	
	
	<%
		if(stmt != null)
			stmt.close();
		if(con != null)
			con.close();
	%>
</body>
</html>