<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id="reviewModal" class="modal fade" tabindex="-1">
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
                               <i class="fa-regular fa-star"></i> 별점
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-auto pe-0">
                                <i id="starShow1" class="fa-solid fa-star" style="color: #f7a505; font-size: 2em;"></i>
                            </div>
                            <div class="col-auto pe-0 ps-1">
                                <i id="starShow2" class="fa-regular fa-star" style="color: #f7a505; font-size: 2em;"></i>
                            </div>
                            <div class="col-auto pe-0 ps-1">
                                <i id="starShow3" class="fa-regular fa-star" style="color: #f7a505; font-size: 2em;"></i>
                            </div>
                            <div class="col-auto pe-0 ps-1">
                                <i id="starShow4" class="fa-regular fa-star" style="color: #f7a505; font-size: 2em;"></i>
                            </div>
                            <div class="col-auto ps-1">
                                <i id="starShow5" class="fa-regular fa-star" style="color: #f7a505; font-size: 2em;"></i>
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="col fw-bold" style="font-size: 0.8em;">
                                <i class="fa-regular fa-pen-to-square"></i> 후기
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div id="showContent" class="col border rounded mx-2 py-3" style="font-size: 0.85em;">
                                아주 재미있었습니다 강사님도 친절하세요
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer border-0 pt-0 pb-2 pe-2">
                <button class="btn text-white fw-bold" style="background-color: #7844ae; font-size: 0.8em;" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>