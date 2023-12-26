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
    public List<EventListVO> eventList(int start, int numberPerPage) {
        return eventMapper.eventList((start - 1) * numberPerPage, numberPerPage);
    }

    @Override
    public List<EventListVO> endedEventList(int start, int numberPerPage) {
        return eventMapper.endedEventList(start, numberPerPage);
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
        
        // 이름 마스킹 처리
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
    
    @Override
    public int getCommentCount(int event_no) {
        return eventMapper.getCommentCount(event_no);
    }
    
    @Override
    public void saveComment(EventCommentVO comment, String username) {
        eventMapper.insertComment(comment);
    }

}