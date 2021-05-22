<!-- 팀 추가 화면 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="../css/createTeamContent.css" type="text/css">
<link rel="stylesheet" href="../css/menubar.css" type="text/css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="../js/createTeam.js"></script>

<title>create team</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/homeView/menubar.jsp"></jsp:include>
	<nav>
		<div class="mbody">
			<div class="mcontWidth">
				<jsp:include page="/WEB-INF/views/homeView/userInfoBox.jsp"></jsp:include>
				<div class="rightBox">
					<section>
						<div class="section">
							<br>
							<h2>팀 생성하기</h2>
							<hr>
						</div>
					</section>
					<section>
						<form action="createTeam" name="CreateTeam"
							method="POST" id="form">
							<div class="section2">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<table id="contentTable">
									<tr>
										<td><label for="lectureName">과목명 &nbsp; &nbsp;</label></td>
										<td>
										<select name="lecture" id="lecture">
										<option value="" selected>-선택-</option>
										<option value="성서와인간이해">성서와인간이해</option>
										<option value="채플">채플</option>
										</select>
										</td>
									<tr>
										<td><label for="lectureProfessor">교수명  &nbsp; &nbsp;</label></td>
										<td><select name="LectureProfessor" id="lectureProfessor">
										<option value="" selected>-선택-</option>
										</select></td>
										
									</tr>
									<tr>
										<td><label for="teamName">팀 이름 &nbsp; &nbsp; </label></td>
										<td><input type="text" name="TeamName"
											id="teamName" class="inputBox" 
											value=""></td>
									</tr>
									<tr>
										<td><label for="teamLeaderID">팀장 학번&nbsp; &nbsp; </label></td>
										<td><input type="text" name="TeamLeaderID"
											id="teamLeaderID" class="inputBox" disabled readonly
											value="${TeamLeaderID}"></td>
										<td><label for="teamLeaderName">팀장 이름 &nbsp; &nbsp; </label></td>
										<td><input type="text" name="TeamLeaderName"
											id="teamLeaderName" class="inputBox" disabled readonly
											value="${TeamLeaderName}"></td>	
									</tr>
									<tr>
										<td><label for="studentID">학번 &nbsp; &nbsp; </label></td>
										<td><input type="text" name="StudentID"
											id="studentID" class="inputBox"
											value="${StudentID}">
										</td>
										<td><label for="studentName">팀원명 &nbsp; &nbsp; </label></td>
										<td><input type="text" name="StudentName"
											id="studentName" class="inputBox"
											value="${StudentName}">
										</td>
									</tr>
									</table>
									<table id="addTeamMember">
									</table>
									
								
								<hr>
							</div>
							<!-- section2 -->
							<div id="btn">
								<input type="button" value="팀원 추가" id="addMember" onclick="addTeamMember()">
								<input type="submit" value="팀 생성" id="createButton"> <a
									href="${path}/team/createTeam"><input
									type="button" value="이전" id="listButton"></a>
							</div>
						</form>
					</section>
				</div>
				<!-- right_box -->

			</div>

		</div>
		<!-- mcont_width -->
		<!-- mbody -->
	</nav>
	<!-- mjs_ws -->
</body>
</html>