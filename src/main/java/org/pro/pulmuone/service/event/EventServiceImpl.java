package org.pro.pulmuone.service.event;

import java.util.List;

import org.pro.pulmuone.domain.event.EventCommentVO;
import org.pro.pulmuone.domain.event.EventListVO;
import org.pro.pulmuone.domain.event.EventViewVO;
import org.pro.pulmuone.mapper.event.EventMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EventServiceImpl implements EventService {

    @Autowired
    private EventMapper eventMapper;

    @Override
    public List<EventListVO> eventList() {
        return eventMapper.eventList();
    }

    @Override
    public List<EventListVO> endedEventList() {
        return eventMapper.endedEventList();
    }
    
    @Override
    public int getTotalRecords() {
        return eventMapper.getTotalRecords();
    }

    @Override
    public int getTotalPages(int numberPerPage) {
        return eventMapper.getTotalPages(numberPerPage);
    }
    
    @Override
    public EventViewVO viewEvent(int event_no) {
        return eventMapper.viewEvent(event_no);
    }

    @Override
    public List<EventCommentVO> getComments(int event_no, int currentPage, int numberPerPage) {
        int start = (currentPage - 1) * numberPerPage + 1;
        int end = start + numberPerPage - 1;

        List<EventCommentVO> comments = eventMapper.getComments(event_no, start, end);
        
        // �̸� ����ŷ ó��
        for (EventCommentVO comment : comments) {
            String name = comment.getName();
            if (name.length() > 2) {
                name = name.charAt(0) + "*".repeat(name.length() - 2) + name.charAt(name.length() - 1);
            } else if (name.length() == 2) {
                name = name.charAt(0) + "*";
            }
            comment.setName(name);
        }
        
        return comments;
    }

}