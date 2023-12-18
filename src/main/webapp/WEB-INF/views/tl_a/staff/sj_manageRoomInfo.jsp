<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
   <!-- 최상단 -->
   <jsp:include page="../commons/staff/topNavi.jsp"></jsp:include>
   
   <!-- 기숙사관리 탭 페이지 -->
   <jsp:include page="../commons/staff/topNavi3.jsp"></jsp:include>
   
   
   <!-- 내용시작 -->
   <div class="row">
      <!-- 좌측 카테고리 -->
      <jsp:include page="../commons/staff/leftCategory2.jsp"></jsp:include>
      
      <!-- 우측내용 -->
      <div class="col mx-5">
         <!-- 카테고리명 -->
         <div class="row my-3">
            <div class="col fs-4 fw-bold">
               호 정보 관리 
            </div>
         </div>
         
         <!-- 카테고리 -->
         <div class="row mt-2">
            <div class="col fw-bold text-center px-2 py-2 mb-3">
               <ul class="nav nav-tabs">
               <li class="nav-item ta">
                   <a class="nav-link active text-black" href="./sj_manageRoomInfo">전체보기</a>
                 </li>
               <c:forEach items="${dormBuilding }" var="dorm">
               
                 <li class="nav-item ">
                   <a class="nav-link text-secondary" href="./sj_manageRoomInfoReadPage?dorm_pk=${dorm.dorm_pk }">${dorm.name }</a>
                 </li>
                </c:forEach>
               </ul>
            </div>
         </div>
         
         <!-- 세부내용 시작 -->
         <div class="row mb-3">
         
            <div class="col text-center fs-5 fw-bold my-4">
               전체 호실 정보
            </div>
         </div>         
         <div class="row border rounded-0 p-3">
         <div class="col-1"></div>
            <div class="col">
               <div class="row text-center fw-bold my-3 fs-5 border-bottom pb-4">
                  <div class="col">
                     동
                  </div>
                  <div class="col">
                     층
                  </div>
                  <div class="col">
                     호실
                  </div>
                  <div class="col">
                     정원
                  </div>
                  <div class="col">
                     성별
                  </div>
                  <div class="col">수정</div>
                  <div class="col">삭제</div>
               </div>
               
               <c:forEach items="${rooms}" var="roomMap">
               
                   <div class="row text-center my-2 border-bottom" >
                       <div class="col my-4">
                          <input type="hidden" value=${roomMap.dormRoomDto.dorm_room_pk }>
                           <div class="row">
                              <div class="col ">
                                   ${roomMap.dormBuildingDto.name }
                               </div>
                               <div class="col">
                                   ${roomMap.dormRoomDto.dorm_floor } 층
                               </div>
                               
                               <div class="col">
                               <div class="dropdown">
                                   <a class="btn btn-outline-dark rounded-0 dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                       <input type="hidden" value="${roomMap.dormRoomDto.dorm_room_pk}">
                                       ${roomMap.dormRoomDto.room_name}
                                   </a>
                           
		                           <ul class="dropdown-menu">
		                            <c:forEach items="${studentList}" var="st">
		                                <c:if test="${st.roomDto.dorm_room_pk == roomMap.dormRoomDto.dorm_room_pk}">
		                                    <li>
		                                        <a class="dropdown-item " style="dropdown-link-hover-bg:#eeeeee;"
		                                        	href="sj_managePoint?dorm_student_pk=${st.student.dorm_student_pk}">
		                                            <div class="row">
		                                            	<div class="col">
		                                            		<span class="fw-bold" >이름</span> <span class="mz-2">${st.stInfo.name}</span>
		                                            	</div>
		                                            	<div class="col">
		                                            		<span class="fw-bold">학번</span> <span class="mz-2">${st.student.student_pk}</span>
		                                            	</div>
		                                            </div>
		                                             
		                                            
		                                            
		                                        </a>
		                                    </li>
		                                </c:if>
		                            </c:forEach>
		                           </ul>
           
                               </div>
                           </div>
                           
                               <div class="col">
                                   ${roomMap.categoryDto.dorm_amount }인실
                               </div>
                               <div class="col">
                                   ${roomMap.dormRoomDto.gender }
                               </div>
                               <div class="col">
                                   <a class="btn btn-primary rounded-0" href="./sj_editRoomInfo?dorm_room_pk=${roomMap.dormRoomDto.dorm_room_pk }" role="button">수정하기</a>
                               </div>
                               <div class="col">
                                   <a class="btn btn-danger rounded-0" href="./deleteForRoomProcess?dorm_room_pk=${roomMap.dormRoomDto.dorm_room_pk }" role="button">삭제하기</a>
                               </div>
                           </div>
                       </div>
                   </div>
               </c:forEach>
            </div>
            <div class="col-1"></div>
         </div>
         
      </div> <!-- 우측내용 col 끝 -->
 <pre>
			
			
			</pre>
   </div> <!-- main row 끝 -->
   

</div>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
 crossorigin="anonymous"></script>
</body>
</html>