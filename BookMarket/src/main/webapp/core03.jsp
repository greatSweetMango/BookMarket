<%@ page contentType="text/html;charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
</head>
<body>
	<h3>±¸±¸´Ü</h3>
	<table>
		<c:forEach var="i" begin="1" end="9">
			<tr>
				<c:forEach var="j" begin="1" end="9">
					<td width=100>${ 10-i }*${ 10-j } = ${(10-j) * (10-i) }</td>
				</c:forEach>
			</tr>
			
		</c:forEach>
	</table>
</body>
</html>