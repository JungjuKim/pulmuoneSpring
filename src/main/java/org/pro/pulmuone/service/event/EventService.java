package org.pro.pulmuone.service.event;

import java.util.List;

import org.pro.pulmuone.domain.event.EventCommentVO;
import org.pro.pulmuone.domain.event.EventListVO;
import org.pro.pulmuone.domain.event.EventViewVO;

public interface EventService {
	
	List<EventListVO> eventList(int start, int numberPerPage);
	List<EventListVO> endedEventList(int start, int numberPerPage);
	
    int getTotalRecords();
    int getTotalPages(int numberPerPage);
    
    EventViewVO viewEvent(int event_no);
    
    List<EventCommentVO> getComments(int event_no, int currentPage, int numberPerPage);
    
    int getCommentCount(int event_no);
    
    void saveComment(EventCommentVO comment, String username);
    
}