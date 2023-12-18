<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
       	<style>
		    .custom-popover {
		        white-space: pre-line;
		    }
	        .customColor {
	            border-radius: 0%;
	            color: white;
	            background-color: #014195;
	        }
		</style>

        <script>
        
    	type="text/javascript" src="../../resources/js/hn/sideBar.js"

            function addInfoSubmit(){

                const addInfoSubmit = document.getElementById("addInfoSubmit");

                const addMedicineInfo = document.querySelector("#addMedicineInfo");
                
                if(addMedicineInfo.value === '의약품종류'){
                    alert("의약품종류를 선택해 주세요");
                    return;
                }
                const addQuantity = document.querySelector("#addQuantity");
                if(addQuantity.value.trim() === ""){
                    alert("수량을 입력해주세요.");
                    addQuantity.focus();
                    return;
                }
                const maxDate = document.querySelector("#maxDate");
                if(!maxDate.value){
                    alert("정확한 입고일을 입력해주세요.");
                    maxDate.focus();
                    return;
                }

                addInfoSubmit.submit();
                orderDate(1);

            }

            let maxToday = null;

            // 오늘 날짜를 YYYY-MM-DD 형식으로 가져오는 함수
            function getToday() {
                const today = new Date();
                const dd = String(today.getDate()).padStart(2, '0');
                const mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
                const yyyy = today.getFullYear();
                return yyyy + '-' + mm + '-' + dd;
            }


            // const dateInput = document.querySelector("#maxDate");
            // dateInput.setAttribute("max", ""+getToday()+"");


            let aa = null;
            function reloadAddinfo(){
                
                const url = "./getAddInfo";

                fetch(url)
                .then(response => response.json())
                .then(response => {

                const allAddInfoLocation = document.querySelector(".allAddInfoLocation");
                allAddInfoLocation.innerHTML = "";

                for (e of response.data){
                    const addWrapper = document.querySelector("#templete .addWrapper").cloneNode(true);

                    const addNumber = addWrapper.querySelector(".addNumber");
                    addNumber.innerHTML = e.addInfo.medicine_add_pk;

                    const medicineName = addWrapper.querySelector(".medicineName");
                    medicineName.innerHTML = e.medicineInfo.name;

                    const addQuantity = addWrapper.querySelector(".addQuantity");
                    addQuantity.innerHTML = e.addInfo.quantity;

                    const addPerson = addWrapper.querySelector(".addPerson");
                    addPerson.innerHTML = e.staffInfo.name;

                    const addDate = addWrapper.querySelector(".addDate");
                    const date = new Date(e.addInfo.add_at);
                    addDate.innerHTML = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();

                    allAddInfoLocation.appendChild(addWrapper);

                }


                });

            }       

            function orderDate(obj){
                console.log(obj)
                const url = "./restGetAddInfo?orderDate="+obj;

                fetch(url)
                .then(response => response.json())
                .then(response => {

                const allAddInfoLocation = document.querySelector(".allAddInfoLocation");
                allAddInfoLocation.innerHTML = "";

                for (e of response.data){
                    const addWrapper = document.querySelector("#templete .addWrapper").cloneNode(true);

                    const addNumber = addWrapper.querySelector(".addNumber");
                    addNumber.innerHTML = e.addInfo.medicine_add_pk;

                    const medicineName = addWrapper.querySelector(".medicineName");
                    medicineName.innerHTML = e.medicineInfo.name;

                    const addQuantity = addWrapper.querySelector(".addQuantity");
                    addQuantity.innerHTML = e.addInfo.quantity;

                    const addPerson = addWrapper.querySelector(".addPerson");
                    addPerson.innerHTML = e.staffInfo.name;

                    const addDate = addWrapper.querySelector(".addDate");
                    const date = new Date(e.addInfo.add_at);
                    addDate.innerHTML = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();

                    //모달 부분
                    const showAddModal = addWrapper.querySelector(".showAddModal");
                    showAddModal.innerHTML = "";
                    const addApplybutton = document.querySelector("#templete #addApplybutton").cloneNode(true);
                    addApplybutton.setAttribute("data-bs-target","#"+e.medicineInfo.name+"");
                    addApplybutton.setAttribute("onclick","reloadAddMedicineInfo()")
                    const modalWrapper = document.querySelector(".modalWrapper").cloneNode(true);
                    modalWrapper.setAttribute("id",""+e.medicineInfo.name+"");
                    
                    const modalBody = modalWrapper.querySelector(".modal-body");
                    modalBody.innerText = "";
                    // const addMedicineName = document.querySelector("#addMedicineName");
                    // addMedicineName.innerText = "";
                    // addMedicineName.innerText = e.medicineInfo.name;
                    showAddModal.appendChild(addApplybutton);
                    showAddModal.appendChild(modalWrapper);

                    //신청양식 불러오기
                    const addApplyForm = document.querySelector("#addApplyForm").cloneNode(true);
                    modalBody.appendChild(addApplyForm);

                    const addMedicineInfo = addApplyForm.querySelector("#addMedicineInfo");
                    
                    





                    allAddInfoLocation.appendChild(addWrapper)

                }


                });
            }

            function reloadAddMedicineInfo(){

                //문제있음 쿼리셀렉터로 선택해서 그런지 맨앞에밖에 입고안됨 ㅋㅋ

                const url = "./reloadAddMedicineInfo"

                fetch(url)
                .then(response => response.json())
                .then(response => {

                    const addMedicineInfo = document.querySelector("#addMedicineInfo");
                    addMedicineInfo.innerHTML = "";

                    const defaultOption = document.createElement("option");
                    defaultOption.setAttribute("selected","");
                    defaultOption.innerText = "의약품종류";
                    addMedicineInfo.appendChild(defaultOption);

                    for(e of response.data){
                        
                        const option = document.createElement("option");
                        option.setAttribute("value", ""+e.medicine_code_pk+"");
                        option.innerText = e.name;
                        addMedicineInfo.appendChild(option);


                    }

                })

            }

            function reloadCheckBoxName(){

                const url = "./getMedicineList";

                const checkBoxNameStation = document.querySelector("#checkBoxNameStation");

                fetch(url)
                .then(response => response.json())
                .then(response => {

                    for(e of response.data){

                        const checkBoxName = document.querySelector("#templete .checkBoxName").cloneNode(true);

                        const checkBoxNameValue = checkBoxName.querySelector(".checkBoxNameValue");
                        checkBoxNameValue.setAttribute("value",""+e.medicineInfo.medicine_code_pk+"");
                        checkBoxNameValue.setAttribute("id","linkFor"+e.medicineInfo.medicine_code_pk+"")
                        const checkBoxNameLabel = checkBoxName.querySelector(".checkBoxNameLabel");
                        checkBoxNameLabel.setAttribute("for","linkFor"+e.medicineInfo.medicine_code_pk+"");
                        checkBoxNameLabel.innerText = e.medicineInfo.name;

                        checkBoxNameStation.appendChild(checkBoxName);

                        console.log(e.medicineInfo.name);

                    }
                })
            };


            window.addEventListener("DOMContentLoaded", () => {
                // reloadAddinfo();
                orderDate(1);
                // reloadAddMedicineInfo();
                reloadCheckBoxName();
                const maxToday = getToday(); // 오늘 날짜를 가져옴
                document.getElementById('maxDate').setAttribute('max', maxToday); // max 속성을 동적으로 설정
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
                                <div class="col pb-5">
                                    <!-- 내가 쓸꺼!!-->
                                    <div class="row mx-3 my-5">
                                        <div class="col">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="fw-bold">&lt;입고 관리&gt;</div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <div id="checkBoxNameStation" class="row my-3">
                                                            
                                                        </div>
                                                        <div class="row">
                                                            <div class="col text-end">
                                                            
                                                                <input onchange="orderDate(this.value)" name="orderDate" type="radio" value="1">최신순
                                                                <input onchange="orderDate(this.value)" name="orderDate" type="radio" value="2">오래된순
                                                                
                                                            </div>
                                                        </div>
                                                        <div class="row mt-3 mb-1 pb-3 fw-bold text-center border-bottom border-3 border-primary">
                                                            <div class="col-2 border-end border-primary">입고번호</div>
                                                            <div class="col-2 border-end border-primary">의약품이름</div>
                                                            <div class="col-2 border-end border-primary">수량</div>
                                                            <div class="col-2 border-end border-primary">입고자</div>
                                                            <div class="col-2 border-primary">입고일</div>
                                                            <div class="col-2">입고하기</div>
                                                        </div>
                                                        <div class="mt-1 allAddInfoLocation">
                                                            <!-- 여기에 반복문 나와야함-->
                                                        </div>
                                                    </div>
                                                    
                                                    
                                                        
                                                </div>
                                                <div class="row my-3">
                                                    <div class="col">
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                    <!-- 내가 쓸꺼!!-->



                                    


                                    

                                </div>
                            </div>
                        </div>
                    </div>
                    <jsp:include page="../commonJsp/staffBottomBanner.jsp"></jsp:include>
                </div>
            </div>
        </div>
        

        <div id = "templete" class="d-none">
            <div class="row my-3 py-3 addWrapper text-center border-bottom border-primary ">
                <div class="col-2 addNumber align-items-center">입고번호</div>
                <div class="col-2 medicineName">의약품이름</div>
                <div class="col-2 addQuantity">수량</div>
                <div class="col-2 addPerson">입고자</div>
                <div class="col-2 addDate">입고일</div>
                <div class="col-2 pb-3 showAddModal">
                </div>
            </div>

            <button id="addApplybutton" type="button" class="btn btn-sm btn-outline-primary customColor" data-bs-toggle="modal" data-bs-target="#abc">
                입고하기
            </button>

            <!-- Modal --> 
              
              <div class="modal fade modalWrapper" id="abc" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h1 class="modal-title fs-5 text-center fw-bold" id="exampleModalLabel">의약품 입고</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary rounded-0" data-bs-dismiss="modal">취소</button>
                    </div>
                  </div>
                </div>
              </div>


              <!-- 신청 폼 -->
              <div id="addApplyForm" class="col">
                <form id="addInfoSubmit" action="./medicineAddProcess" method="get">
                <div class="row">
                    <div class="col text-center">
                        <span id="addMedicineName" class="fw-bold "></span>
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col">
                        <select id="addMedicineInfo" name="medicine_code_pk" class="form-select rounded-0" aria-label="Default select example">
                            <!--약품 카테고리 반복문 나오는곳 -->
                        </select>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-3">
                        <span class="form-control border border-0">수량 : </span>
                    </div>
                    <div class="col">
                        <input id="addQuantity" class="rounded-0 form-control" name="quantity" type="number" min="1" max="10">
                    </div>
                    <div class="col-auto">
                        <span class="form-control text-danger border border-0">※최대 10개</span>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-3">
                        <span class="form-control border border-0">입고일:</span>
                    </div>
                    <div class="col">
                        <input id="maxDate" class="rounded-0 form-control" name="add_at" type="date">
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col d-grid">
                        <input type="button" class="btn btn-secondary customColor" onclick="addInfoSubmit()" value="입고하기">
                    </div>
                </div>
                </form>
            </div>

            <!-- checkBoxName 템플릿 -->
            <div class="col-2 checkBoxName">
                <div class="form-check">
                    <input class="checkBoxNameValue form-check-input" type="checkbox" value="" id="a"   >
                    <label class="checkBoxNameLabel form-check-label" for="a">
                        checkbox
                    </label>
                </div>
            </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script>
	    const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
	    const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
	    </script>
    </body>
</html>