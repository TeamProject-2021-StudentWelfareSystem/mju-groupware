<!-- 초기 home 화면 -->
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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../css/sb-admin-2.min.css" rel="stylesheet">
<link href="../css/boardList.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="../resources/vendor/jquery/jquery.min.js"></script>
<script src="../resources/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../resources/vendor/bootstrap/js/sb-admin-2.min.js"></script>

<!-- Page level custom scripts -->
<script src="../resources/vendor/bootstrap/js/demo/chart-area-demo.js"></script>
<script src="../resources/vendor/bootstrap/js/demo/chart-pie-demo.js"></script>

<title>MJS Welfare System</title>
</head>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/homeView/menubar.jsp"></jsp:include>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<jsp:include page="/WEB-INF/views/homeView/topbar.jsp"></jsp:include>
				<div class="container-fluid">

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h4 class="m-0 font-weight-bold text-primary">자료 공유</h4>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<div id="dataTable_wrapper"
									class="dataTables_wrapper dt-bootstrap4">
									<div class="row">
										<div class="col-sm-12 col-md-6">
											<div class="dataTables_length" id="dataTable_length">
												<label>Show <select name="dataTable_length"
													aria-controls="dataTable"
													class="custom-select custom-select-sm form-control form-control-sm">
														<option value="10">10</option>
														<option value="25">25</option>
														<option value="50">50</option>
														<option value="100">100</option>
												</select> 
												</label>
											</div>
										</div>
										<div class="col-sm-12 col-md-2">
											<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search mt-3 pt-3" >
                        						<div class="input-group">
                            						<input type="text" class="form-control bg-light border-0 small" placeholder="검색" aria-label="Search" aria-describedby="basic-addon2">
                            					<div class="input-group-append">
                                					<button class="btn btn-primary" type="button">
                                    				<i class="fas fa-search fa-sm"></i>
                                					</button>
                            					</div>
                       					 		</div>
                    						</form>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12">
										<form action="" name="DocumentList" method="POST" id="form">
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" />
											<table class="table table-bordered dataTable" id="dataTable"
												width="100%" cellspacing="0" role="grid"
												aria-describedby="dataTable_info" style="width: 100%;">
												<thead>
													<tr role="row">
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Office: activate to sort column ascending"
															style="width: 50px;">번호</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Position: activate to sort column ascending"
															style="width: 300px;">제목</th>
														<th class="sorting sorting_asc" tabindex="0"
															aria-controls="dataTable" rowspan="1" colspan="1"
															aria-sort="ascending"
															aria-label="Name: activate to sort column descending"
															style="width: 120px;">작성자</th>
														<th class="sorting" tabindex="0" aria-controls="dataTable"
															rowspan="1" colspan="1"
															aria-label="Start date: activate to sort column ascending"
															style="width: 160px;">작성일</th>
												
														
														
													</tr>
												</thead>
												<tfoot>
													<tr>
														<th rowspan="1" colspan="1">번호</th>
														<th rowspan="1" colspan="1">제목</th>
														<th rowspan="1" colspan="1">작성자</th>
														<th rowspan="1" colspan="1">작성일</th>
													</tr>
												</tfoot>
												<tbody>
													<c:forEach items="${documentList}" var="documentList"
														varStatus="status">
													<tr class="odd">
														<td><c:out value="${pageMaker.totalCount - ((pageMaker.cri.page-1) * 10) - status.index}"/></td>
														<td id="title" title="${documentList.getTBoardSubject()}">
															<a href="${path}/team/documentContent?no=${documentList.getTBoardID()}&num=${documentList.getTeamID()}">
															<c:out value="${documentList.getTBoardSubject()}" /></a></td>
														<td><c:out value="${documentList.getTBoardWriter()}" /></td>
														<td><c:out value="${documentList.getTBoardDate()}" /></td>
													</tr>
													</c:forEach>
												</tbody>
											</table>



											</form>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-12 col-md-5">
											<div class="dataTables_info" id="dataTable_info"
												role="status" aria-live="polite">Showing 1 to 10 of 57
												entries</div>
										</div>
										<div class="col-sm-12 col-md-5">
											<div class="dataTables_paginate paging_simple_numbers"
												id="dataTable_paginate">
												<!-- 페이징처리 시작 -->
											    <ul class="pagination">
											        <li class="paginate_button page-item previous ${(pageMaker.cri.page==1) ? 'disabled':''}"
			                                          id="dataTable_previous">
			                                          <a href='<c:url value="/team/documentList?page=${pageMaker.cri.page-1}"/>'
			                                          aria-controls="dataTable" data-dt-idx="0" tabindex="0"
			                                          class="page-link">Previous</a></li>
			                                       
			                                       <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
			                                       <li class="paginate_button page-item ${pageMaker.cri.page==pageNum ? 'active':'' }">
			                                          <a href='<c:url value="/team/documentList?page=${pageNum}"/>' 
			                                          aria-controls="dataTable" data-dt-idx="1"
			                                          tabindex="0" class="page-link">${pageNum}</a></li>   
			                                       </c:forEach>
			                                       
			                                       <c:choose>            
			                                       <c:when test="${pageMaker.next}">
			                                       <li class="paginate_button page-item next" id="dataTable_next">
			                                          <a href='<c:url value="/team/documentList?page=${pageMaker.endPage+1 }"/>'
			                                          aria-controls="dataTable" data-dt-idx="7" tabindex="0"
			                                          class="page-link">Next</a></li>
			                                       </c:when>
			                                       <c:otherwise>
			                                       	  <li class="paginate_button page-item next disabled" id="dataTable_next">
			                                          <a href='<c:url value="/team/documentList?page=${pageMaker.endPage+1 }"/>'
			                                          aria-controls="dataTable" data-dt-idx="7" tabindex="0"
			                                          class="page-link">Next</a></li>
			                                       </c:otherwise>
			                                       </c:choose>
											    </ul>
											    <!-- 페이징처리 끝 -->			
											</div>
										
										</div>
										<div class="col-sm-12 col-md-2">
											<div class="dataTables_paginate paging_simple_numbers "
												id="dataTable_paginate">
												<ul class="pagination write ">
													<li class="paginate_button page-item active" ><a href="${path}/team/documentWrite?TeamID=${TeamID}"
														aria-controls="dataTable" data-dt-idx="2" tabindex="0"
														class="page-link btn-primary" >글쓰기</a></li>
												</ul>
											</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>
			<jsp:include page="/WEB-INF/views/homeView/footer.jsp"></jsp:include>
		</div>
	</div>
	
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
</body>