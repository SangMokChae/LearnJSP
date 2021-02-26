<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.Dog" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#listForm{
		width: 700px;
		height: auto;
		border: 1px solid red;
		margin: auto;
	}
	h2 {
		text-align: center;
	}
	table {
		margin: auto;
		width: 550px;
	}
	.div_empty {
		width: 100%;
		height: 100%;
		text-align: center;
	}
	#doayImageList {
		text-align: center;
	}
	#productImage {
		width: 150px;
		height: 150px;
		border: none;
	}
	#todayImage{
		width: 100px;
		height: 100px;
		border: none;
	}
</style>
</head>
<body>
	<section id="listForm">
		<c:if test="${dogList != null }">
			<h2>개 상품 목록 <a href="dogRegistForm.dog">개 상품등록</a></h2>
			<table>
				<tr>
					<c:forEach var="dog" items="${dogList }" varStatus="status">
					<td>
						<a href="dogView.dog?id=${dog.id }">
							<img src="images/${dog.image }" id="productImage" />
						</a>
						상품명: ${dog.kind }<br />
						가격: ${dog.price }<br />
					</td>
					<c:if test="${((status.index + 1) mod 4) == 0 }">
				</tr>
				<tr>
					</c:if>
					</c:forEach>
				</tr>
			</table>
		</c:if>
		<c:if test="${dogList == null }">
			<div class="div_empty">개 상품이 없습니다. 분양불가</div>
		</c:if>
		<c:if test="${todayImageList != null }">
			<div id="todayImageList">
				<h2>오늘 본 개 상품 목록</h2>
				<table>
					<tr>
						<c:forEach var="todayImage" items="${todayImageList }" varStatus="status">
						<td>
							<img src="images/${todayImage }" id="todayImage" />
						</td>
						<c:if test="${((status.index + 1 ) mod 4) == 0}">
					</tr>
					<tr>
						</c:if>
						</c:forEach>
					</tr>
				</table>
				<h2><a href="dogCartList.dog">장바구니</a></h2>
			</div>
		</c:if>
	</section>
</body>
</html>