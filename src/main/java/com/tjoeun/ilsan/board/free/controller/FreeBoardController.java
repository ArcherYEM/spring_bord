package com.tjoeun.ilsan.board.free.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FreeBoardController {
	
	@RequestMapping(value="/board/writeView", method = RequestMethod.GET)
	public String writeView() {
		return "board/free/writeView";
	}

}
