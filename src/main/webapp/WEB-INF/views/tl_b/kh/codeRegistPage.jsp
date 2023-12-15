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
        
        <style>
        .customColor {
            border-radius: 0%;
            color: white;
            background-color: #014195;
            }
        .ellipsis-container {
            width: 17.5%; /* 예제로 설정한 너비 */
            white-space: nowrap; /* 텍스트가 한 줄로 나타나도록 설정 */
            overflow: hidden; /* 너비를 벗어나는 부분을 숨김 */
            text-overflow: ellipsis; /* 초과된 텍스트를 ...으로 대체 */
        	}
   		</style>
        <script>
            
            function formSubmit(){
                const frm = document.getElementById("frm");

                if(isCheckedMedicineCodePk == false){
                    alert("중복된 의약품 코드는 사용하실 수 없습니다.");
                    return;
                }

                const medicineCategoryWrapper = document.querySelector("#medicineCategoryWrapper");
                
                if(medicineCategoryWrapper.value === '약품카테고리'){
                    alert("약품 카테고리를 선택해주세요");
                    return;
                }

                const nameCheck = document.querySelector("#nameCheck");
                if(nameCheck.value.trim() === ""){
                    alert("제품명을 입력해주세요.");
                    nameCheck.focus();
                    return;
                }
                const companyCheck = document.querySelector("#companyCheck");
                if(companyCheck.value.trim() === ""){
                    alert("회사명을 입력해주세요.");
                    companyCheck.focus();
                    return;
                }
                const efficacyCheck = document.querySelector("#efficacyCheck");
                if(efficacyCheck.value.trim() === ""){
                    alert("효능을 입력해주세요.");
                    efficacyCheck.focus();
                    return;
                }
                const precautionCheck = document.querySelector("#precautionCheck");
                if(precautionCheck.value.trim() === ""){
                    alert("주의사항을 입력해주세요.");
                    precautionCheck.focus();
                    return;
                }

                console.log("aaa");
                frm.submit();
            }

            function orderedByMedicineList(){

                const url = "./orderedByMedicineList";

                fetch(url)
                .then(response => response.json())
                .then(response => {
                    
                    const allMedicineInfoLocation = document.querySelector(".allMedicineInfoLocation");
                    allMedicineInfoLocation.innerHTML = "";
                    
                    for(e of response.data){

                        const medicineWrapper = document.querySelector("#templete .medicineWrapper").cloneNode(true);

                        const medicinecodeNumber = medicineWrapper.querySelector(".medicinecodeNumber");
                        medicinecodeNumber.innerText = e.medicineInfo.medicine_code_pk;

                        const medicineName = medicineWrapper.querySelector(".medicineName");
                        medicineName.innerText = e.medicineInfo.name;

                        const medicineKind = medicineWrapper.querySelector(".medicineKind");
                        medicineKind.innerText = e.medicineCatInfo.name;

                        const medicineCompany = medicineWrapper.querySelector(".medicineCompany");
                        medicineCompany.innerText = e.medicineInfo.company;

                        const medicineEfficacy = medicineWrapper.querySelector(".medicineEfficacy");
                        medicineEfficacy.innerText = e.medicineInfo.efficacy;

                        const medicineprecaution = medicineWrapper.querySelector(".medicineprecaution");
                        medicineprecaution.innerText = e.medicineInfo.precaution;
                        medicineprecaution.setAttribute("onclick", "showDetailPrecaution(this, "+e.medicineInfo.medicine_code_pk+")");

                        const medicineCreatedAt = medicineWrapper.querySelector(".medicineCreatedAt");
                        const date = new Date(e.medicineInfo.created_at);
                        medicineCreatedAt.innerText = date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate();

                        const medicineDelete = medicineWrapper.querySelector(".medicineDelete");
                        medicineDelete.setAttribute("onclick", "deleteMedicine(this, "+e.medicineInfo.medicine_code_pk+")");

                        allMedicineInfoLocation.appendChild(medicineWrapper);
                    
                    }
                    
                });

            }

            
            //카테고리 리스트
            function reloadMedicineCategoryInfo(){
                const url = "./getCategoryInfo"

                fetch(url)
                .then(response => response.json())
                .then(response => {

                    const medicineCategoryWrapper = document.querySelector("#medicineCategoryWrapper");
                    medicineCategoryWrapper.innerHTML = "";
                    
                    const defaultOption = document.createElement("option");
                    defaultOption.setAttribute("selected", "");
                    defaultOption.innerText = "약품카테고리";
                    medicineCategoryWrapper.appendChild(defaultOption);

                    for (e of response.data) {
                        
                        const option = document.createElement("option");
                        option.setAttribute("value", ""+e.medicine_cat_pk+"");
                        option.innerText = e.name;

                        medicineCategoryWrapper.appendChild(option);
                    }
                })
            }

            //약품삭제
            function deleteMedicine(targerElement, medicine_code_pk){
                console.log(medicine_code_pk);

                const url = "./deletMedicineInfo?medicine_code_pk="+medicine_code_pk;

                fetch(url)
                .then(response => response.json())
                .then(response => {
                    orderedByMedicineList(1);
                })
            }
            //의약품코드 중복 체크

            let isCheckedMedicineCodePk = false;

            function checkMedicineCodePk(){
                const check_medicine_code_pk = document.querySelector("#check_medicine_code_pk").value;

                const url = "./existMedicineInfo?medicine_code_pk=" + check_medicine_code_pk;
                fetch(url)
                .then(response => response.json())
                .then(response => {

                    if(response.data == true){

                        isCheckedMedicineCodePk = false;
                    
                        const checkCodePkBox = document.getElementById("checkCodePkBox");
                        checkCodePkBox.innerText = "※ 중복된 코드";
                        checkCodePkBox.style.color = "red";
                    }else{

                        isCheckedMedicineCodePk = true;
                        const checkCodePkBox = document.getElementById("checkCodePkBox");
                        checkCodePkBox.innerText = "※ 사용가능";
                        checkCodePkBox.style.color = "green";

                    }
                });
            }

            ///////////////////////////////////////////////////////////////

            function orderedByMedicineList(obj){

                console.log(obj);
                const url = "./orderedByMedicineList?orderNumber="+obj;

                fetch(url)
                .then(response => response.json())
                .then(response => {
                    
                    const allMedicineInfoLocation = document.querySelector(".allMedicineInfoLocation");
                    allMedicineInfoLocation.innerHTML = "";
                    
                    for(e of response.data){

                        const medicineWrapper = document.querySelector("#templete .medicineWrapper").cloneNode(true);

                        const medicinecodeNumber = medicineWrapper.querySelector(".medicinecodeNumber");
                        medicinecodeNumber.innerText = e.medicineInfo.medicine_code_pk;

                        const medicineName = medicineWrapper.querySelector(".medicineName");
                        medicineName.innerText = e.medicineInfo.name;

                        const medicineKind = medicineWrapper.querySelector(".medicineKind");
                        medicineKind.innerText = e.medicineCatInfo.name;

                        const medicineCompany = medicineWrapper.querySelector(".medicineCompany");
                        medicineCompany.innerText = e.medicineInfo.company;

                        const medicineEfficacy = medicineWrapper.querySelector(".medicineEfficacy");
                        medicineEfficacy.innerText = e.medicineInfo.efficacy;

                        const medicineprecaution = medicineWrapper.querySelector(".medicineprecaution");
                        medicineprecaution.innerText = e.medicineInfo.precaution;
                        medicineprecaution.setAttribute("onclick", "showDetailPrecaution(this, "+e.medicineInfo.medicine_code_pk+")");

                        const medicineCreatedAt = medicineWrapper.querySelector(".medicineCreatedAt");
                        const date = new Date(e.medicineInfo.created_at);
                        medicineCreatedAt.innerText = date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate();

                        const medicineDelete = medicineWrapper.querySelector(".medicineDelete");
                        
                        medicineDelete.setAttribute("onclick", "deleteMedicine(this, "+e.medicineInfo.medicine_code_pk+")");

                        allMedicineInfoLocation.appendChild(medicineWrapper);
                    
                    }
                    
                });

                }

                //////////////////////////////////////////////////////////////////////

            window.addEventListener("DOMContentLoaded", () => {
            	orderedByMedicineList(1);
                reloadMedicineCategoryInfo();
            });

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
                            	<jsp:include page="../commonJsp/staffSideBar.jsp"></jsp:include>
                                <div class="col">
                                    <!-- 내가 쓸꺼!!-->
                                    <div class="row mx-3 my-5">
                                        <div class="col">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="fw-bold">&lt;의약품 현황&gt;</div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-10"></div>
                                                    <div class="col-2 text-end">
                                                        <select id="orderByMedicineInfo" class="form-select rounded-0" aria-label="Default select example" 
                                                        onchange="orderedByMedicineList(this.value)">
                                                            <option value="1">등록일순(최신순)</option>
                                                            <option value="2">등록일순(오래된순)</option>
                                                            <option value="3">코드번호</option>
                                                            <option value="4">약품종류</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="row mt-3 mb-1 pb-3 fw-bold text-center border-bottom border-3 border-primary">
                                                    <div class="col-1 border-end border-primary">코드번호</div>
                                                    <div class="col-1 border-end border-primary">의약품명</div>
                                                    <div class="col-1 border-end border-primary">약품종류</div>
                                                    <div class="col-2 border-end border-primary">회사</div>
                                                    <div class="col-2 border-end border-primary">효능</div>
                                                    <div class="col-2 border-end border-primary">주의사항</div>
                                                    <div class="col border-end">등록일</div>
                                                    <div class="col">삭제</div>
                                                </div>
                                                <div class="row mt-1 allMedicineInfoLocation">
                                                    <!-- 여기에 반복문 나와야함-->
                                                </div>
                                                
                                                <%-- 약품등록 라인 --%>
                                                
                                                <div class="row">
                                                    <form id="frm" action="./codeRegistProcess" method="get">
                                                    <div class="col">
                                                        <div class="row mt-3">
                                                            <div class="col-2">
                                                                <div class="input-group mb-3">
                                                                    <span class="input-group-text customColor" id="basic-addon1">코드번호</span>
                                                                    <input onblur="checkMedicineCodePk()" id="check_medicine_code_pk" name="medicine_code_pk" type="text" class="form-control rounded-0">
                                                                </div>
                                                            </div>
                                                            <div class="col-2">
                                                                <div id="checkCodePkBox" class="input-group mb-3 form-control border border-0">
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="input-group mb-3">
                                                                    <span class="input-group-text btn-primary customColor" id="basic-addon1">의약품명</span>
                                                                    <input id="nameCheck" name="name" type="text" class="form-control rounded-0">
                                                                </div>
                                                            </div>
                                                            <div class="col-4 d-grid">
                                                                <input type="button" onclick="formSubmit()" class="btn btn-primary customColor" value="등록하기">
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <select id="medicineCategoryWrapper" name="medicine_cat_pk" class="form-select rounded-0" aria-label="Default select example">
                                                                	<!-- 카테고리 반복문 들어갈곳 -->
                                                                </select>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="input-group mb-3">
                                                                    <span class="input-group-text customColor" id="basic-addon1">회사</span>
                                                                    <input id="companyCheck" name="company" type="text" class="form-control rounded-0" placeholder="" aria-label="" aria-describedby="basic-addon1">
                                                                  </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <div class="input-group mb-3">
                                                                    <span class="input-group-text customColor" id="basic-addon1">효능</span>
                                                                    <input id="efficacyCheck" name="efficacy" type="text" class="form-control rounded-0" placeholder="" aria-label="" aria-describedby="basic-addon1">
                                                                  </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <div class="input-group mb-3">
                                                                    <span class="input-group-text customColor" id="basic-addon1">주의사항</span>
                                                                    <input id="precautionCheck" name="precaution" type="text" class="form-control rounded-0"  placeholder="" aria-label="" aria-describedby="basic-addon1">
                                                                  </div>
                                                            </div>
                                                        </div>
                                                    
                                                    </div>
                                                	</form>    
                                                </div>
                                                
                                                <%-- 약품  --%>
                                            </div>

                                    <!-- 내가 쓸꺼!!-->
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
                                                <div class="col-4 my-auto">
                                                    <img class="img-fluid" src="./img/health/health_ci.gif">
                                                </div>
                                                <div class="col text-body-tertiary" style="font-size: small;">
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
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script>
	        const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
	        const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
        </script>

        <div id = "templete" class="d-none">
            <div class="row mt-3 medicineWrapper text-center border-bottom pb-3 border-primary">
                <div class="col-1 medicinecodeNumber ">코드번호</div>
                <div class="col-1 medicineName">의약품명</div>
                <div class="col-1 medicineKind">약품종류</div>
                <div class="col-2 medicineCompany ellipsis-container">회사</div>
                <div class="col-2 medicineEfficacy ellipsis-container">효능</div>
                <div class="col-2 medicineprecaution ellipsis-container">주의사항</div>
                <div class="col medicineCreatedAt text-left">등록일</div>
                <div class="col text-right">&nbsp;&nbsp;&nbsp;&nbsp;
                	<i class="medicineDelete py-0 px-0 btn bi bi-x-square text-danger"></i>
                </div>
            </div>

            <%-- 이부분은 임시.. 귀찮아서 일단 번호로 해버림 --%>
            <option class="medicineCategoryInfo">알러지</option>


        </div>
    </body>
</html>