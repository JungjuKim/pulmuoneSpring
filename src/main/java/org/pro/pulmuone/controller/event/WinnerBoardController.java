package org.pro.pulmuone.controller.event;

import java.util.List;

import org.pro.pulmuone.domain.PageDTO;
import org.pro.pulmuone.domain.event.EventWinnerVO;
import org.pro.pulmuone.service.event.WinnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/event/*")
public class WinnerBoardController {

	@Autowired
	private WinnerService winnerService;

	@GetMapping("winner")
	public String getEventWinnerList(Model model, @RequestParam(defaultValue = "1") int currentPage) {
	    int numberPerPage = 10; // 페이지당 아이템 수를 설정합니다.
	    int numberOfPageBlock = 10; // 페이지 블록 수를 설정합니다.

	    int totalRecords = winnerService.getTotalRecords();
	    int totalPages = (totalRecords + numberPerPage - 1) / numberPerPage;

	    int start = (currentPage - 1) * numberPerPage + 1;
	    int end = start + numberPerPage - 1;

	    List<EventWinnerVO> eventWinners = winnerService.selectList(start, end);
	    model.addAttribute("eventWinners", eventWinners);
	    
	    PageDTO pageDTO = new PageDTO(currentPage, numberPerPage, numberOfPageBlock, totalPages);
	    model.addAttribute("pageDTO", pageDTO);
		
	    // 총 게시물 수를 모델에 추가합니다.
	    model.addAttribute("totalWinners", totalRecords);

	    return "event/winner.tiles";
	}


	@GetMapping("winner/view")
	public String getWinner(@RequestParam("win_board_no") int win_board_no, Model model) {
	    EventWinnerVO winner = winnerService.getWinner(win_board_no);
	    model.addAttribute("winnerView", winner);
	    return "event/winView.tiles";
	}


}
