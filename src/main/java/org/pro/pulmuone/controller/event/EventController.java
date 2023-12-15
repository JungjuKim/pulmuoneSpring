package org.pro.pulmuone.controller.event;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.pro.pulmuone.domain.PageDTO;
import org.pro.pulmuone.domain.event.EventCommentVO;
import org.pro.pulmuone.domain.event.EventListVO;
import org.pro.pulmuone.domain.event.EventViewVO;
import org.pro.pulmuone.service.event.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/event/event/*")
public class EventController {
	
	@Autowired
	private EventService eventService;

	@GetMapping("list")
	public String list(Model model, HttpServletRequest request, @RequestParam(value = "pageNo", defaultValue = "1") int currentPage) {
	    int numberPerPage = 10; // �������� ������ ���� �����մϴ�.

	    int totalRecords = eventService.getTotalRecords();
	    int totalPages = (totalRecords + numberPerPage - 1) / numberPerPage;
	    int numberOfPageBlock = 10; // ������ ��� ���� �����մϴ�.

	    int start = (currentPage - 1) * numberPerPage + 1;
	    int end = start + numberPerPage - 1;

	    List<EventListVO> events = eventService.eventList(start, end);
	    
	    String contextPath = request.getServletContext().getContextPath();
	    for (EventListVO event : events) {
	        if (event.getThumbnail() != null) {
	            String absoluteImgPath = contextPath + event.getThumbnail().getImg_path();
	            event.getThumbnail().setImg_path(absoluteImgPath);
	            System.out.println(absoluteImgPath);
	        }
	    }
	    
	    PageDTO pageDTO = new PageDTO(currentPage, numberPerPage, numberOfPageBlock, totalPages);
	    model.addAttribute("pageDTO", pageDTO);
	    model.addAttribute("events", events);

	    request.getSession().setAttribute("activeTab", "�������̺�Ʈ");
	    return "event/list.tiles";
	}

	@GetMapping("endList")
	public String endList(Model model, HttpServletRequest request, @RequestParam(value = "pageNo", defaultValue = "1") int currentPage) {
	    int numberPerPage = 10; // �������� ������ ���� �����մϴ�.

	    int totalRecords = eventService.getTotalRecords();
	    int totalPages = (totalRecords + numberPerPage - 1) / numberPerPage;
	    int numberOfPageBlock = 10; // ������ ��� ���� �����մϴ�.

	    int start = (currentPage - 1) * numberPerPage + 1;
	    int end = start + numberPerPage - 1;

	    List<EventListVO> events = eventService.endedEventList(start, end);
	    
	    String contextPath = request.getServletContext().getContextPath();
	    for (EventListVO event : events) {
	        if (event.getThumbnail() != null) {
	            String absoluteImgPath = contextPath + event.getThumbnail().getImg_path();
	            event.getThumbnail().setImg_path(absoluteImgPath);
	        }
	    }
	    
	    PageDTO pageDTO = new PageDTO(currentPage, numberPerPage, numberOfPageBlock, totalPages);
	    model.addAttribute("pageDTO", pageDTO);
	    model.addAttribute("events", events);

	    request.getSession().setAttribute("activeTab", "������̺�Ʈ");
	    return "event/endList.tiles";
	}
	
	@GetMapping("view")
	public String view(@RequestParam int event_no, Model model, HttpServletRequest request) {
		
		
		
	    EventViewVO event = eventService.viewEvent(event_no);
	    model.addAttribute("event", event);
	    
	    List<EventCommentVO> comments = eventService.getComments(event_no, 1, 10); // ù �������� ��� 10���� ������
	    model.addAttribute("comments", comments);
	    
	    if (event_no == 2) {
	        request.getSession().setAttribute("activeTab", "ģ���ʴ�");
	    } else if (event_no == 25) {
	        request.getSession().setAttribute("activeTab", "ȸ������");
	    } else {
	        request.getSession().setAttribute("activeTab", "�������̺�Ʈ");
	    }
	    
	    return "event/view.tiles";
	}

	/*
	@GetMapping("winner")
	public String winner(Model model, HttpServletRequest request) {
		// ��÷�� ������ �������� �ڵ带 ���⿡ �ۼ��Ͻʽÿ�.

		request.getSession().setAttribute("activeTab", "��÷�ڹ�ǥ");

		return "winnerList";
	}

	
	*/
}
