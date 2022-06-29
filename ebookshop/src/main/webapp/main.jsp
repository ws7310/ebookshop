<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
String id = (String)session.getAttribute("id");
int level = (Integer)session.getAttribute("level");
%>
<html>
<head>
<title>회원관리 시스템 메인 페이지</title>
</head>
<body>
<h2><%=id %> 로 로그인하셨습니다.</h2>
	
	<%if(level==1){%>
	<h3>레벨1은 게시글 보기 및 쓰기 권한이 없습니다.</h3>
	<a href="loginForm.jsp">로그인 페이지로 돌아가기</a>
	<%} else if(level>=2) {%>
	<a href="list.jsp">게시글 리스트 보러가기</a>
	<%} %>
</body>
</html>