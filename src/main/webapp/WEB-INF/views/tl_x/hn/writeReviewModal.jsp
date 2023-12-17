<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="writeReviewModal" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header pb-0 pt-3 border-0">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="font-size: 0.8em;"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col">
                        <div class="row">
                            <div class="col fw-bold" style="font-size: 0.8em;">
                                <i class="fa-regular fa-star"></i> 별점을 선택해주세요
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-auto pe-0">
                                <i id="starWrite1" onclick="colorStars(this)" class="fa-solid fa-star" style="color: #f7a505; font-size: 2em;"></i>
                            </div>
                            <div class="col-auto pe-0 ps-1">
                                <i id="starWrite2" onclick="colorStars(this)" class="fa-regular fa-star" style="color: #f7a505; font-size: 2em;"></i>
                            </div>
                            <div class="col-auto pe-0 ps-1">
                                <i id="starWrite3" onclick="colorStars(this)" class="fa-regular fa-star" style="color: #f7a505; font-size: 2em;"></i>
                            </div>
                            <div class="col-auto pe-0 ps-1">
                                <i id="starWrite4" onclick="colorStars(this)" class="fa-regular fa-star" style="color: #f7a505; font-size: 2em;"></i>
                            </div>
                            <div class="col-auto ps-1">
                                <i id="starWrite5" onclick="colorStars(this)" class="fa-regular fa-star" style="color: #f7a505; font-size: 2em;"></i>
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="col fw-bold" style="font-size: 0.8em;">
                                <i class="fa-regular fa-pen-to-square"></i> 후기를 입력해주세요
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col">
                                <textarea id="writeContent" class="form-control focus-ring focus-ring-light" rows="10em" style="font-size: 0.85em;"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer border-0 pt-0 pb-2">
            	<div class="row">
            		<div id="pleaseWriteContent" class="col fw-bold" style="font-size: 0.8em; color: #7844ae">
            			
            		</div>
            	</div>
                <button id="registerButton" onclick="registerReview(this)" class="btn text-white fw-bold" style="background-color: #7844ae; font-size: 0.8em;">등록하기</button>
            </div>
        </div>
    </div>
</div>