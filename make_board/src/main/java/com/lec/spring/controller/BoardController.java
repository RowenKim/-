package com.lec.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	@RequestMapping("/list")
	public String list(Model model) {
		
		model.addAttribute("list", boardService.selectAll());
		
		return "list";
	}
	
	// 게시글 작성
	@RequestMapping("/write")
	public String write() {
		
		return "write";
	}
	
	// 게시글 작성 OK
	@PostMapping("/writeOk")
	public String writeOk(Model model, BoardDTO dto) {
		System.out.println("OKOK");
		System.out.println(dto.toString());
		model.addAttribute("result", boardService.insertBoard(dto));
		
		return "writeOk";
	}
	
	// 게시글 하나 선택
	@RequestMapping("/info")
	public String info(int uid,Model model, BoardDTO dto) {
		System.out.println("맵핑성공");
		System.out.println(boardService.selectOne(uid).toString());
		model.addAttribute("dto", boardService.selectOne(uid));
		
		return "info";
	}
}
