package com.mkfactory.toothless.d.hc.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.mkfactory.toothless.d.dto.NoticeStaffBoardDto;
import com.mkfactory.toothless.d.dto.QnABoardDto;
import com.mkfactory.toothless.d.hc.board.mapper.HcBoardSqlMapper;
import com.mkfactory.toothless.donot.touch.dto.StaffInfoDto;

@Service
public class HcBoardServiceImpl {
	@Autowired
	private HcBoardSqlMapper hcBoardSqlMapper;
	
	
	public void ramses(QnABoardDto qnABoardDto) {
		
		hcBoardSqlMapper.insert(qnABoardDto);
	}
	//리스트 출력
	public List<Map<String, Object>> getArticleList() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		
		List<QnABoardDto> articleList =
				hcBoardSqlMapper.selectAll();
		
		for(QnABoardDto qnaBoardDto : articleList ) {	
			int staff_pk = qnaBoardDto.getStaff_pk();
			StaffInfoDto staffInfoDto = hcBoardSqlMapper.selectBypk(staff_pk);
			//System.out.println(staffInfoDto.getName()+"이름");
			Map<String, Object> map = new HashMap<>();
			map.put("qnaBoardDto", qnaBoardDto);
			map.put("staffInfoDto", staffInfoDto);
			
			list.add(map);
		}
		return list;
		
	}
	//상세글보기
	public Map<String, Object> getArticle(int gambare){
		
		Map<String, Object> map = new HashMap<>();
		
		QnABoardDto qnABoardDto = hcBoardSqlMapper.selectById(gambare);
		
		int staff_pk = qnABoardDto.getStaff_pk();
		StaffInfoDto staffInfoDto = hcBoardSqlMapper.selectBypk(staff_pk);
		
		map.put("qnABoardDto", qnABoardDto);
		map.put("staffInfoDto", staffInfoDto);
		
		return map;
	}
	//삭제
	public void deletegam(int board_pk) {
		hcBoardSqlMapper.delete(board_pk);
	}
	//수정
	public void updateart (QnABoardDto qnABoardDto) {
	
		hcBoardSqlMapper.update(qnABoardDto);
		
	}
	
	public void rara(NoticeStaffBoardDto noticeStaffBoardDto) {
		
		hcBoardSqlMapper.notice(noticeStaffBoardDto);
	}
	
	public List<Map<String, Object>> noticeList() {
		
		List<Map<String, Object>> noticelist = new ArrayList<>();
		
		
		List<NoticeStaffBoardDto> noticeDtolist = 
				hcBoardSqlMapper.selectNoticeAll();
		
		for(NoticeStaffBoardDto noticeStaffBoardDto   : noticeDtolist) {
			//글번호확인
			System.out.println("전");
			int staff_pk = noticeStaffBoardDto.getStaff_pk();
			System.out.println(staff_pk+"승태pk");
			StaffInfoDto staffInfoDto = hcBoardSqlMapper.selectBynoticepk(staff_pk);	
			
			//맵생성
			Map<String, Object> map =new HashMap<>();
			map.put("noticeStaffBoardDto", noticeStaffBoardDto);
			map.put("staffInfoDto", staffInfoDto);
			noticelist.add(map);
		}
		return noticelist;
	}
	public Map<String, Object> getnotice(int noticepk){
		
		Map<String, Object> map = new HashMap<>();
		
		NoticeStaffBoardDto noBoardDto = hcBoardSqlMapper.selectpk(noticepk);
		int staff_pk = noBoardDto.getStaff_pk();
		StaffInfoDto staffInfoDto = hcBoardSqlMapper.selectBynoticepk(staff_pk);
		map.put("noBoardDto", noBoardDto);
		map.put("staffInfoDto", staffInfoDto);
		
		return map;	
	}
	public void deleteno(int noticeid) {
		
		hcBoardSqlMapper.deletenotice(noticeid);

	}
	
	public void upup(NoticeStaffBoardDto noticeStaffBoardDto) {
		
		hcBoardSqlMapper.updateno(noticeStaffBoardDto);
		
	}
	
	public List<NoticeStaffBoardDto> getNoticeBordRowNum(){
		List<NoticeStaffBoardDto> list = hcBoardSqlMapper.getNoticeBordRowNum();
		
		return list;
	}
	
}
