<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="testModal" class="modal fade" tabindex="-1">
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
            </div>
            <div class="modal-body py-0">
                <div class="row">
                    <div class="col">
                        <div class="row">
                            <div class="col overflow-auto" style="height: 51.59em;">
                                <div class="row">
                                    <div id="testProgressName" class="col border-bottom py-3 fw-bold" style="font-size: 1.1em; background-color: #f7f7f9;">
                                        기업현장교사 기본과정 온라인교육(15시간) 이수자를 위한 보충 영상 ※선택사항, 정규교과과정아님
                                    </div>
                                </div>
                                <div class="row">
                                    <div id="testProgressBox" class="col-8">

                                    </div>
                                </div>
                            </div>
                            <div class="col-2 border-start overflow-auto" style="height: 51.59em;">
                                <div class="row">
                                    <div class="col border-bottom">
                                        <div class="row">
                                            <div class="col text-white text-center py-3" style="font-size: 1em; background-color: #7844ae;">
                                                답안 표기판
                                            </div>
                                        </div>

                                        <div class="row">
                                        	<div id="testProgressChoiceRightBox" class="col">
		                                        
                                        	</div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer py-2">
                <button onclick="showSubmitWarningModal()" class="btn text-white fw-bold px-4" style="background-color: #7844ae; font-size: 0.8em;">제출하기</button>
            </div>
        </div>
    </div>
</div>

<div id="testTemplete" class="d-none">

	<div class="testProgressWrapper row">
	    <div class="col py-4">
	        <div class="row">
	            <div class="testProgressQuestionNumber col-auto pe-0">
	                1.
	            </div>
	            <div class="testProgressQuestion col">
	                관계 데이터베이스에서 하나의 애트리뷰트가 취할 수 있는 같은 타입의 모든 원자값들의 집합을 무엇이라고 하는가?
	            </div>
	        </div>
	        <div class="row">
	            <div class="testProgressChoiceBox col">
	                
	            </div>
	        </div>
	    </div>
	</div>
	
	<div class="testProgressChoiceWrapper row mt-3">
	    <div class="col-auto pe-0" style="position: relative; top: -0.15em;">
	        <input type="radio" class="testProgressRadio btn-check" name="question1" autocomplete="off">
	        <label class="testProgressChoiceNumber btn btn-outline-dark rounded-circle py-0 px-1" for="asdf" style="font-size: 0.7em;">1</label>
	    </div>
	    <div class="col">
	        <label class="testProgressText form-check-label" for="asdf">
	            튜플(tuple)
	        </label>
	    </div>
	</div>
	
	<div class="testProgressChoiceRightWrapper row">
	    <div class="testProgressQuestionRightNumber col-2 fw-bold text-center my-auto py-2" style="font-size: 1em; color: #7844ae; background-color: #F3ECFF;">
	        1
	    </div>
	    <div class="col-auto my-auto" style="position: relative; top: -0.15em;">
	        <input type="radio" class="testProgressRightRadio1 btn-check" name="questionRight1" id="exampleRight1-1" autocomplete="off">
	        <label class="testProgressChoiceRightNumber1 btn btn-outline-dark rounded-circle py-0 px-1" for="exampleRight1-1" style="font-size: 0.75em;">1</label>
	    </div>
	    <div class="col-auto my-auto" style="position: relative; top: -0.15em;">
	        <input type="radio" class="testProgressRightRadio2 btn-check" name="questionRight1" id="exampleRight1-2" autocomplete="off">
	        <label class="testProgressChoiceRightNumber2 btn btn-outline-dark rounded-circle py-0 px-1" for="exampleRight1-2" style="font-size: 0.75em;">2</label>
	    </div>
	    <div class="col-auto my-auto" style="position: relative; top: -0.15em;">
	        <input type="radio" class="testProgressRightRadio3 btn-check" name="questionRight1" id="exampleRight1-3" autocomplete="off">
	        <label class="testProgressChoiceRightNumber3 btn btn-outline-dark rounded-circle py-0 px-1" for="exampleRight1-3" style="font-size: 0.75em;">3</label>
	    </div>
	    <div class="col-auto my-auto" style="position: relative; top: -0.15em;">
	        <input type="radio" class="testProgressRightRadio4 btn-check" name="questionRight1" id="exampleRight1-4" autocomplete="off">
	        <label class="testProgressChoiceRightNumber4 btn btn-outline-dark rounded-circle py-0 px-1" for="exampleRight1-4" style="font-size: 0.75em;">4</label>
	    </div>
	</div>
	
</div>