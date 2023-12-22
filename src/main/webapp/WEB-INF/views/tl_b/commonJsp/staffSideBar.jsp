<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col col-auto" style="height: 45em">
    <div class="row">
        <div class="col">
            <div class="row">
                <div class="col">
                    <div class="row mt-4">
                        <div class="col text-center fw-bold" style="font-size: xx-large;">
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
                            환영합니다
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col">
                    <div class="row">
                        <div class="col text-center" style="font-size: small;">
                            <span class="fw-bold" id="staffName"></span> 님&nbsp;&nbsp;|&nbsp;&nbsp;<a class="link-underline link-underline-opacity-0 link-dark" href="../../another/staff/logoutProcess">로그아웃</a>
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
                                <button id="collapse1" onclick="clickCollapse(this)" class="btn btn-transparent rounded-0 fw-bold" value="c1" style="font-size: small;"  data-bs-target="#collapseExample1">
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
                                <div class="card card-body rounded-0 py-0 border-0 px-0">
                                    <a id="color1" class="btn btn-transparent text-start rounded-0 px-4" href="../kh/medicineInventory" style="font-size: small;">
                                        재고관리
                                    </a>
                                    <a id="color2" class="btn btn-transparent text-start rounded-0 px-4" href="../kh/medicineAdd" style="font-size: small;">
                                        입고관리
                                    </a>
                                    <a id="color3" class="btn btn-transparent text-start rounded-0 px-4" href="../kh/codeRegistPage" style="font-size: small;">
                                        코드관리
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col px-0">
                            <p class="mb-0">
                                <a class="d-grid link-underline link-underline-opacity-0" href="../hn/clinicPage">
                                	<button id="color4" class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button">
                                     <div class="row py-2 mx-1">
                                         <div class="col text-start">
                                             <i class="bi bi-ui-checks"></i>&nbsp;&nbsp;진료관리
                                         </div>
                                     </div>
                                 </button>
                                </a>
                            </p>
                        </div>
                    </div>
                    <div class="row">
             			<div class="col px-0">
                            <p class="d-grid mb-0">
                                <button id="collapse2" onclick="clickCollapse(this)" class="btn btn-transparent rounded-0 fw-bold" value="c2" style="font-size: small;" data-bs-target="#collapseExample2">
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
                                <div class="card card-body rounded-0 py-0 border-0 px-0">
                                    <a id="color5" class="btn btn-transparent text-start rounded-0 px-4" href="../ys/itemListAndRegistPage" style="font-size: small;">
                                        등록
                                    </a>
                                    <a id="color6" class="btn btn-transparent text-start rounded-0 px-4" href="../ys/staffItemApplyListPage" style="font-size: small;">
                                        현황관리
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
             			<div class="col px-0">
                            <p class="d-grid mb-0">
                                <button id="collapse3" onclick="clickCollapse(this)" class="btn btn-transparent rounded-0 fw-bold" value="c3" style="font-size: small;" data-bs-target="#collapseExample3">
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
                                <div class="card card-body rounded-0 py-0 border-0 px-0">
                                    <a id="color8" class="btn btn-transparent text-start rounded-0 px-4" href="../hs/eduMainPageForStaff" style="font-size: small;">
                                        전체 현황
                                    </a>
                                    <a id="color9" class="btn btn-transparent text-start rounded-0 px-4" href="../hs/eduApplyListPage" style="font-size: small;">
                                        프로그램 신청 현황
                                    </a>
                                    <a id="color12" class="btn btn-transparent text-start rounded-0 px-4" href="../hs/eduServeyListPage" style="font-size: small;">
                                        만족도 작성 현황
                                    </a>
                                    <a id="color13" class="btn btn-transparent text-start rounded-0 px-4" href="../hs/eduProgListPage" style="font-size: small;">
                                        프로그램 목록
                                    </a>
                                    <a id="color7" class="btn btn-transparent text-start rounded-0 px-4" href="../hs/eduProgRegisterPage" style="font-size: small;">
                                        프로그램 등록
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col px-0">
                            <p class="mb-0">
                            	<a class="d-grid link-underline link-underline-opacity-0" href="../dy/staffboardPage">
                                 <button id="color10" class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button">
                                     <div class="row py-2 mx-1">
                                         <div class="col text-start">
                                             <i class="bi bi-list-ul"></i>&nbsp;&nbsp;직원 게시판
                                         </div>
                                     </div>
                                 </button>
                                </a>
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col px-0">
                            <p class="mb-0">
                            	<a class="d-grid link-underline link-underline-opacity-0" href="../ty/staffBoardPage">
                                 <button id="color11" class="btn btn-transparent rounded-0 fw-bold" style="font-size: small;" type="button">
                                     <div class="row py-2 mx-1">
                                         <div class="col text-start">
                                             <i class="bi bi-question-octagon"></i>&nbsp;&nbsp;공지사항
                                         </div>
                                     </div>
                                 </button>
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="vr px-0 text-body-tertiary"></div>