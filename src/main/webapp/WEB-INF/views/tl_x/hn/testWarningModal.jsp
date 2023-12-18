<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="testWarningModal" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body text-center fw-bold pt-4" style="font-size: 0.9em;">
                <p class="mb-0">※ 응시하기 버튼을 누르면 시험이 바로 시작됩니다</p>
                <p class="mb-0">※ 시험이 시작되면 제출하기 전까지 뒤로 갈 수 없습니다</p>
                <p class="mb-0">※ 답안 제출 후 점수가 바로 채점됩니다</p>
                <p class="mt-4 mb-0">시험을 응시하시겠습니까?</p>
            </div>
            <div class="modal-footer pb-3 border-0 justify-content-center">
                <button class="btn btn-secondary me-3" style="font-size: 0.8em;" data-bs-dismiss="modal">닫기</button>
                <button onclick="showTestModal()" class="btn text-white fw-bold" style="background-color: #7844ae; font-size: 0.8em;">응시하기</button>
            </div>
        </div>
    </div>
</div>