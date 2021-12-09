package com.lec.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.spring.domain.BoardDAO;
import com.lec.spring.domain.BoardDTO;

@Service
public class BoardService {
	
	BoardDAO dao; // dao 호출
	
	@Autowired
	public void setDao(BoardDAO dao) {
		this.dao = dao;
	}
	
	// 전체선택
	public List<BoardDTO> selectAll(){
		return dao.selectAll();
	}
	
	// 게시글 하나 선택
	public List<BoardDTO> selectOne(int uid){
		return dao.selectOne(uid);
	}
	
	// 게시글 수정
	public int updateBoard(BoardDTO dto) {
		return dao.updateBoard(dto);
	}
	
	// 게시글 삭제
	public int deleteBoard(int uid) {
		return dao.deleteBoard(uid);
	}
	
	// 게시글 작성
	public int insertBoard(BoardDTO dto){
		return dao.insertBoard(dto);
	}
}
