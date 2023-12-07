<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        
        <script>
        	
        	let prescriptionCount = 0;
        
        	function clonePrescription() {
				
        		const prescriptionWrapper = document.querySelector("#templete .prescriptionWrapper").cloneNode(true);
        		prescriptionCount++;
        		document.getElementById("prescriptionCount").setAttribute("value", prescriptionCount);
        		document.getElementById("prescriptionListBox").appendChild(prescriptionWrapper);
        		
			}
        
        </script>
        
    </head>
    <body>

        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <jsp:include page="../commonJsp/staffTopBanner.jsp"></jsp:include>
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <div class="col col-auto border-end">
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="row mt-4">
                                                        <div class="col text-center" style="font-size: xx-large;">
                                                            MENU
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col text-center">
                                                            <i class="bi bi-person-lines-fill" style="font-size: 4em;"></i>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col text-center">
                                                            보건직원 이름 님
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col text-center" style="font-size: small;">
                                                            마이페이지&nbsp;&nbsp;|&nbsp;&nbsp;로그아웃
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col">
                                            <div class="row mt-2">
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col px-0">
                                                            <p class="d-grid mb-0">
                                                                <button class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample1" aria-expanded="false" aria-controls="collapseExample">
                                                                    <div class="row py-2 mx-1">
                                                                        <div class="col text-start">
                                                                            <i class="bi bi-capsule"></i>&nbsp;&nbsp;의약품관리
                                                                        </div>
                                                                        <div class="col-1 me-3 text-end pe-0">
                                                                            &or;
                                                                        </div>
                                                                    </div>
                                                                </button>
                                                            </p>
                                                            <div class="collapse" id="collapseExample1">
                                                                <div class="card card-body rounded-0 py-0 border-0">
                                                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
                                                                        재고관리
                                                                    </a>
                                                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
                                                                        입고관리
                                                                    </a>
                                                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
                                                                        코드관리
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col px-0">
                                                            <p class="d-grid mb-0">
                                                                <button class="btn btn-transparent rounded-0 fw-bold text-white" style="font-size: small; background-color: #014195;" type="button">
                                                                    <div class="row py-2 mx-1">
                                                                        <div class="col text-start">
                                                                            <i class="bi bi-ui-checks"></i>&nbsp;&nbsp;진료관리
                                                                        </div>
                                                                    </div>
                                                                </button>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col px-0">
                                                            <p class="d-grid mb-0">
                                                                <button class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button">
                                                                    <div class="row py-2 mx-1">
                                                                        <div class="col text-start">
                                                                            <i class="bi bi-person-exclamation"></i>&nbsp;&nbsp;요보호학생관리
                                                                        </div>
                                                                    </div>
                                                                </button>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col px-0">
                                                            <p class="d-grid mb-0">
                                                                <button class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample">
                                                                    <div class="row py-2 mx-1">
                                                                        <div class="col text-start">
                                                                            <i class="bi bi-box-seam"></i>&nbsp;&nbsp;물품관리
                                                                        </div>
                                                                        <div class="col-1 me-3 text-end pe-0">
                                                                            &or;
                                                                        </div>
                                                                    </div>
                                                                </button>
                                                            </p>
                                                            <div class="collapse" id="collapseExample2">
                                                                <div class="card card-body rounded-0 py-0 border-0">
                                                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
                                                                        등록
                                                                    </a>
                                                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
                                                                        현황관리
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col px-0">
                                                            <p class="d-grid mb-0">
                                                                <button class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample3" aria-expanded="false" aria-controls="collapseExample">
                                                                    <div class="row py-2 mx-1">
                                                                        <div class="col text-start">
                                                                            <i class="bi bi-highlighter"></i>&nbsp;&nbsp;교육프로그램관리
                                                                        </div>
                                                                        <div class="col-1 me-3 text-end pe-0">
                                                                            &or;
                                                                        </div>
                                                                    </div>
                                                                </button>
                                                            </p>
                                                            <div class="collapse" id="collapseExample3">
                                                                <div class="card card-body rounded-0 py-0 border-0">
                                                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
                                                                        등록
                                                                    </a>
                                                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
                                                                        조회
                                                                    </a>
                                                                    <a class="btn btn-transparent text-start" href="#" style="font-size: small;">
                                                                        이수자관리
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col px-0">
                                                            <p class="d-grid mb-0">
                                                                <button class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button">
                                                                    <div class="row py-2 mx-1">
                                                                        <div class="col text-start">
                                                                            <i class="bi bi-calendar-check"></i>&nbsp;&nbsp;일정관리
                                                                        </div>
                                                                    </div>
                                                                </button>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col px-0">
                                                            <p class="d-grid mb-0">
                                                                <button class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button">
                                                                    <div class="row py-2 mx-1">
                                                                        <div class="col text-start">
                                                                            <i class="bi bi-question-octagon"></i>&nbsp;&nbsp;공지사항
                                                                        </div>
                                                                    </div>
                                                                </button>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-2 pt-4 px-3 border-end">
                                                    <div class="row">
                                                        <div class="col text-center fw-bold" style="font-size: 1.1em;">
                                                            진료환자 리스트
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col">
                                                            <div class="input-group mb-3">
                                                                <input type="text" class="form-control border-0 border-bottom" placeholder="이름을 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2" style="font-size: 0.8em;">
                                                                <button class="btn btn-transparent rounded-0 border-bottom" type="button" id="button-addon2">
                                                                    <i class="bi bi-search" style="font-size: 0.8em;"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <table class="table table-borderless table-hover text-center">
                                                                <thead style="font-size: 0.75em;">
                                                                    <tr>
                                                                        <th scope="col" class="pb-2" style="width: 18%;">번호</th>
                                                                        <th scope="col" class="pb-2">이름</th>
                                                                        <th scope="col" class="pb-2" style="width: 34%;">생년월일</th>
                                                                        <th scope="col" class="pb-2">등급</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody style="font-size: 0.75em;">
                                                                    <c:forEach items="${allClinicPatientInfoList }" var="list">
                                                                    	<tr>
	                                                                        <th scope="row" class="pt-0 pb-1 align-bottom">
	                                                                        	<a href="./clinicPage?clinic_patient_pk=${list.clinicPatientInfo.clinic_patient_pk }" class="link-dark link-underline link-underline-opacity-0">
	                                                                        		${list.clinicPatientInfo.clinic_patient_pk }
	                                                                        	</a>
	                                                                        </th>
	                                                                        <td class="py-1">
	                                                                        	<a href="./clinicPage?clinic_patient_pk=${list.clinicPatientInfo.clinic_patient_pk }" class="link-dark link-underline link-underline-opacity-0">
	                                                                        		${list.clinicPatientInfo.name }
	                                                                        	</a>
	                                                                        </td>
	                                                                        <td class="py-1">
	                                                                        	<a href="./clinicPage?clinic_patient_pk=${list.clinicPatientInfo.clinic_patient_pk }" class="link-dark link-underline link-underline-opacity-0">
	                                                                        		<fmt:formatDate value="${list.clinicPatientInfo.birth }" pattern="yy.MM.dd"/>
	                                                                        	</a>
	                                                                        </td>
	                                                                        <td class="py-1">
	                                                                        	<a href="./clinicPage?clinic_patient_pk=${list.clinicPatientInfo.clinic_patient_pk }" class="link-dark link-underline link-underline-opacity-0">
	                                                                        		${list.classify }
	                                                                        	</a>
	                                                                        </td>
	                                                                    </tr>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col d-grid justify-content-center">
                                                            <nav aria-label="Page navigation example">
                                                                <ul class="pagination mb-0">
                                                                    <li class="page-item">
                                                                        <a class="page-link border-0 text-black" href="#" aria-label="Previous">
                                                                            <span aria-hidden="true">&laquo;</span>
                                                                        </a>
                                                                    </li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-2" href="#" style="font-size: 0.8em;">1</a></li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-2" href="#" style="font-size: 0.8em;">2</a></li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-2" href="#" style="font-size: 0.8em;">3</a></li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-2" href="#" style="font-size: 0.8em;">4</a></li>
                                                                    <li class="page-item my-auto"><a class="page-link border-0 text-black px-2" href="#" style="font-size: 0.8em;">5</a></li>
                                                                    <li class="page-item">
                                                                        <a class="page-link border-0 text-black" href="#" aria-label="Next">
                                                                            <span aria-hidden="true">&raquo;</span>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </nav>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col pt-4 px-4 border-end">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="row">
                                                                        <div class="col fw-bold" style="font-size: 1.1em;">
                                                                            학생정보
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    <table class="table" style="font-size: 0.75em;">
                                                                                        <thead>
                                                                                            <tr>
                                                                                                <th scope="col" style="width: 12%;"></th>
                                                                                                <th scope="col" style="width: 20%;"></th>
                                                                                                <th scope="col" style="width: 12%;"></th>
                                                                                                <th scope="col" style="width: 30%;"></th>
                                                                                                <th scope="col" style="width: 12%;"></th>
                                                                                                <th scope="col"></th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td>이름</td>
                                                                                                <td>${clinicPatientLogInfo.clinicPatientInfoMap.clinicPatientInfo.name }</td>
                                                                                                <td>주민번호</td>
                                                                                                <td>${clinicPatientLogInfo.clinicPatientInfoMap.clinicPatientInfo.resident_id }</td>
                                                                                                <td>생년월일</td>
                                                                                                <td>
                                                                                                	<fmt:formatDate value="${clinicPatientLogInfo.clinicPatientInfoMap.clinicPatientInfo.birth }" pattern="yyyy.MM.dd"/>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>전화번호</td>
                                                                                                <td colspan="3">${clinicPatientLogInfo.clinicPatientInfoMap.clinicPatientInfo.phone }</td>
                                                                                                <td>나이</td>
                                                                                                <td>${clinicPatientLogInfo.clinicPatientInfoMap.clinicPatientInfo.age }</td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>주소</td>
                                                                                                <td colspan="5">${clinicPatientLogInfo.clinicPatientInfoMap.clinicPatientInfo.address }</td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mt-4">
                                                                <div class="col">
                                                                    <div class="row">
                                                                        <div class="col fw-bold" style="font-size: 1.1em;">
                                                                            진료내역
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mt-4">
                                                                        <div class="col overflow-auto" style="height: 29.5em;">
                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    <table class="table table-borderless" style="font-size: 0.75em;">
                                                                                        <thead>
                                                                                            <tr>
                                                                                                <th scope="col" style="width: 15%;" class="py-0"></th>
                                                                                                <th scope="col" style="width: 1%;" class="py-0"></th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <c:forEach items="${clinicPatientLogInfo.clinicPatientLogInfoList }" var="list">
                                                                                            	<tr>
	                                                                                                <td colspan="2" class="fw-bold pb-0">
	                                                                                                	<fmt:formatDate value="${list.clinicPatientLogInfo.created_at }" pattern="yyyy-MM-dd"/>
	                                                                                                </td>
	                                                                                            </tr>
	                                                                                            <tr>
	                                                                                            	<td colspan="2" class="fw-bold pb-0">진료내용</td>
	                                                                                            </tr>
	                                                                                            <tr>
	                                                                                                <td colspan="2" class="text-secondary">
	                                                                                                    ${list.clinicPatientLogInfo.content }
	                                                                                                </td>
	                                                                                            </tr>
	                                                                                            <tr>
	                                                                                            	<td colspan="2" class="pb-1 fw-bold">처방의약품</td>
	                                                                                            </tr>
	                                                                                            <c:forEach items="${list.prescriptionInfoList }" var="prescriptionList">
	                                                                                            	<tr>
		                                                                                                <td class="pb-0">
		                                                                                                    <p class="mb-0 text-secondary">${prescriptionList.medicineName }</p>
		                                                                                                </td>
		                                                                                                <td class="pb-0">
		                                                                                                    <p class="mb-0">${prescriptionList.prescriptionInfo.quantity }</p>
		                                                                                                </td>
		                                                                                            </tr>
	                                                                                            </c:forEach>
                                                                                            </c:forEach>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col py-4 px-4">
                                                    <div class="row">
                                                        <div class="col">
                                                            <form action="./ClinicInfoRegisterProcess">
                                                            	<div class="row">
	                                                                <div class="col">
	                                                                    <div class="row">
	                                                                        <div class="col fw-bold" style="font-size: 1.1em;">
	                                                                            환자정보
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="row">
	                                                                    	<div class="col text-danger" style="font-size: 0.7em">
	                                                                    		외부인 신규환자인 경우 *표시를 모두 채워주세요
	                                                                    	</div>
	                                                                    </div>
	                                                                    <div class="row">
	                                                                        <div class="col">
	                                                                            <div class="row">
	                                                                                <div class="col">
	                                                                                    <table class="table" style="font-size: 0.75em;">
	                                                                                        <thead>
	                                                                                            <tr>
	                                                                                                <th scope="col" style="width: 12%;" class="py-0"></th>
	                                                                                                <th scope="col" style="width: 20%;" class="py-0"></th>
	                                                                                                <th scope="col" style="width: 12%;" class="py-0"></th>
	                                                                                                <th scope="col" style="width: 30%;" class="py-0"></th>
	                                                                                                <th scope="col" style="width: 12%;" class="py-0"></th>
	                                                                                                <th scope="col" class="py-0"></th>
	                                                                                            </tr>
	                                                                                        </thead>
	                                                                                        <tbody class="align-middle">
	                                                                                            <tr>
	                                                                                                <td><span class="text-danger">*</span>이름</td>
	                                                                                                <td>
	                                                                                                    <input name="name" type="text" class="form-control py-1 rounded-0" style="font-size: 0.9em;" value="${clinicPatientLogInfo.clinicPatientInfoMap.clinicPatientInfo.name }">
	                                                                                           </td>
	                                                                                                <td><span class="text-danger">*</span>주민번호</td>
	                                                                                                <td>
	                                                                                                    <div class="input-group">
	                                                                                                        <input name="firstResidentId" type="text" class="form-control py-1 rounded-0" style="font-size: 0.9em;" value="${clinicPatientLogInfo.clinicPatientInfoMap.firstResidentId }">
	                                                                                                        <span class="my-auto">&nbsp;-&nbsp;</span>
	                                                                                                        <input name="secondResidentId" type="text" class="form-control py-1 rounded-0" style="font-size: 0.9em;" value="${clinicPatientLogInfo.clinicPatientInfoMap.secondResidentId }">
	                                                                                                    </div>
	                                                                                                </td>
	                                                                                                <td><span class="text-danger">*</span>생년월일</td>
	                                                                                                <td>
	                                                                                                	<input name="birth" type="date" class="form-control py-1 rounded-0" style="font-size: 0.9em" value="${clinicPatientLogInfo.clinicPatientInfoMap.birth }">
	                                                                                                </td>
	                                                                                            </tr>
	                                                                                            <tr>
	                                                                                                <td><span class="text-danger">*</span>전화번호</td>
	                                                                                                <td colspan="5">
	                                                                                                    <div class="input-group">
	                                                                                                        <input name="firstPhone" type="text" class="form-control py-1 rounded-0" style="font-size: 0.9em;" value="${clinicPatientLogInfo.clinicPatientInfoMap.firstPhone }">
	                                                                                                        <span class="my-auto">&nbsp;-&nbsp;</span>
	                                                                                                        <input name="secondPhone" type="text" class="form-control py-1 rounded-0" style="font-size: 0.9em;" value="${clinicPatientLogInfo.clinicPatientInfoMap.secondPhone }">
	                                                                                                        <span class="my-auto">&nbsp;-&nbsp;</span>
	                                                                                                        <input name="thirdPhone" type="text" class="form-control py-1 rounded-0" style="font-size: 0.9em;" value="${clinicPatientLogInfo.clinicPatientInfoMap.thirdPhone }">
	                                                                                                    </div>
	                                                                                                </td>
	                                                                                            </tr>
	                                                                                            <tr>
	                                                                                                <td><span class="text-danger">*</span>주소</td>
	                                                                                                <td colspan="5">
	                                                                                                    <input name="address" type="text" class="form-control py-1 rounded-0" style="font-size: 0.9em;" value="${clinicPatientLogInfo.clinicPatientInfoMap.clinicPatientInfo.address }">
	                                                                                                </td>
	                                                                                            </tr>
	                                                                                        </tbody>
	                                                                                    </table>
	                                                                                </div>
	                                                                            </div>
	                                                                        </div>
	                                                                    </div>
	                                                                </div>
	                                                            </div>
	                                                            <div class="row mt-2">
	                                                                <div class="col">
	                                                                    <div class="row">
	                                                                        <div class="col fw-bold" style="font-size: 1.1em;">
	                                                                            진료내용
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="row mt-3">
	                                                                        <div class="col">
	                                                                            <div class="row">
	                                                                                <div class="col">
	                                                                                    <textarea name="content" class="form-control rounded-0" rows="10" style="font-size: 0.9em;"></textarea>
	                                                                                </div>
	                                                                            </div>
	                                                                        </div>
	                                                                    </div>
	                                                                </div>
	                                                            </div>
	                                                            <div class="row mt-4">
	                                                                <div class="col">
	                                                                    <div class="row">
	                                                                        <div class="col fw-bold" style="font-size: 1.1em;">
	                                                                            처방의약품
	                                                                        </div>
	                                                                        <div class="col d-grid justify-content-end">
	                                                                        	<button onclick="clonePrescription()" type="button" class="text-danger btn btn-transparent py-0" style="font-size: 1.1em;">+</button>
	                                                                        </div>
	                                                                    </div>
	                                                                    <div class="row mt-2">
	                                                                        <div id="prescriptionListBox" class="col">
	                                                                            
	                                                                        </div>
	                                                                        <input name="prescriptionCount" id="prescriptionCount" type="hidden">
	                                                                    </div>
	                                                                </div>
	                                                            </div>
	                                                            <div class="row mt-4">
	                                                                <div class="col">
	                                                                    <div class="row">
	                                                                        <div class="col d-grid">
	                                                                            <button type="submit" class="btn text-white rounded-0 fw-bold" style="font-size: 0.8em; background-color: #014195;">저장하기</button>
	                                                                        </div>
	                                                                    </div>
	                                                                </div>
	                                                            </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <div class="col py-4" style="background-color: #F2F2F2;">
                                    <div class="row" style="margin-left: 16%; margin-right: 16%;">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1 my-auto">
                                                    <img class="img-fluid" src="../../resources/img/another/logo_black.png">
                                                </div>
                                                <div class="col-3 ps-0 my-auto" style="font-size: x-large">
                                                    MK University | 보건센터
                                                </div>
                                                <div class="col text-body-tertiary my-auto" style="font-size: small;">
                                                    <p class="my-0">서울특별시 강남구 테헤란로7길 7 에스코빌딩 6~7층&emsp;전화 : 02&#41;561-1911&emsp;팩스 : 02&#41;561-1911</p>
                                                    <p class="my-0">COPYRIGHT&#40;C&#41; University of Seoul ALL RIGHTS RESERVED.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div id="templete" class="d-none">
        	<div class="prescriptionWrapper row mt-1">
		        <div class="col">
		            <select name="medicineCodePkList" class="form-control rounded-0" style="font-size: 0.8em;">
		                <option class="active">처방할 의약품을 선택해주세요</option>
		                <c:forEach items="${medicineInfoList }" var="list">
		                	<option value="${list.medicine_code_pk }">${list.medicine_code_pk }&nbsp;${list.name }</option>
		                </c:forEach>
		            </select>
		        </div>
		        <div class="col-2">
		            <input name="quantityList" type="number" class="form-control rounded-0" style="font-size: 0.8em;" value="1" min="1">
		        </div>
		    </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>