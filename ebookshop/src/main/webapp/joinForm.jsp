<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>회원관리 시스템 회원가입 페이지</title>
<style>
table {
	margin: auto;
	width: 400px;
	border: 1px solid gray;
	text-align: center;
}

.td_title {
	font-weight: bold;
	font-size: x-large;
}

div {
	text-align: center;
}
</style>
</head>
<body>
	<form name="joinform" action="joinProcess.jsp" method="post">
		<table border=1>
			<tr>
				<td colspan="2" class="td_title">회원가입 페이지</td>
			</tr>
			<tr>
				<td><label for="id">아이디 : </label></td>
				<td><input type="text" name="id" id="id" /></td>
			</tr>
			<tr>
				<td><label for="password">비밀번호 : </label></td>
				<td><input type="password" name="password" id="password" /></td>
			</tr>
			<tr>
				<td><label for="name">이름 : </label></td>
				<td><input type="text" name="name" id="name" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="회원가입">&nbsp;&nbsp;
					<input type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>
	<div>
		<a href="loginForm.jsp">로그인 페이지로</a>
	</div>
</body>
</html>