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

    		let searchWord = "";
        	let clinicPageNumber = 1;
        	let totalClinicPageNumber = 1;
        	let startClinicPageNumber = 1;
        	let endClinicPageNumber = 1;
        	
        	let waitingPageNumber = 1;
        	let totalWaitingPageNumber = 1;
        	let startWaitingPageNumber = 1;
        	let endWaitingPageNumber = 1;
        	
        	function reset() {
        		
        		clinicPageNumber = 1;
        		searchWord = "";
        		document.getElementById("searchWord").value = "";
        		
        		reloadClinicTotalPageNumber();
        		reloadClinicPatientList();
        		
        	}
        	
        	function search() {
        		
        		searchWord = document.getElementById("searchWord").value;
        		
        		reloadClinicTotalPageNumber();
        		reloadClinicPatientList();
        		
        	}
        	
        	function previousClinicPage() {
        		
        		clinicPageNumber = startClinicPageNumber - 1;
        		
        		reloadClinicPatientList();
        		
        	}
        	
			function previousWaitingPage() {
        		
        		waitingPageNumber = startWaitingPageNumber - 1;
        		
        		reloadWaitingClinicPatientList();
        		
        	}
        	
        	function nextClinicPage() {
        		
        		clinicPageNumber = endClinicPageNumber + 1;
        		
        		reloadClinicPatientList();
        		
        	}
        	
			function nextWaitingPage() {
        		
				waitingPageNumber = endWaitingPageNumber + 1;
        		
        		reloadWaitingClinicPatientList();
        		
        	}
        	
        	function moveClinicPage(target) {
        		
        		clinicPageNumber = Number(target.innerText);
        		
        		reloadClinicPatientList();
        		
        	}
        	
			function moveWaitingPage(target) {
        		
        		waitingPageNumber = Number(target.innerText);
        		
        		reloadWaitingClinicPatientList();
        		
        	}
        	
        	function reloadClinicPatientList() {
        		
        		const url = "./getClinicPatientInfoList?pageNumber=" + clinicPageNumber + "&searchWord=" + searchWord;
        		
        		fetch(url)
        		.then(response => response.json())
        		.then(response => {
        			
        			startClinicPageNumber = (parseInt((clinicPageNumber-1)/5))*5+1;
         			endClinicPageNumber = ((parseInt(clinicPageNumber-1)/5)+1)*5;
         			
         			if(endClinicPageNumber > totalClinicPageNumber) {
         				endClinicPageNumber = totalClinicPageNumber;
         			}
         			
         			if(startClinicPageNumber <= 1) {
         				document.getElementById("previousClinic").classList.add("disabled");
         			}else {
         				document.getElementById("previousClinic").classList.remove("disabled");
         			}
         			
         			if(endClinicPageNumber >= totalClinicPageNumber) {
         				document.getElementById("nextClinic").classList.add("disabled");
         			}else {
         				document.getElementById("nextClinic").classList.remove("disabled");	
         			}
         			
         			for(let i = 1 ; i <= 5 ; i++) {
         				document.getElementById("clinicPageNumberBox" + i).innerHTML = "";
         			}
         			
         			for(let i = startClinicPageNumber ; i <= endClinicPageNumber ; i++) {
         				
         				const clinicPageNumberLink = document.querySelector("#templete .clinicPageNumberLink").cloneNode(true);
         				
         				if(i == clinicPageNumber) {
         					clinicPageNumberLink.classList.add("bg-primary-subtle");
         				}else {
         					clinicPageNumberLink.classList.remove("bg-primary-subtle");
         				}
         				
         				clinicPageNumberLink.innerText = i;
         				
         				document.getElementById("clinicPageNumberBox" + (i - parseInt((clinicPageNumber-1)/5)*5)).appendChild(clinicPageNumberLink);
         				
         			}
         			
         			const clinicPatientListBox = document.getElementById("clinicPatientListBox");
        			clinicPatientListBox.innerHTML = "";
        			
        			for(e of response.data) {
        				
        				const clinicPatientWrapper = document.querySelector("#templete .clinicPatientWrapper").cloneNode(true);
        				
        				clinicPatientWrapper.addEventListener("mouseenter", onMouseEnter);
        				clinicPatientWrapper.addEventListener("mouseleave", onMouseLeave);
        				
        				const clinicPatientPk = clinicPatientWrapper.querySelector(".clinicPatientPk");
        				clinicPatientPk.innerText = e.clinicPatientInfo.clinic_patient_pk;
        				
        				clinicPatientWrapper.querySelector(".clinicPatientName").innerText = e.clinicPatientInfo.name;
        				
        				const birth = new Date(e.clinicPatientInfo.birth);
        				clinicPatientWrapper.querySelector(".clinicPatientBirth").innerText = 
        					birth.getFullYear().toString().slice(-2) + "." + ("0" + (birth.getMonth() + 1)).slice(-2) + "." + ("0" + birth.getDate()).slice(-2);
        				
        				clinicPatientWrapper.querySelector(".clinicPatientClassify").innerText = e.classify;
        				
        				clinicPatientWrapper.querySelector(".checkBox").setAttribute("value", e.clinicPatientInfo.clinic_patient_pk);
        				
        				clinicPatientListBox.appendChild(clinicPatientWrapper);	
        				
        			}
        			
        		});
        		
        	}
        	
			function reloadWaitingClinicPatientList() {
        		
        		const url = "./getWaitingClinicPatientInfoList?pageNumber=" + waitingPageNumber;
        		
        		fetch(url)
        		.then(response => response.json())
        		.then(response => {
        			
        			startWaitingPageNumber = (parseInt((waitingPageNumber-1)/5))*5+1;
         			endWaitingPageNumber = ((parseInt(waitingPageNumber-1)/5)+1)*5;
         			
         			if(endWaitingPageNumber > totalWaitingPageNumber) {
         				endWaitingPageNumber = totalWaitingPageNumber;
         			}
         			
         			if(startWaitingPageNumber <= 1) {
         				document.getElementById("previousWaiting").classList.add("disabled");
         			}else {
         				document.getElementById("previousWaiting").classList.remove("disabled");
         			}
         			
         			if(endWaitingPageNumber >= totalWaitingPageNumber) {
         				document.getElementById("nextWaiting").classList.add("disabled");
         			}else {
         				document.getElementById("nextWaiting").classList.remove("disabled");	
         			}
         			
         			for(let i = 1 ; i <= 5 ; i++) {
         				document.getElementById("waitingPageNumberBox" + i).innerHTML = "";
         			}
         			
         			for(let i = startWaitingPageNumber ; i <= endWaitingPageNumber ; i++) {
         				
         				const waitingPageNumberLink = document.querySelector("#templete .waitingPageNumberLink").cloneNode(true);
         				
         				if(i == waitingPageNumber) {
         					waitingPageNumberLink.classList.add("bg-primary-subtle");
         				}else {
         					waitingPageNumberLink.classList.remove("bg-primary-subtle");
         				}
         				
         				waitingPageNumberLink.innerText = i;
         				
         				document.getElementById("waitingPageNumberBox" + (i - parseInt((waitingPageNumber-1)/5)*5)).appendChild(waitingPageNumberLink);
         				
         			}
         			
         			const waitingClinicPatientListBox = document.getElementById("waitingClinicPatientListBox");
         			waitingClinicPatientListBox.innerHTML = "";
        			
        			for(e of response.data) {
        				
        				const waitingClinicPatientWrapper = document.querySelector("#templete .waitingClinicPatientWrapper").cloneNode(true);
        				
        				waitingClinicPatientWrapper.addEventListener("mouseenter", onMouseEnter);
        				waitingClinicPatientWrapper.addEventListener("mouseleave", onMouseLeave);
        				
        				const waitingClinicPatientPk = waitingClinicPatientWrapper.querySelector(".waitingClinicPatientPk");
        				waitingClinicPatientPk.innerText = e.clinicPatientInfo.clinic_patient_pk;
        				
        				waitingClinicPatientWrapper.querySelector(".waitingClinicPatientName").innerText = e.clinicPatientInfo.name;
        				
        				const birth = new Date(e.clinicPatientInfo.birth);
        				waitingClinicPatientWrapper.querySelector(".waitingClinicPatientBirth").innerText = 
        					birth.getFullYear().toString().slice(-2) + "." + ("0" + (birth.getMonth() + 1)).slice(-2) + "." + ("0" + birth.getDate()).slice(-2);
        				
        				waitingClinicPatientWrapper.querySelector(".waitingClinicPatientClassify").innerText = e.classify;
        				
        				waitingClinicPatientListBox.appendChild(waitingClinicPatientWrapper);	
        				
        			}
        			
        		});
        		
        	}
        	
			function reloadClinicTotalPageNumber() {
        		
        		const url = "./getClinicPatientTotalPageNumber?searchWord=" + searchWord;
        		
        		fetch(url)
        		.then(response => response.json())
        		.then(response => {
        			
        			totalClinicPageNumber = response.data;
        			
        		});
        		
        	}
			
			function reloadWaitingClinicTotalPageNumber() {
        		
        		const url = "./getWaitingClinicPatientTotalPageNumber";
        		
        		fetch(url)
        		.then(response => response.json())
        		.then(response => {
        			
        			totalWaitingPageNumber = response.data;
        			
        		});
        		
        	}
			
			function addWaiting() {
				
				const checkBoxList = document.getElementsByClassName("checkBox");
				
				for(let x = 0 ; x < checkBoxList.length ; x++) {
					if(checkBoxList[x].checked == true) {
						
						const url = "./insertWaitingClinicPatientInfo?clinic_patient_pk=" + checkBoxList[x].value;
						
						fetch(url)
						.then(response => response.json())
						.then(response => {
							
							waitingPageNumber = 1;
							
							reset();
							reloadWaitingClinicTotalPageNumber();
			            	reloadWaitingClinicPatientList();
							
						});
						
					}
				}
				
			}
        	
        	function onMouseEnter(e) {
        		e.target.classList.add("bg-primary-subtle");
        	}
        	
        	function onMouseLeave(e) {
        		e.target.classList.remove("bg-primary-subtle");
        	}        	

        	function checkTheBox(target) {
        		
        		if(target.querySelector(".checkBox").checked == true) {
        			target.querySelector(".checkBox").checked = false;
        		}else {
        			target.querySelector(".checkBox").checked = true;
        		}
        	}
			
			function checkResidentIdFetch() {
				
				const firstResidentId = document.getElementById("inputFirstResidentId").value;
				const secondResidentId = document.getElementById("inputSecondResidentId").value;
				
				if(firstResidentId.length != 0 && secondResidentId.length != 0) {
					
					const residentId = firstResidentId + "-" + secondResidentId;
					const url = "./getNewClinicPatientInfo?resident_id=" + residentId;
					
					fetch(url)
					.then(response => response.json())
					.then(response => {
						
						const inputName = document.getElementById("inputName");
						const inputBirth = document.getElementById("inputBirth");
						const inputFirstPhone = document.getElementById("inputFirstPhone");
						const inputSecondPhone = document.getElementById("inputSecondPhone");
						const inputThirdPhone = document.getElementById("inputThirdPhone");
						const inputAddress = document.getElementById("inputAddress");
						const checkResidentIdBox = document.getElementById("checkResidentIdBox");
						
						if(response.data.classify != '외부인') {
							
							inputName.value = "";
							inputBirth.value = "";
							inputFirstPhone.value = "";
							inputSecondPhone.value = "";
							inputThirdPhone.value = "";
							inputAddress.value = "";
							checkResidentIdBox.innerHTML = "";
							
							inputName.value = response.data.clinicPatientInfo.name;
							const birth = new Date(response.data.clinicPatientInfo.birth);
							inputBirth.value =
								birth.getFullYear().toString() + "-" + ("0" + (birth.getMonth() + 1)).slice(-2) + "-" + ("0" + birth.getDate()).slice(-2);
							const phone = response.data.clinicPatientInfo.phone;
			            	inputFirstPhone.value = phone.slice(0, phone.indexOf("-"));
							inputSecondPhone.value = phone.slice(phone.indexOf("-")+1, phone.lastIndexOf("-"));
							inputThirdPhone.value = phone.slice(phone.lastIndexOf("-")+1);
							inputAddress.value = response.data.clinicPatientInfo.address;							
							checkResidentIdBox.innerText = "※ " + response.data.classify;
							checkResidentIdBox.style.color = "green";
							
						}else {
							
							inputName.value = "";
							inputBirth.value = "";
							inputFirstPhone.value = "";
							inputSecondPhone.value = "";
							inputThirdPhone.value = "";
							inputAddress.value = "";
							checkResidentIdBox.innerHTML = "";
							
							checkResidentIdBox.innerText = "※ 외부인";
							checkResidentIdBox.style.color = "red";
						}
						
					});
					
				}else {
					document.getElementById("inputName").value = "";
	            	document.getElementById("inputBirth").value = "";
	            	document.getElementById("inputFirstPhone").value = "";
	            	document.getElementById("inputSecondPhone").value = "";
	            	document.getElementById("inputThirdPhone").value = "";
	            	document.getElementById("inputAddress").value = "";
            		document.getElementById("checkResidentIdBox").innerHTML = "";
					return;
				}
				
			}
			
			function addNewClinicPatientInfo() {
				
 				const residentId = document.getElementById("inputFirstResidentId").value + "-" + document.getElementById("inputSecondResidentId").value;
				const name = document.getElementById("inputName").value;
				const birth = document.getElementById("inputBirth").value;
				const phone = document.getElementById("inputFirstPhone").value + "-" +
					document.getElementById("inputSecondPhone").value + "-" + document.getElementById("inputThirdPhone").value;
				const address = document.getElementById("inputAddress").value;
				
				const url = "./insertNewClinicPatientInfo?resident_id=" + residentId + "&name=" + name +
						"&birth=" + birth + "&phone=" + phone + "&address=" + address;
				
				fetch(url)
				.then(response => response.json())
				.then(response => {
					
					const modal = bootstrap.Modal.getOrCreateInstance("#addNewClinicPatient");
					waitingPageNumber = 1;
					
	                modal.hide();
	                
					reset();
					reloadWaitingClinicTotalPageNumber();
	            	reloadWaitingClinicPatientList();
					
				});
				
			}
        	
        	function showLog(target) {
        		
        		resetClinicPaitentLogInfo();
        		getClinicPatientLogInfo(target.querySelector(".waitingClinicPatientPk").innerText);
        		
        	}
        	
        	function getClinicPatientLogInfo(clinicPatientPk) {
        		
				url = "./getClinicPatientLogInfo?clinic_patient_pk=" + clinicPatientPk;
        		
        		fetch(url)
        		.then(response => response.json())
        		.then(response => {
        			
        			const logName = document.getElementById("logName");
        			const logResidentId = document.getElementById("logResidentId");
        			const logAge = document.getElementById("logAge");
        			const logAddress = document.getElementById("logAddress");
        			const logPhone = document.getElementById("logPhone");
        			const clinicPatientLogListBox = document.getElementById("clinicPatientLogListBox");
        			
        			logName.innerText = response.data.clinicPatientInfo.name;
        			logResidentId.innerText = response.data.clinicPatientInfo.resident_id;
        			logAge.innerText = response.data.clinicPatientInfo.age;
        			logAddress.innerText = response.data.clinicPatientInfo.address;
        			logPhone.innerText = response.data.clinicPatientInfo.phone;
        			
        			for(e of response.data.clinicPatientLogInfoList) {
        				
        				const clinicPatientLogWrapper = document.querySelector("#templete .clinicPatientLogWrapper").cloneNode(true);
        				
        				const logCreatedAt = clinicPatientLogWrapper.querySelector(".logCreatedAt");
        				const created_at = new Date(e.clinicPatientLogInfo.created_at);
        				logCreatedAt.innerText =
        					created_at.getFullYear().toString() + "-" +
        					("0" + (created_at.getMonth() + 1)).slice(-2) + "-" + ("0" + created_at.getDate()).slice(-2);
        				
        				const logStaff = clinicPatientLogWrapper.querySelector(".logStaff");
        				logStaff.innerText = e.staffName;
        				
        				const logDisease = clinicPatientLogWrapper.querySelector(".logDisease");
        				logDisease.innerText = e.clinicPatientLogInfo.disease_code_pk + " " + e.diseaseName;
        				
        				const logButton = clinicPatientLogWrapper.querySelector(".logButton");
        				logButton.value = e.clinicPatientLogInfo.clinic_patient_log_pk;
        				
        				clinicPatientLogListBox.appendChild(clinicPatientLogWrapper);
        				
        			}
        			
        		});
        		
        	}
        	
        	function getClinicPatientDetailLogInfo(clinicPatientLogPk) {
        		
        		const url = "./getClinicPatientDetailLogInfo?clinic_patient_log_pk=" + clinicPatientLogPk;
        		
        		fetch(url)
        		.then(response => response.json())
        		.then(response => {
        			
        			const detailDisease = document.getElementById("detailDisease");
        			detailDisease.innerText = response.data.clinicPatientLogInfo.disease_code_pk + " " + response.data.diseaseName;
        			
        			const detailContent = document.getElementById("detailContent");
        			detailContent.innerText = response.data.clinicPatientLogInfo.content;
        			
        			const datailPrescriptionBox = document.getElementById("datailPrescriptionBox");
        			
        			for(e of response.data.prescriptionInfoList) {
        				
        				const datailPrescriptionWrapper = document.querySelector("#templete .datailPrescriptionWrapper").cloneNode(true);
        				
        				const detailMedicine = datailPrescriptionWrapper.querySelector(".detailMedicine");
        				detailMedicine.innerText = e.prescriptionInfo.medicine_code_pk + " " + e.medicineName;
        				
        				const detailQuantity = datailPrescriptionWrapper.querySelector(".detailQuantity");
        				detailQuantity.innerText - e.prescriptionInfo.quantity;
        				
        				datailPrescriptionBox.appendChild(datailPrescriptionWrapper);
        				
        			}
        			
        		});
        		
        	}
        	
            function showAddClinicPatientModal() {
                const modal = bootstrap.Modal.getOrCreateInstance("#addNewClinicPatient");
                resetAddClinicPatientModal();
                modal.show();
            }

            function showWriteClinicPatientLogModal() {
                const modal = bootstrap.Modal.getOrCreateInstance("#writeClinicPatientLog");
                modal.show();
            }

            function showDetailClinicPatientLogModal(target) {
                const modal = bootstrap.Modal.getOrCreateInstance("#detailClinicPatientLog");
                resetDetailLogInfo();
                getClinicPatientDetailLogInfo(target.value);
                modal.show();
            }
            
            function resetAddClinicPatientModal() {
            	
            	document.getElementById("inputFirstResidentId").value = "";
            	document.getElementById("inputSecondResidentId").value = "";
            	document.getElementById("inputName").value = "";
            	document.getElementById("inputBirth").value = "";
            	document.getElementById("inputFirstPhone").value = "";
            	document.getElementById("inputSecondPhone").value = "";
            	document.getElementById("inputThirdPhone").value = "";
            	document.getElementById("inputAddress").value = "";
            	document.getElementById("checkResidentIdBox").innerHTML = "";
            	
            }
            
            function resetClinicPaitentLogInfo() {
            	
            	document.getElementById("logName").innerText = "";
    			document.getElementById("logResidentId").innerText = "";
    			document.getElementById("logAge").innerText = "";
    			document.getElementById("logAddress").innerText = "";
    			document.getElementById("logPhone").innerText = "";
    			document.getElementById("clinicPatientLogListBox").innerHTML = "";
    			
            }
            
            function resetDetailLogInfo() {
            	
            	document.getElementById("detailDisease").innerText = "";
            	document.getElementById("detailContent").innerText = "";
            	document.getElementById("datailPrescriptionBox").innerHTML = "";
            	
            }
            
            window.addEventListener("DOMContentLoaded", () => {
            	
            	reloadClinicTotalPageNumber();
            	reloadClinicPatientList();
            	reloadWaitingClinicTotalPageNumber();
            	reloadWaitingClinicPatientList();
            	resetClinicPaitentLogInfo();
            	
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
                                                <div class="col-2 pt-4 px-4 border-end">
                                                    <div class="row">
                                                        <div class="col text-center fw-bold" style="font-size: 1.1em;">
                                                            환자 리스트
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col">
                                                            <div class="input-group mb-3">
                                                                <input id="searchWord" type="text" class="form-control border-0 border-bottom pb-0" placeholder="이름 / 생년월일을 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2" style="font-size: 0.7em;">
                                                                <button onclick="search()" class="btn btn-transparent rounded-0 border-bottom pb-0" type="button" id="button-addon2">
                                                                    <i class="bi bi-search" style="font-size: 0.8em;"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col">
                                                            <div class="row mb-2">
                                                                <div class="col-1 d-grid justify-content-center">
                                                                    <div class="form-check">
                                                                        <input class="form-check-input rounded-0" type="checkbox" value="" style="font-size: 0.7em;" disabled>
                                                                    </div>
                                                                </div>
                                                                <div class="col-2 fw-bold mx-auto px-0 text-center" style="font-size: 0.7em;">
                                                                    번호
                                                                </div>
                                                                <div class="col fw-bold mx-auto px-0 text-center" style="font-size: 0.7em;">
                                                                    이름
                                                                </div>
                                                                <div class="col fw-bold mx-auto px-0 text-center" style="font-size: 0.7em;">
                                                                    생년월일
                                                                </div>
                                                                <div class="col fw-bold mx-auto px-0 text-center" style="font-size: 0.7em;">
                                                                    등급
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                            	<div id="clinicPatientListBox" class="col">
                                                            		<!-- 환자리스트 clinicPatientWrapper -->
                                                            	</div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col">
                                                            <div class="row">
                                                                <div class="col d-grid justify-content-start ps-2">
                                                                    <button onclick="reset()" class="btn rounded-0 py-1" style="border-color: #014195; font-size: 0.7em;">초기화</button>
                                                                </div>
                                                                <div class="col d-grid justify-content-end">
                                                                    <button onclick="addWaiting()" class="btn text-white rounded-0 py-1" style="background-color: #014195; font-size: 0.7em;">대기 추가</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col d-grid justify-content-center">
													        <ul class="pagination mb-0">
													            <li id="previousClinic" class="page-item my-auto">
													                <a onclick="previousClinicPage()" class="page-link border-0 text-black" href="#" aria-label="Previous" style="font-size: 0.8em">
													                    <span aria-hidden="true">&laquo;</span>
													                </a>
													            </li>
													            <li id="clinicPageNumberBox1" class="page-item my-auto"></li>
													            <li id="clinicPageNumberBox2" class="page-item my-auto"></li>
													            <li id="clinicPageNumberBox3" class="page-item my-auto"></li>
													            <li id="clinicPageNumberBox4" class="page-item my-auto"></li>
													            <li id="clinicPageNumberBox5" class="page-item my-auto"></li>
													            <li id="nextClinic" class="page-item my-auto">
													                <a onclick="nextClinicPage()" class="page-link border-0 text-black" href="#" aria-label="Next" style="font-size: 0.8em">
													                    <span aria-hidden="true">&raquo;</span>
													                </a>
													            </li>
													        </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-3 pt-4 px-4 border-end">
                                                    <div class="row">
                                                        <div class="col text-center fw-bold" style="font-size: 1.1em;">
                                                            대기자 리스트
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col">
                                                            <div class="row">
                                                                <div class="col d-grid justify-content-end">
                                                                    <button onclick="showAddClinicPatientModal()" class="btn btn-transparent rounded-0 pb-0" style="color: #014195; font-size: 0.75em;">+신규환자 추가+</button>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <hr class="mt-1 mb-2 border-secondary">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col">
                                                            <div class="row mb-3">
                                                                <div class="col-2 fw-bold mx-auto px-0 text-center" style="font-size: 0.7em;">
                                                                    번호
                                                                </div>
                                                                <div class="col fw-bold mx-auto px-0 text-center" style="font-size: 0.7em;">
                                                                    이름
                                                                </div>
                                                                <div class="col fw-bold mx-auto px-0 text-center" style="font-size: 0.7em;">
                                                                    생년월일
                                                                </div>
                                                                <div class="col fw-bold mx-auto px-0 text-center" style="font-size: 0.7em;">
                                                                    등급
                                                                </div>
                                                                <div class="col fw-bold mx-auto px-0 text-center" style="font-size: 0.7em;">
                                                                    기능
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                            	<div id="waitingClinicPatientListBox" class="col">
                                                            		<!-- 대기자리스트 waitingClinicPatientWrapper -->
                                                            	</div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="row mt-3">
                                                        <div id="" class="col d-grid justify-content-center">
													        <ul class="pagination mb-0">
													            <li id="previousWaiting" class="page-item my-auto">
													                <a onclick="previousWaitingPage()" class="page-link border-0 text-black" href="#" aria-label="Previous" style="font-size: 0.8em">
													                    <span aria-hidden="true">&laquo;</span>
													                </a>
													            </li>
													            <li id="waitingPageNumberBox1" class="page-item my-auto"></li>
													            <li id="waitingPageNumberBox2" class="page-item my-auto"></li>
													            <li id="waitingPageNumberBox3" class="page-item my-auto"></li>
													            <li id="waitingPageNumberBox4" class="page-item my-auto"></li>
													            <li id="waitingPageNumberBox5" class="page-item my-auto"></li>
													            <li id="nextWaiting" class="page-item my-auto">
													                <a onclick="nextWaitingPage()" class="page-link border-0 text-black" href="#" aria-label="Next" style="font-size: 0.8em">
													                    <span aria-hidden="true">&raquo;</span>
													                </a>
													            </li>
													        </ul>
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
                                                                            환자정보
                                                                        </div>
                                                                    </div>
                                                                    <div>
                                                                        <hr class="border-secondary mb-1 mt-2">
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col px-4" style="font-size: 0.8em;">
                                                                                    <div class="row">
                                                                                        <div class="col">
                                                                                            이름
                                                                                        </div>
                                                                                        <div id="logName" class="col">
                                                                                            
                                                                                        </div>
                                                                                        <div class="col">
                                                                                            주민번호
                                                                                        </div>
                                                                                        <div id="logResidentId" class="col">
                                                                                            
                                                                                        </div>
                                                                                        <div class="col">
                                                                                            나이
                                                                                        </div>
                                                                                        <div id="logAge" class="col">
                                                                                            
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div>
                                                                                <hr class="border-secondary mb-1 mt-2">
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col px-4" style="font-size: 0.8em;">
                                                                                    <div class="row">
                                                                                        <div class="col">
                                                                                            주소
                                                                                        </div>
                                                                                        <div id="logAddress" class="col-6">
                                                                                            
                                                                                        </div>
                                                                                        <div class="col">
                                                                                            전화번호
                                                                                        </div>
                                                                                        <div id="logPhone" class="col">
                                                                                            
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div>
                                                                                <hr class="border-secondary mb-1 mt-2">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mt-4">
                                                                <div class="col">
                                                                    <div class="row">
                                                                        <div class="col fw-bold my-auto" style="font-size: 1.1em;">
                                                                            진료내역
                                                                        </div>
                                                                        <div class="col d-grid justify-content-end">
                                                                            <button onclick="showWriteClinicPatientLogModal()" class="btn text-white rounded-0" style="font-size: 0.8em; background-color: #014195;">진료보기</button>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row mb-4 mt-2">
                                                                        <div id="clinicPatientLogListBox" class="col overflow-auto" style="height: 34em; background-image: url(./img/health/cutebaduck.gi); background-repeat: no-repeat; background-size: contain; background-position: center;">
                                                                            
                                                                            <!-- 진료내역 clinicPatientLogWrapper -->

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
        
        	<div onclick="checkTheBox(this)" class="clinicPatientWrapper row">
	            <div class="col-1 d-grid justify-content-center">
	                <div class="form-check">
	                    <input class="checkBox form-check-input rounded-0" type="checkbox" value="" style="font-size: 0.7em; position: relative; top: 0.35em">
	                </div>
	            </div>
	            <div class="clinicPatientPk col-2 mx-auto px-0 my-auto text-center" style="font-size: 0.7em;">
	                123
	            </div>
	            <div class="clinicPatientName col mx-auto px-0 my-auto text-center" style="font-size: 0.7em;">
	                김수한무
	            </div>
	            <div class="clinicPatientBirth col mx-auto px-0 my-auto text-center" style="font-size: 0.7em;">
	                01.02.04
	            </div>
	            <div class="clinicPatientClassify col mx-auto px-0 my-auto text-center" style="font-size: 0.7em;">
	                외부인
	            </div>
	        </div>
	        
	        <div onclick="showLog(this)" class="waitingClinicPatientWrapper row mt-2 py-1">
	            <div class="waitingClinicPatientPk col-2 mx-auto px-0 text-center" style="font-size: 0.7em;">
	                123
	            </div>
	            <div class="waitingClinicPatientName col mx-auto px-0 text-center" style="font-size: 0.7em;">
	                김수한무
	            </div>
	            <div class="waitingClinicPatientBirth col mx-auto px-0 text-center" style="font-size: 0.7em;">
	                01.02.04
	            </div>
	            <div class="waitingClinicPatientClassify col mx-auto px-0 text-center" style="font-size: 0.7em;">
	                외부인
	            </div>
	            <div class="col mx-auto px-0 d-grid justify-content-center">
	                <button class="btn text-white rounded-0 py-0 px-2" style="background-color: #014195; font-size: 0.65em;">호출</button>
	            </div>
	        </div>
	        
	        <div class="clinicPatientLogWrapper row mt-3">
	            <div class="col">
	                <div class="row">
	                    <div class="logCreatedAt col fw-bold my-auto" style="font-size: 0.8em;">
	                        2023.12.05
	                    </div>
	                    <div class="logStaff col text-end my-auto" style="font-size: 0.75em;">
	                        교직원
	                    </div>
	                </div>
	                <div class="row mt-2">
	                    <div class="logDisease col my-auto" style="font-size: 0.85em;">10527 질병명</div>
	                    <div class="col my-auto d-grid justify-content-end">
	                        <button onclick="showDetailClinicPatientLogModal(this)" class="logButton btn rounded-0 py-0" style="font-size: 0.8em; border-color: #014195;">상세보기</button>
	                    </div>
	                </div>
	                <div>
	                    <hr class="border-secondary">
	                </div>
	            </div>
	        </div>
	        
	        <a onclick="moveClinicPage(this)" class="clinicPageNumberLink page-link border-0 text-black px-2" href="#" style="font-size: 0.8em;">1</a>
	        
	        <a onclick="moveWaitingPage(this)" class="waitingPageNumberLink page-link border-0 text-black px-2" href="#" style="font-size: 0.8em;">1</a>
	        
	        <div class="datailPrescriptionWrapper row mt-2">
            	<div class="detailMedicine col" style="font-size: 0.8em;">
		        	54321 쀼쀼
		    	</div>
		        <div class="detailQuantity col-1" style="font-size: 0.8em;">
		        	1
		        </div>
            </div>
	        
	        <div class="wrtiePrescriptionWrapper row mt-2">
		    	<div class="col">
		        	<input class="form-control rounded-0" list="datalistOptions" placeholder="처방할 의약품을 입력해주세요" style="font-size: 0.7em;">
		            <datalist class="medicineDataListOptionsBox">
		            </datalist>
		        </div>
		        <div class="col-1">
		        	<input type="number" class="writeQuantity form-control rounded-0" style="font-size: 0.7em;" value="1" min="1">
		        </div>
		    </div>
	        
        </div>
        
        <div id="addNewClinicPatient" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content rounded-0">
                    <div class="modal-header py-2 rounded-0" style="background-color: #014195;">
                        <span class="modal-title fw-bold text-white" style="font-size: 1.1em;">신규환자 등록</span>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="font-size: 0.9em;"></button>
                    </div>
                    <div class="modal-body pt-4 pb-1">
                        <div class="row">
                            <div class="col">
                                <div class="row">
                                    <div class="col-2 my-auto text-secondary" style="font-size: 0.75em;">
                                        주민번호
                                    </div>
                                    <div class="col-6">
                                        <div class="input-group">
                                            <input id="inputFirstResidentId" onblur="checkResidentIdFetch()" type="text" class="form-control rounded-0 py-1" style="font-size: 0.75em;">
                                            <span class="my-auto">&nbsp;-&nbsp;</span>
                                            <input id="inputSecondResidentId" onblur="checkResidentIdFetch()" type="text" class="form-control rounded-0 py-1" style="font-size: 0.75em;">
                                        </div>
                                    </div>
                                    <div id="checkResidentIdBox" class="col my-auto" style="font-size: 0.7em;">
                                    
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-2 my-auto text-secondary" style="font-size: 0.75em;">
                                        이름
                                    </div>
                                    <div class="col-4">
                                        <input id="inputName" type="text" class="form-control rounded-0 py-1" style="font-size: 0.75em;">
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-2 my-auto text-secondary" style="font-size: 0.75em;">
                                        생년월일
                                    </div> 
                                    <div class="col-3">
                                        <input id="inputBirth" type="date" class="form-control rounded-0 py-1" style="font-size: 0.75em;">
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-2 my-auto text-secondary" style="font-size: 0.75em;">
                                        전화번호
                                    </div>
                                    <div class="col-6">
                                        <div class="input-group">
                                            <input id="inputFirstPhone" type="text" class="form-control rounded-0 py-1" style="font-size: 0.75em;">
                                            <span class="my-auto">&nbsp;-&nbsp;</span>
                                            <input id="inputSecondPhone" type="text" class="form-control rounded-0 py-1" style="font-size: 0.75em;">
                                            <span class="my-auto">&nbsp;-&nbsp;</span>
                                            <input id="inputThirdPhone" type="text" class="form-control rounded-0 py-1" style="font-size: 0.75em;">
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-2 my-auto text-secondary" style="font-size: 0.75em;">
                                        주소
                                    </div>
                                    <div class="col">
                                        <input id="inputAddress" type="text" class="form-control rounded-0 py-1" style="font-size: 0.75em;">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer py-2 border-0">
                        <button type="button" class="btn btn-secondary rounded-0" data-bs-dismiss="modal" style="font-size: 0.8em;">취소</button>
                        <button onclick="addNewClinicPatientInfo()" class="btn rounded-0  text-white" style="font-size: 0.8em; background-color: #014195;">등록하기</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="writeClinicPatientLog" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content rounded-0">
                    <div class="modal-header py-2 rounded-0" style="background-color: #014195;">
                        <span class="modal-title fw-bold text-white" style="font-size: 1.1em;">진료 등록</span>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="font-size: 0.9em;"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col">
                                <div class="row">
                                    <div class="col">
                                        <div class="row">
                                            <div class="col fw-bold" style="font-size: 0.9em;">
                                                질병사유
                                            </div>
                                        </div>
                                        
                                        <div class="row mt-2">
                                            <div class="col">
                                                <input class="form-control rounded-0" id="exampleDataList" placeholder="질병사유를 입력해주세요" style="font-size: 0.7em;">
                                                <datalist id="diseaseDataListOptionsBox">
                                                </datalist>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col">
                                        <div class="row">
                                            <div class="col fw-bold" style="font-size: 0.9em;">
                                                진료내용
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col">
                                                <textarea id="writeContent" class="form-control rounded-0" rows="10" style="font-size: 0.8em;"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col">
                                        <div class="row">
                                            <div class="col fw-bold" style="font-size: 0.9em;">
                                                처방의약품
                                            </div>
                                            <div class="col d-grid justify-content-end">
                                                <button onclick="addPrescription()" class="text-danger btn btn-transparent py-0" style="font-size: 1.1em;">+</button>
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                        	<div id="writePrescriptionBox" class="col">
                                        		
                                        	</div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer py-2 border-0">
                        <button type="button" class="btn btn-secondary rounded-0" data-bs-dismiss="modal" style="font-size: 0.8em;">취소</button>
                        <button onclick="addLog()" class="btn rounded-0  text-white" style="font-size: 0.8em; background-color: #014195;">등록하기</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="detailClinicPatientLog" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content rounded-0">
                    <div class="modal-header py-2 rounded-0" style="background-color: #014195;">
                        <span class="modal-title fw-bold text-white" style="font-size: 1.1em;">상세내역</span>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="font-size: 0.9em;"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col">
                                <div class="row">
                                    <div class="col">
                                        <div class="row">
                                            <div class="col fw-bold" style="font-size: 0.9em;">
                                                질병사유
                                            </div>
                                        </div>
                                        
                                        <div class="row mt-2">
                                            <div id="detailDisease" class="col" style="font-size: 0.8em;">
                                                10532 복통
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col">
                                        <div class="row">
                                            <div class="col fw-bold" style="font-size: 0.9em;">
                                                진료내용
                                            </div>
                                        </div>
                                        <div class="row mt-2">
                                            <div id="detailContent" class="col" style="font-size: 0.8em;">
                                                <p class="my-0">안녕하세요</p>
                                                <p class="my-0">진료내용입니다</p>
                                                <p class="my-0">나중에는 p 태그 없애버릴거에요</p>
                                                <p class="my-0">배가 너무 고픈데 칸쵸먹고 싶은데 밥 먹기 20분이라 먹지못해 슬프다..</p>
                                                <p class="my-0">꼬르륵거리는데 꼬르륵소리 좀 안났으면 좋겠다</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col">
                                        <div class="row">
                                            <div class="col fw-bold" style="font-size: 0.9em;">
                                                처방의약품
                                            </div>
                                        </div>
                                        
                                        <div class="row">
                                            <div id="datailPrescriptionBox" class="col">
                                            	
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer py-1 border-0">
                        <button type="button" class="btn btn-secondary rounded-0" data-bs-dismiss="modal" style="font-size: 0.8em;">닫기</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>