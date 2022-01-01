package com.lec.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lec.spring.domain.BoardDTO;
import com.lec.spring.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	BoardService boardService;
	
	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	// 전체 게시글 선택 
	@RequestMapping("/list")   // 게시글 목록 보기 맵핑
	public String list(@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="pageCnt", defaultValue="10") int pageCnt, Model model) {
		
		int lastPage = (page - 1) * pageCnt; // 페이지에 나타낼 게시글 수에 따라 곱하는 수가 바뀜
		
//		model.addAttribute("list", boardService.selectAll());
		model.addAttribute("allCnt", boardService.selectAllCnt()); // 게시글 전체 갯수 
		model.addAttribute("pageCnt", pageCnt); // 한 페이지에 나타내는 게시글 수
		model.addAttribute("list", boardService.selectPageList(pageCnt, lastPage)); // DB에 담겨있는 게시글 정보 전체 불러오기
		model.addAttribute("page", page);
		
		return "list";
	}
	
	// 게시글 작성
	@RequestMapping("/write")
	public String write() {
		return "write";  // 게시글 작성 페이지 맵핑
	}
	
	// 게시글 작성 OK
	@PostMapping("/writeOk")
	public String writeOk(Model model, BoardDTO dto) {
//		System.out.println("OKOK");
//		System.out.println(dto.toString());
		model.addAttribute("result", boardService.insertBoard(dto));   // 게시글 작성 완료
		
		return "writeOk";
	}
	
	// 게시글 하나 선택
	@RequestMapping("/info")
	public String info(int uid,Model model, BoardDTO dto) {
//		System.out.println("맵핑성공");
//		System.out.println(boardService.selectOne(uid).toString());
		model.addAttribute("dto", boardService.selectOne(uid));
		
		return "info";
	}
	
	@RequestMapping("/deleteOk")
	public String delete(int uid, Model model) {
		model.addAttribute("result", boardService.deleteBoard(uid)); 
		return "deleteOk";
	}
	
	@RequestMapping("/update")
	public String update(int uid, Model model) {
		model.addAttribute("dto", boardService.selectOne(uid)); 
		return "update";
	}
	
	@RequestMapping("/updateOk")
	public String updateOk(Model model, BoardDTO dto) {
//		System.out.println(dto.toString());
		model.addAttribute("result", boardService.updateBoard(dto)); 
		model.addAttribute("uid", dto.getUid());
		return "updateOk";
	}
}
