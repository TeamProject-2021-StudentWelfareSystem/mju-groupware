<!-- 공지사항 작성 화면 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/boardContent.css" type="text/css">
<link rel="stylesheet" href="css/menubar.css" type="text/css">

<title>notice write</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/homeView/menubar.jsp"></jsp:include>
	<nav>
		<div class="mbody">
			<div class="mcontWidth">

				<!-- left_box -->
				<div class="rightBox">
					<section>
						<div class="section">
							<br>
							<h2>글 작성하기</h2>
							<hr>
						</div>
					</section>
					<section>
						<form action="NoticeWrite.do" name="NoticeWrite" method="POST"
							id="form">
							<div class="section2">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<table id="contentTable">
									<tr>
										<td><label for="title">제목 &nbsp; &nbsp; </label></td>
										<td><input
											type="text" name="NoticeTitle" id="noticeTitle"
											class="inputBox" value=${NoticeTitle}></td>
									</tr>
									<tr>
										<td><label for="writer">작성자 &nbsp; </label></td>
										<td><input
											type="text" name="NoticeWriter" id="noticeWriter"
											class="inputBox" value=${NoticeWriter}>
											<input
											type="text" name="Date" id="date" class="inputBox"
											placeholder="날짜가 자동으로 입력됩니다." disabled readonly value=${BoardDate}></td>
									</tr>
									<tr>
										<td><label for="content">내용</label>
										<td><textarea name="NoticeContent" id="noticeContent"
												class="inputBox" placeholder="내용을 입력하세요"></textarea></td>
									</tr>
								</table>
								<hr>
								<table>
									<tr>
										<td><label for="attachment">첨부파일</label>
										<td><input type="file" name="BoardFile" id="boardFile"
												class="inputBox" placeholder="파일을 첨부하세요."></td>
									</tr>
								</table>
							</div>
							<!-- section2 -->
							<div>
								<input type="submit" value="저장" id="listButton"> <a
									href="${path}/noticeList"><input type="button" value="이전"
									id="listButton"></a>
							</div>
						</form>
					</section>
				</div>
				<!-- right_box -->

			</div>
			<!-- mcont_width -->
		</div>
		<!-- mbody -->
	</nav>
</body>
</html>