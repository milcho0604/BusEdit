<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/common.js"></script>
<link rel="stylesheet" type="text/css" href="/common.css" />
<style>
a.btn {
	float: right;
	margin: -20px 0 5px 0;
}

td:nth-child(1), td:nth-child(5) {
	text-align: center;
}

div.container {
	width: 800px;
	margin: 10px auto;
	font-size: 10pt;
}

.btn {
	padding: 0.4em 1em;
	border: 1px solid gray;
	border-radius: 0.5em;
	background: linear-gradient(#fff, #ddd);
	text-decoration: none;
	color: black;
	display: inline-block;
}

.btn:active {
	-ms-transform: translateY(2px);
	-webkit-transform: translateY(2px);
	transform: translateY(2px);
	background: #ccc;
}

table.list {
	border-collapse: collapse;
	width: 100%;
}

table.list td {
	padding: 4px;
	border: 1px solid gray;
}

table.list th {
	padding: 4px;
	border: 1px solid gray;
	background-color: #eee;
}

input {
	padding: 4px;
}

select {
	padding: 4px;
}
</style>
</head>
<body>
	<div class="container">
		<h1>버스목록</h1>
		<a href="create" class="btn">버스등록</a>
		<table class="list">
			<thead>
				<tr>
					<th>id</th>
					<th>버스번호</th>
					<th>기점</th>
					<th>종점</th>
					<th>첫차</th>
					<th>막차</th>
					<th>유형</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bus" items="${ buses }">
					<tr data-url="edit?id=${ bus.id }">
						<td>${ bus.id }</td>
						<td>${ bus.busNo }</td>
						<td>${ bus.firstStop }</td>
						<td>${ bus.lastStop }</td>
						<td>${ bus.firstBus }</td>
						<td>${ bus.lastBus }</td>
						<td>${ bus.categoryName }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>

