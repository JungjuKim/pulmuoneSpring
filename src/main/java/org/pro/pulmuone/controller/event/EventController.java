package org.pro.pulmuone.controller.event;

import java.util.ArrayList;
import java.util.HashMap;

import org.pro.pulmuone.domain.PageDTO;
import org.pro.pulmuone.domain.event.EventVO;
import org.pro.pulmuone.service.event.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/event/*")
public class EventController {
	
	@Autowired
    private EventService eventService;

    @GetMapping("list")
    public String getEventList(@RequestParam(value = "currentpage", defaultValue = "1") int currentPage, Model model) {
        int numberPerPage = 10; // �� �������� ����� �Խñ� ��
        int numberOfPageBlock = 10;
        int totalPages = 0; // �� ������ ��

        HashMap<String, ArrayList<EventVO>> eventMap = null;
        try {
            eventMap = eventService.getEvents(currentPage, numberPerPage);
            totalPages = eventService.getTotalPages(numberPerPage);
            PageDTO pDto = new PageDTO(currentPage, numberPerPage, numberOfPageBlock, totalPages);
            
            // ���� ���� �̺�Ʈ ����Ʈ�� �����ɴϴ�.
            ArrayList<EventVO> onEvent = eventMap.get("onEvent");

            // 1. ������ �� ������ ����
            model.addAttribute("onEvent", onEvent);
            model.addAttribute("pDto", pDto);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "event/list";
    }
	
}

