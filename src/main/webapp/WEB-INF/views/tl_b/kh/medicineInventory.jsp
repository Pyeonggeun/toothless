<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        </style>

        <script>

            function getStaffInfo(){
                const url = "./getStaffInfo"

                fetch(url)
                .then(response => response.json())
                .then(response => {
                    const staff_pk = response.data.staff_pk;
                    const staffPk = document.getElementById("staffPk");
                    staffPk.setAttribute("value",""+staff_pk+"");
                })
            }
        
            let name = null;

            function frmInventoryModify(){

                const changeInventory = document.getElementById("changeInventory")
                if(changeInventory.value === '의약품명'){
                    alert("의약품을 선택해야만 재고수정을 할 수 있습니다!");
                    changeInventory.focus();
                    return;
                }
                

                const frmInventoryModify = document.getElementById("frmInventoryModify");
                if(name == null){
                    alert("관리하실 분야를 선택해주세요.");
                    return;
                }
                const inputQuantity = document.getElementById("inputQuantity");
                const inputValue = parseInt(inputQuantity.value,10);
                if((inputValue + sum) < 0){
                    alert("보유재고보다 많은량을 변경할 수는 없습니다.");
                    inputQuantity.focus();
                    return;
                }else if(inputValue == 0){
                    alert("개수를 입력해주세요.");
                    inputQuantity.focus();
                    return;
                }
                const inputReason = document.getElementById("inputReason");
                if(inputReason.value == ""){
                    alert("비고란을 입력해주세요");
                    inputReason.focus();
                    return;
                }
                
                frmInventoryModify.submit();
            }
            function reloadInventoryInfo(){
                const url = "./inventoryStatistics"

                fetch(url)
                .then(response => response.json())
                .then(response => {

                   
                })
            }

            function orderByInventoryInfo(obj){
                const url = "./reloadInventoryInfo?orderNumber="+obj;

                console.log(obj);

                fetch(url)
                .then(response => response.json())
                .then(response => {

                    const allInventoryLocation = document.querySelector(".allInventoryLocation");
                    allInventoryLocation.innerHTML = "";

                    for(e of response.data){
                        const inventoryWrapper = document.querySelector("#templete .inventoryWrapper").cloneNode(true);

                        const MEDICINE_CODE_PK = inventoryWrapper.querySelector(".MEDICINE_CODE_PK");
                        MEDICINE_CODE_PK.innerHTML = e.MEDICINE_CODE_PK;

                        const MEDI_NAME = inventoryWrapper.querySelector(".MEDI_NAME");
                        MEDI_NAME.innerHTML = e.MEDI_NAME;

                        const M_TYPE = inventoryWrapper.querySelector(".M_TYPE");
                        M_TYPE.innerHTML = e.M_TYPE;

                        const QUANTITY = inventoryWrapper.querySelector(".QUANTITY");
                        QUANTITY.innerHTML = e.QUANTITY;

                        // const isQuantity = inventoryWrapper.querySelector(".isQuantity");
                        // if(e.isQuantity === undefined){
                        // isQuantity.innerHTML = "";
                        // }

                        const M_NAME = inventoryWrapper.querySelector(".M_NAME");
                        M_NAME.innerHTML = e.M_NAME;

                        const DATE = inventoryWrapper.querySelector(".DATE");
                        const date = new Date(e.DATE)
                        DATE.innerHTML = date.getFullYear() + "/" + (date.getMonth()+1) + "/" + date.getDate();

                        allInventoryLocation.appendChild(inventoryWrapper);
                    }
                });
            }

            function changeInventoryInfo(){

                const url = "./restGetMedicineList";

                fetch(url)
                .then(response => response.json())
                .then(response => {

                    const changeInventory = document.querySelector("#changeInventory");
                    changeInventory.innerHTML = "";
                    
                    const defaultOption = document.createElement("option");
                    defaultOption.setAttribute("selected","");
                    defaultOption.innerText = "의약품명";
                    changeInventory.appendChild(defaultOption);

                    for (e of response.data){

                        const option = document.createElement("option");
                        option.setAttribute("value", ""+e.medicineInfo.medicine_code_pk+"");
                        option.innerText = e.medicineInfo.name;
                        changeInventory.appendChild(option);
                        

                    }

                });
            }
            let sum = 0;
            function getMedicineCodePk(medicine_code_pk){

                const inputCodePk = document.querySelector("#inputCodePk");
                inputCodePk.innerText="";
                inputCodePk.innerText=""+medicine_code_pk+"";
                inputCodePk.value = medicine_code_pk;

                const url = "./restInventoryInfoByPk?medicine_code_pk="+medicine_code_pk;

                
                fetch(url)
                .then(response => response.json())
                .then(response => {
                    sum = 0;
                    for(e of response.data){
                        sum += e.QUANTITY;
                    }

                    const nowQuantity = document.querySelector(".nowQuantity");
                    nowQuantity.innerText = "남은수량 : " + sum;
                })
            }
            //재고카테고리 가져오기
            function reloadInventoryCat(){

                const url = "./reloadInventoryCat";

                fetch(url)
                .then(response => response.json())
                .then(response => {

                    const medicineMgmtCatPk = document.querySelector("#medicineMgmtCatPk");
                    medicineMgmtCatPk.innerHTML = "";
                    
                    const defaultOption = document.createElement("option");
                    defaultOption.setAttribute("selected","");
                    defaultOption.innerText = "재고관리";
                    medicineMgmtCatPk.appendChild(defaultOption);

                    for (e of response.data){

                        const option = document.createElement("option");
                        option.setAttribute("value", ""+e.medicine_mgmt_cat_pk+"");
                        option.innerText = e.name;
                        medicineMgmtCatPk.appendChild(option);
                        

                    }

                });
            }

            function getCatValue(element){

                console.log(element);
                getCatMgmtName(element); //이게 이름이댐


            }

            function getCatMgmtName(catMgmtPk){

                const url = "./getMedicineMgmtCatInfoByPk?medicine_mgmt_cat_pk=" + catMgmtPk;

                fetch(url)
                .then(response => response.json())
                .then(response => {
                    const list = response.data;
                    name = list.name;
                    limitQuantity();
                });
                
            }

            function limitQuantity(){
                const inputQuantity = document.getElementById("inputQuantity");
                

                if (name === '폐기' || name === '망실') {
                    inputQuantity.setAttribute("min", "-5");
                    inputQuantity.setAttribute("max", "-1");
                    inputQuantity.value = -1 ;
                } else if (name === '조정') {
                    inputQuantity.setAttribute("min", "-5");
                    inputQuantity.setAttribute("max", "5");
                    inputQuantity.value = 1 ;
              }
            }

            window.addEventListener("DOMContentLoaded", () => {
                orderByInventoryInfo(1);
                changeInventoryInfo();
                reloadInventoryCat();
                getStaffInfo();
            });
        </script>
    <script type="text/javascript" src="../../resources/js/hn/sideBar.js"></script>
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
                                            <div class="row py-3 border-bottom border-primary">
                                            	<div class="col">
	                                            	<div class="row mb-3 ">
	                                                    <div class="col text-center">
	                                                        <div class="fw-bold">&lt;재고 수정&gt;</div>
	                                                    </div>
	                                                </div>
	                                                
	                                                <form id="frmInventoryModify" action="./inventoryModifyProcess" method="get">
	                                                <div class="row ">
	                                                    <div class="col">
	                                                    	<select id="changeInventory" name="medicine_code_pk" class="form-select rounded-0" aria-label="Default select example"
                                                                onchange="getMedicineCodePk(this.value)">
                                                                <!-- <option selected>의약품명</option>
                                                                <option value="1">변동일(최신순)</option>
                                                                <option value="2">변동일(오래된순)</option>
                                                                <option value="3">의약품순</option>
                                                                <option value="4">변동사유순</option> -->
                                                            </select>
	                                                    </div>
	                                                    <div class="col">
	                                                    	<div class="input-group mb-3">
															  <span class="input-group-text customColor" id="basic-addon1">코드번호</span>
															  <span id="inputCodePk" type="text" class="form-control rounded-0" placeholder="코드번호" aria-describedby="basic-addon1"></span>
															</div>
	                                                    </div>
	                                                    <div class="col">
	                                                    	<div class="input-group mb-3">
															  <span class="input-group-text customColor" id="basic-addon1">변경수량</span>
															  <input id="inputQuantity" name="quantity" type="number" class="form-control rounded-0" placeholder="변경수량" aria-label="Username" aria-describedby="basic-addon1" min="-5" max="5">
															</div>
                                                            <div class="row">
                                                                <div class="nowQuantity col text-center text-danger">
                                                                </div>
                                                            </div>
	                                                    </div>
	                                                    <div class="col">
	                                                    <select id="medicineMgmtCatPk" name="medicine_mgmt_cat_pk" class="form-select rounded-0" aria-label="Default select example"
                                                        onchange="getCatValue(this.value)">
														    <%-- 재고 카테고리 들어가는곳 --%>
														</select>
	                                                    </div>
	                                                    <div class="col">
	                                                    	<div class="input-group mb-3">
															  <span class="input-group-text customColor" id="basic-addon1">비고</span>
															  <input id="inputReason" name="reason" type="text" class="form-control rounded-0" placeholder="비고" aria-label="Username" aria-describedby="basic-addon1" value="">
															</div>
	                                                    </div>
	                                                    <div class="col">
	                                                    	<input type="button" class="btn btn-secondary customColor" onclick="frmInventoryModify()" value="수정하기">
	                                                    </div>
                                                        <input id="staffPk" type="hidden" name="staff_pk" >
	                                                </div>
	                                                </form>
                                            	
                                            	</div>
                                            </div>
                                                
                                                
                                                
                                                <div class="row my-3">
                                                    <div class="col">
                                                        <div class="fw-bold text-center">&lt;재고 변동 현황&gt;</div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-10"></div>
                                                    <div class="col-2 text-end">
                                                    	<select id="orderByInventoryInfo" class="form-select rounded-0" aria-label="Default select example"
                                                        onchange="orderByInventoryInfo(this.value)">
														  <option value="1">변동일(최신순)</option>
														  <option value="2">변동일(오래된순)</option>
														  <option value="3">의약품순</option>
														  <option value="4">변동사유순</option>
														</select>
                                                    </div>
                                                </div>
                                                <div class="container">
	                                                <div class="row mt-3 mb-1 pb-3 fw-bold text-center border-bottom border-3 border-primary">
	                                                    <div class="col-2 border-end border-primary">약품코드</div>
	                                                    <div class="col-2 border-end border-primary">의약품명</div>
	                                                    <div class="col-2 border-end border-primary">변동사유</div>
	                                                    <div class="col-2 border-end border-primary">변동수량</div>
	                                                    <div class="col-2 border-end border-primary">재고관리자</div>
	                                                    <div class="col-2 border-primary">재고변경일</div>
	                                                </div>
	                                                <div class="mt-1 allInventoryLocation">
	                                                    <!-- 여기에 반복문 나와야함-->
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
            <div class="row mt-3 inventoryWrapper text-center border-bottom pb-3 border-primary">
                <div class="col-2 MEDICINE_CODE_PK">약품코드</div>
                <div class="col-2 MEDI_NAME">의약품명</div>
                <div class="col-2 M_TYPE">변동사유</div>
                <div class="col-2 QUANTITY">변동수량</div>
                <div class="col-2 M_NAME">재고관리자</div>
                <div class="col-2 DATE text-right">재고변경일</div>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>