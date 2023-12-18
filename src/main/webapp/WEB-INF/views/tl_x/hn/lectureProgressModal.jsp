<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="lectureProgressModal" class="modal fade" tabindex="-1">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content">
            <div class="modal-header py-1">
                <div class="row">
                    <div class="col-auto pe-1">
                        <img class="img-fluid" src="../../resources/img/lifeStudent/logo_black.png" style="height: 3.3em;">
                    </div>
                    <div class="mkmk col ps-0 my-auto" style="font-size: 1.5em; font-weight: 600;">
                        MK<span style="color: #4a3187;">평생교육원</span>
                    </div>
                </div>
                <button type="button" class="btn btn-transparent" data-bs-dismiss="modal" aria-label="Close">
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <div class="col text-center text-body-tertiary">
                                    <i class="fa-solid fa-door-open"></i>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col text-center fw-bold text-body-tertiary" style="font-size: 0.8em;">
                                    나가기
                                </div>
                            </div>
                        </div>
                    </div>
                </button>
            </div>
            <div class="modal-body py-0" style="background-color: #F3F3F7;">
                <div class="row">
                    <div class="col">
                        <div class="row border-bottom bg-white">
                            <div class="col px-3 pt-2">
                                <div class="row">
                                    <div class="col-auto my-auto fw-bold text-body-tertiary" style="font-size: 0.85em;">
                                        교육과정
                                    </div>
                                    <div id="progressName" class="col fw-bold" style="font-size: 1.2em;">
                                        기업현장교사 기본과정 온라인교육(15시간) 이수자를 위한 보충 영상 ※선택사항, 정규교과과정아님
                                    </div>
                                    <div class="col-auto my-auto">
                                        <select class="form-control rounded-pill border-0" style="font-size: 0.85em; color: #fff; background-color: #f7a505;">
                                            <option>다른 과정으로 이동하기</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col rounded-pill mx-2 px-4 py-2 border" style="background-color: #f7f7f9;">
                                        <div class="row">
                                            <div class="col-auto fw-bold" style="font-size: 0.8em;">
                                                교육기간
                                            </div>
                                            <div id="progressLectureDate" class="col-auto fw-bold text-body-tertiary" style="font-size: 0.8em;">
                                                2024.01.01~2024.12.31
                                            </div>
                                            <div class="col-auto fw-bold" style="font-size: 0.8em;">
                                                인정학점
                                            </div>
                                            <div class="col-auto" style="font-size: 0.8em;">
                                                <span id="progressCredit" class="fw-bold" style="color: #f7a505;">3</span> 학점
                                            </div>
                                            <div class="col-auto fw-bold" style="font-size: 0.8em;">
                                                시험
                                            </div>
                                            <div class="col" style="font-size: 0.8em;">
                                                <span id="studentTotalTestCount" class=" fw-bold" style="color: #f7a505;">1</span> / <span id="totalTestCount">10</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col">
                                        <ul class="nav nav-pills" id="pills-tab" role="tablist">
                                            <li class="nav-item" role="presentation">
                                                <button class="btn btn-transparent fw-bold nav-link active rounded-0" style="font-size: 0.85em;" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">
                                                    강의 홈
                                                </button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="btn btn-transparent fw-bold nav-link ms-4 rounded-0" style="font-size: 0.854em;" id="pills-test-tab" data-bs-toggle="pill" data-bs-target="#pills-test" type="button" role="tab" aria-controls="pills-test" aria-selected="false">
                                                    시험
                                                </button>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row pb-4">
                            <div class="col">
                                <div class="tab-content" id="pills-tabContent">
                                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
                                        <div class="row mt-4">
                                            <div class="col">
                                                <div class="row">
                                                    <div class="col-4 rounded border ms-3 bg-white">
                                                        <div class="row border-bottom py-2">
                                                            <div class="col-auto pe-0" style="font-size: 1.1em; color: #7844ae;">
                                                                <i class="fa-solid fa-spinner"></i>
                                                            </div>
                                                            <div class="col fw-bold" style="font-size: 1em;">
                                                                출석률
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col px-4" style="height: 14.42em;">
                                                                <div class="row align-items-center" style="height: 14.42em;">
                                                                    <div class="col">
                                                                        <div class="row">
                                                                            <div class="col">
                                                                                <div class="row">
                                                                                    <div class="col fw-bold" style="font-size: 0.9em;">나의 출석률</div>
                                                                                </div>
                                                                                <div class="row mt-1">
                                                                                    <div class="col my-auto">
                                                                                        <div class="progress" style="height: 0.8em;" role="progressbar" aria-label="Basic example" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
                                                                                            <div id="attendanceRate" class="progress-bar" style="width: 100%; background-color: #f7a505;"></div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div id="attendanceRatePer" class="col-auto my-auto fw-bold" style="font-size: 0.9em; color: #f7a505;">
                                                                                        100%
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row mt-4">
                                                                            <div class="col">
                                                                                <div class="row">
                                                                                    <div class="col fw-bold" style="font-size: 0.9em;">권장 출석률</div>
                                                                                </div>
                                                                                <div class="row mt-1">
                                                                                    <div class="col my-auto">
                                                                                        <div class="progress" style="height: 0.8em;" role="progressbar" aria-label="Basic example" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
                                                                                            <div class="progress-bar" style="width: 100%; background-color: #f7a505;"></div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-auto my-auto fw-bold" style="font-size: 0.9em; color: #f7a505;">
                                                                                        100%
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col rounded border ms-4 me-3 bg-white">
                                                        <div class="row border-bottom py-2">
                                                            <div class="col-auto pe-0" style="font-size: 1.1em; color: #7844ae;">
                                                                <i class="fa-solid fa-spinner"></i>
                                                            </div>
                                                            <div class="col fw-bold" style="font-size: 1em;">
                                                                성적현황
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-2 my-auto">
                                                                <div class="row">
                                                                    <div class="col">
                                                                        <div class="row">
                                                                            <div class="col text-center fw-semibold" style="font-size: 0.9em;">
                                                                                총점
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col text-center fw-semibold" style="font-size: 1.5em; color: #7844ae;">
                                                                                94.0
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row mt-4">
                                                                    <div class="col text-center text-body-tertiary fw-bold" style="font-size: 0.85em;">
                                                                        수료여부
                                                                    </div>
                                                                    <div id="progressStatusBox" class="col">
                                                                        
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col text-center fw-semibold" style="font-size: 0.9em;">
                                                                <div class="row border-bottom border-start">
                                                                    <div class="col py-2 border-end" style="background-color: #f7f7f9;">항목</div>
                                                                    <div class="col py-2 border-end">진도</div>
                                                                    <div class="col py-2">시험</div>
                                                                </div>
                                                                <div class="row border-bottom border-start">
                                                                    <div class="col py-2 border-end" style="background-color: #f7f7f9;">평가비율&#40;%&#41;</div>
                                                                    <div class="col py-2 border-end">80</div>
                                                                    <div class="col py-2">20</div>
                                                                </div>
                                                                <div class="row border-bottom border-start">
                                                                    <div class="col py-2 border-end" style="background-color: #f7f7f9;">취득점수&#40;점&#41;</div>
                                                                    <div id="attendanceScore" class="col py-2 border-end" style="color: #7844ae;">100</div>
                                                                    <div id="score" class="col py-2" style="color: #7844ae;">70</div>
                                                                </div>
                                                                <div class="row border-bottom border-start">
                                                                    <div class="col py-2 border-end" style="background-color: #f7f7f9;">환산점수&#40;점&#41;</div>
                                                                    <div id="calcAttendanceScore" class="col py-2 border-end" style="color: #7844ae;">80</div>
                                                                    <div id="calcScore" class="col py-2" style="color: #7844ae;">14</div>
                                                                </div>
                                                                <div class="row border-bottom border-start">
                                                                    <div class="col-4 py-2 border-end" style="background-color: #f7f7f9;">수료조건</div>
                                                                    <div class="col py-2">
                                                                    	총점 : 85점 이상 / 과락 기준 : 진도율 <span id="attendanceCondition">90</span>점 이상, 시험 <span id="testCondition">60</span>점 이상
                                                                    </div>
                                                                </div>
                                                                <div class="row border-start">
                                                                    <div class="col-4 py-2 border-end" style="background-color: #f7f7f9;">총점</div>
                                                                    <div class="col py-2"><span id="totalScore" style="color: #7844ae;">94</span> / 100</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row mt-4">
                                                    <div class="col rounded border ms-3 bg-white">
                                                        <div class="row border-bottom py-2">
                                                            <div class="col-auto pe-0" style="font-size: 1.1em; color: #7844ae;">
                                                                <i class="fa-solid fa-spinner"></i>
                                                            </div>
                                                            <div class="col fw-bold" style="font-size: 1em;">
                                                                과정공지
                                                            </div>
                                                            <div class="col text-end text-secondary" style="font-size: 1.1em;">
                                                                <i class="fa-solid fa-plus"></i>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="row py-2 border-bottom" style="background-color: #f7f7f9;">
                                                                    <div class="col-1 text-center fw-bold" style="font-size: 0.95em;">번호</div>
                                                                    <div class="col-1 text-center fw-bold" style="font-size: 0.95em;">유형</div>
                                                                    <div class="col text-center fw-bold" style="font-size: 0.95em;">제목</div>
                                                                    <div class="col-3 text-center fw-bold" style="font-size: 0.95em;">등록일</div>
                                                                </div>

                                                                <div class="row py-2 border-bottom">
                                                                    <div class="col-1 text-center" style="font-size: 0.9em;">1</div>
                                                                    <div class="col-1 text-center fw-bold" style="font-size: 0.9em; color: #f7a505;">공지</div>
                                                                    <div class="col text-center" style="font-size: 0.9em;">교육을 다 들었는데 전도율이 안올라가는 경우</div>
                                                                    <div class="col-3 text-center text-body-tertiary" style="font-size: 0.9em;">2023-07-31</div>
                                                                </div>

                                                                <div class="row py-2 border-bottom">
                                                                    <div class="col-1 text-center" style="font-size: 0.9em;">7</div>
                                                                    <div class="col-1 text-center fw-bold" style="font-size: 0.9em; color: #f7a505;">공지</div>
                                                                    <div class="col text-center" style="font-size: 0.9em;">시험/설문 응시방법 안내&#40;첨부파일 확인&#41;</div>
                                                                    <div class="col-3 text-center text-body-tertiary" style="font-size: 0.9em;">2023-06-04</div>
                                                                </div>
                                                                <div class="row py-2 border-bottom">
                                                                    <div class="col-1 text-center" style="font-size: 0.9em;">8</div>
                                                                    <div class="col-1 text-center fw-bold" style="font-size: 0.9em; color: #f7a505;">공지</div>
                                                                    <div class="col text-center" style="font-size: 0.9em;">수료처리는 교육종료일 이후 7일이내 예정입니다</div>
                                                                    <div class="col-3 text-center text-body-tertiary" style="font-size: 0.9em;">2023-05-07</div>
                                                                </div>
                                                                <div class="row py-2 border-bottom">
                                                                    <div class="col-1 text-center" style="font-size: 0.9em;">1</div>
                                                                    <div class="col-1 text-center fw-bold" style="font-size: 0.9em; color: #f7a505;">공지</div>
                                                                    <div class="col text-center" style="font-size: 0.9em;">교육을 다 들었는데 전도율이 안올라가는 경우</div>
                                                                    <div class="col-3 text-center text-body-tertiary" style="font-size: 0.9em;">2023-07-31</div>
                                                                </div>
                                                                <div class="row py-2 border-bottom">
                                                                    <div class="col-1 text-center" style="font-size: 0.9em;">1</div>
                                                                    <div class="col-1 text-center fw-bold" style="font-size: 0.9em; color: #f7a505;">공지</div>
                                                                    <div class="col text-center" style="font-size: 0.9em;">교육을 다 들었는데 전도율이 안올라가는 경우</div>
                                                                    <div class="col-3 text-center text-body-tertiary" style="font-size: 0.9em;">2023-07-31</div>
                                                                </div>
                                                                <div class="row py-2 border-bottom">
                                                                    <div class="col-1 text-center" style="font-size: 0.9em;">1</div>
                                                                    <div class="col-1 text-center fw-bold" style="font-size: 0.9em; color: #f7a505;">공지</div>
                                                                    <div class="col text-center" style="font-size: 0.9em;">교육을 다 들었는데 전도율이 안올라가는 경우</div>
                                                                    <div class="col-3 text-center text-body-tertiary" style="font-size: 0.9em;">2023-07-31</div>
                                                                </div>
                                                                <div class="row py-2 border-bottom">
                                                                    <div class="col-1 text-center" style="font-size: 0.9em;">1</div>
                                                                    <div class="col-1 text-center fw-bold" style="font-size: 0.9em; color: #f7a505;">공지</div>
                                                                    <div class="col text-center" style="font-size: 0.9em;">교육을 다 들었는데 전도율이 안올라가는 경우</div>
                                                                    <div class="col-3 text-center text-body-tertiary" style="font-size: 0.9em;">2023-07-31</div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col rounded border ms-4 me-3 bg-white">
                                                        <div class="row border-bottom py-2">
                                                            <div class="col-auto pe-0" style="font-size: 1.1em; color: #7844ae;">
                                                                <i class="fa-solid fa-spinner"></i>
                                                            </div>
                                                            <div class="col fw-bold" style="font-size: 1em;">
                                                                과정질문
                                                            </div>
                                                            <div class="col text-end text-secondary" style="font-size: 1.1em;">
                                                                <i class="fa-solid fa-plus"></i>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <div class="row py-2 border-bottom" style="background-color: #f7f7f9;">
                                                                    <div class="col-1 text-center fw-bold" style="font-size: 0.95em;">번호</div>
                                                                    <div class="col text-center fw-bold" style="font-size: 0.95em;">제목</div>
                                                                    <div class="col-2 text-center fw-bold" style="font-size: 0.95em;">등록일</div>
                                                                    <div class="col-2 text-center fw-bold" style="font-size: 0.95em;">답변여부</div>
                                                                </div>

                                                                <div class="row py-2 border-bottom">
                                                                    <div class="col-1 text-center" style="font-size: 0.9em;">1</div>
                                                                    <div class="col text-center" style="font-size: 0.9em;">시험 문제 오류</div>
                                                                    <div class="col-2 text-center text-body-tertiary" style="font-size: 0.9em;">2023-07-31</div>
                                                                    <div class="col-2 text-center fw-bold" style="font-size: 0.9em;">
                                                                        <span class="px-3 py-0 text-center fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #4CAF50; background-color: #F1F9F1;">
                                                                            답변완료
                                                                        </span>
                                                                    </div>
                                                                </div>

                                                                <div class="row py-2 border-bottom">
                                                                    <div class="col-1 text-center" style="font-size: 0.9em;">3</div>
                                                                    <div class="col text-center" style="font-size: 0.9em;">강의 관련 질문</div>
                                                                    <div class="col-2 text-center text-body-tertiary" style="font-size: 0.9em;">2023-07-05</div>
                                                                    <div class="col-2 text-center fw-bold" style="font-size: 0.9em;">
                                                                        <span class="px-3 py-0 text-center fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #FA4D5A; background-color: #FAF1F4;">
                                                                            미답변
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div class="row py-2 border-bottom">
                                                                    <div class="col-1 text-center" style="font-size: 0.9em;">1</div>
                                                                    <div class="col text-center" style="font-size: 0.9em;">거기.... 계시나요.....</div>
                                                                    <div class="col-2 text-center text-body-tertiary" style="font-size: 0.9em;">2023-06-31</div>
                                                                    <div class="col-2 text-center fw-bold" style="font-size: 0.9em;">
                                                                        <span class="px-3 py-0 text-center fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #FA4D5A; background-color: #FAF1F4;">
                                                                            미답변
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div class="row py-2 border-bottom">
                                                                    <div class="col-1 text-center" style="font-size: 0.9em;">1</div>
                                                                    <div class="col text-center" style="font-size: 0.9em;">공지 관련 질문</div>
                                                                    <div class="col-2 text-center text-body-tertiary" style="font-size: 0.9em;">2023-06-30</div>
                                                                    <div class="col-2 text-center fw-bold" style="font-size: 0.9em;">
                                                                        <span class="px-3 py-0 text-center fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #FA4D5A; background-color: #FAF1F4;">
                                                                            미답변
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div class="row py-2 border-bottom">
                                                                    <div class="col-1 text-center" style="font-size: 0.9em;">1</div>
                                                                    <div class="col text-center" style="font-size: 0.9em;">시험 문제 오류</div>
                                                                    <div class="col-2 text-center text-body-tertiary" style="font-size: 0.9em;">2023-07-31</div>
                                                                    <div class="col-2 text-center fw-bold" style="font-size: 0.9em;">
                                                                        <span class="px-3 py-0 text-center fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #4CAF50; background-color: #F1F9F1;">
                                                                            답변완료
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div class="row py-2 border-bottom">
                                                                    <div class="col-1 text-center" style="font-size: 0.9em;">1</div>
                                                                    <div class="col text-center" style="font-size: 0.9em;">시험 문제 오류</div>
                                                                    <div class="col-2 text-center text-body-tertiary" style="font-size: 0.9em;">2023-07-31</div>
                                                                    <div class="col-2 text-center fw-bold" style="font-size: 0.9em;">
                                                                        <span class="px-3 py-0 text-center fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #4CAF50; background-color: #F1F9F1;">
                                                                            답변완료
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div class="row py-2 border-bottom">
                                                                    <div class="col-1 text-center" style="font-size: 0.9em;">1</div>
                                                                    <div class="col text-center" style="font-size: 0.9em;">시험 문제 오류</div>
                                                                    <div class="col-2 text-center text-body-tertiary" style="font-size: 0.9em;">2023-07-31</div>
                                                                    <div class="col-2 text-center fw-bold" style="font-size: 0.9em;">
                                                                        <span class="px-3 py-0 text-center fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #4CAF50; background-color: #F1F9F1;">
                                                                            답변완료
                                                                        </span>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="pills-test" role="tabpanel" aria-labelledby="pills-test-tab" tabindex="0">
                                        <div class="row my-4">
                                            <div class="col border ms-4 me-3 bg-white">
                                                <div class="row border-bottom py-2">
                                                    <div class="col-auto pe-0" style="font-size: 1.1em; color: #7844ae;">
                                                        <i class="fa-solid fa-spinner"></i>
                                                    </div>
                                                    <div class="col fw-bold" style="font-size: 1em;">
                                                        시험
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="row py-2 border-bottom" style="background-color: #f7f7f9;">
                                                            <div class="col-1 text-center fw-bold" style="font-size: 0.95em;">번호</div>
                                                            <div class="col text-center fw-bold" style="font-size: 0.95em;">평가명</div>
                                                            <div class="col text-center fw-bold" style="font-size: 0.95em;">응시/제출 기간</div>
                                                            <div class="col-1 text-center fw-bold" style="font-size: 0.95em;">반영비율</div>
                                                            <div class="col-1 text-center fw-bold" style="font-size: 0.95em;">진행상태</div>
                                                            <div class="col-1 text-center fw-bold" style="font-size: 0.95em;">점수</div>
                                                            <div class="col-1 text-center fw-bold" style="font-size: 0.95em;">응시/제출</div>
                                                        </div>

                                                        <div class="row">
                                                        	<div id="testBox" class="col">
                                                        		
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
    </div>
