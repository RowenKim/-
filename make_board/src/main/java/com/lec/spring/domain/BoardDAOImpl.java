package com.lec.spring.domain;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	private BoardDAO mapper;
	
	@Autowired
	public BoardDAOImpl(SqlSession sqlSession) {
		System.out.println("BoardDAOImpl() 생성");
		mapper = sqlSession.getMapper(BoardDAO.class);
	}
	
	@Override
	public List<BoardDTO> selectAll() {
		return mapper.selectAll();
	}

	@Override
	public List<BoardDTO> selectOne(int uid) {
		return mapper.selectOne(uid);
	}

	@Override
	public int insertBoard(BoardDTO dto) {
		return mapper.insertBoard(dto);
	}

	@Override
	public int updateBoard(BoardDTO dto) {
		return mapper.updateBoard(dto);
	}

	@Override
	public int deleteBoard(int uid) {
		return mapper.deleteBoard(uid);
	}

	@Override
	public List<BoardDTO> selectPageList(int pageCnt, int lastPage) {
		return mapper.selectPageList(pageCnt, lastPage);
	}

	@Override
	public int selectAllCnt() {
		return mapper.selectAllCnt();
	}

}
