<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>

										<div class="row mt-4">
											<div class="col">	
											 
												<div class="row" style="font-size:0.8em;">																					
													<div class="col ps-0">									
														<select class="form-select" aria-label="Default select example" onchange="reloadOnlineConsultingList(this.value,shared_sortby,searchCategory.value,searchContents.value, shared_pageNum)">
														  <option value="all" ${isReply == 'all' ? 'checked' : null }>전체</option>
														  <option value="reply" ${isReply == 'Reply' ? 'checked' : null }>답변</option>
														  <option value="unReply" ${isReply == 'unReply' ? 'checked' : null }>미답변</option>										  
														</select>										
													</div>
													<div class="col-6"></div>															
													
													<div class="col">
														<div class="row pt-3" style="font-size:0.9em; display:flex; text-align:right;">
															<div id="getOnlineConsultingListLatest" onclick="reloadOnlineConsultingList(shared_isReply,'latest',searchCategory.value,searchContents.value, currentPageNum.value)" class="col pe-0">
																<span onmouseover="cursorChangeLikeLink(this)">최신순</span>
															</div>
															<div id="getOnlineConsultingListEarliest" onclick="reloadOnlineConsultingList(shared_isReply,'earliest',searchCategory.value,searchContents.value, currentPageNum.value)" class="col pe-2">
																<span onmouseover="cursorChangeLikeLink(this)">오래된순</span>
															</div>
														</div>
													</div>
												</div>
				
											</div>
									  </div>
									
									
									<div class="row mt-3">
										<div class="col">
											<div class="row border" style="align-items:center;">
											
																	
												<div class="col-3">
													<select id="searchCategory" class="ps-0 form-select" aria-label="Default select example" style="border:none; outline:none; font-size:0.9em;">
													  <option value="all">선택</option>
													  <option value="student_name">학생 이름</option>
													  <option value="online_consulting_pk">신청번호</option>
													</select>							
												</div>
												<div class="col-9">
													<div class="row">
														<div class="col-11">
															<input id="searchContents" type="text" style="border:none; outline:none; width:100%; font-size:0.7em;">
														</div>								
														<div class="col-1">
															<button onclick="reloadOnlineConsultingList(shared_isReply,shared_sortby,searchCategory.value,searchContents.value, currentPageNum.value)"  style="border:none; background:none; cursor:pointer;"><i class="bi bi-search"></i>
															</button>
														</div>
				
													</div>									
												</div>										
				
																	
											</div>
				
										</div>
									</div>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>