</div>

<div id="progressTemplete" class="d-none">
	
	<span class="progressComplete px-3 py-0 text-center fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #4CAF50; background-color: #F1F9F1;">
		수료
	</span>
	
	<span class="progressPoor px-3 py-0 text-center fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #FA4D5A; background-color: #FAF1F4;">
		미수료
	</span>
	
	<div class="testWrapper row py-2 border-bottom">
        <div class="testNumber col-1 text-center" style="font-size: 0.9em;">1</div>
        <div class="testName col text-center" style="font-size: 0.9em;">기업현장교사 기본과정 온라인교육(15시간) 이수자를 위한 보충 영상</div>
        <div class="testDate col text-center" style="font-size: 0.9em;">2023-07-31 00:00~2023-08-31 23:59</div>
        <div class="col-1 text-center" style="font-size: 0.9em;">20%</div>
        <div class="testWhether col-1 text-center" style="font-size: 0.9em;">○</div>
        <div class="col-1 text-center" style="font-size: 0.9em;"><span class="testScore fw-bold">70</span> / 100</div>
    	<div class="testButtonBox col-1 text-center fw-bold" style="font-size: 0.9em;"></div>
  	</div>
      
    <span class="testComplete px-3 py-0 text-center fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #4CAF50; background-color: #F1F9F1;">
		응시완료
	</span>
      
    <span onclick="showTestWarningModal(this)" class="testIng btn px-3 py-0 text-center fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #7844ae; background-color: #F3ECFF;">
		응시하기
	</span>
      
    <span class="testPoor px-3 py-0 text-center fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #B0B0B3; background-color: #f7f7f9;">
		미응시
	</span>
      
    <span class="testBeforeOpen px-3 py-0 text-center fw-bold rounded-pill" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #B0B0B3; background-color: #f7f7f9;">
		오픈전
	</span>

</div>