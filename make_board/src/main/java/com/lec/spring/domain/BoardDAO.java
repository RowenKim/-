package com.lec.spring.domain;

import java.util.List;

public interface BoardDAO {
	// 전체 게시글 선택
	public abstract List<BoardDTO> selectAll();
	
	// 게시글 한개 선택
	public abstract List<BoardDTO> selectOne(int uid);
	
	// 게시글 작성
	public abstract int insertBoard(BoardDTO dto);
	
	// 게시글 수정
	public abstract int updateBoard(BoardDTO dto);
	
	// 게시글 삭제
	public abstract int deleteBoard(int uid);
	
	// 게시글 페이징 처리
	public abstract List<BoardDTO> selectPageList(int pageCnt, int lastPage);
	
	// 전체 게시글 수 
	public abstract int selectAllCnt();
}
