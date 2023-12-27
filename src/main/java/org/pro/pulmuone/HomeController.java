package org.pro.pulmuone;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.pro.pulmuone.domain.cart.CartVO;
import org.pro.pulmuone.domain.mypage.order.DrkOrderMypageDTO;
import org.pro.pulmuone.domain.notice.NoticeDTO;
import org.pro.pulmuone.domain.order.OrderAddrBookDTO;
import org.pro.pulmuone.domain.product.ProductsDTO;
import org.pro.pulmuone.mapper.cart.CartMapper;
import org.pro.pulmuone.mapper.main.MainMapper;
import org.pro.pulmuone.service.mypage.order.DailyOrderMypageServiceImpl;
import org.pro.pulmuone.service.notice.NoticeService;
import org.pro.pulmuone.service.order.OrderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/")
public class HomeController {

  @Autowired
  private MainMapper mainMapper;

  @Autowired
  private CartMapper cartMapper;

  @Autowired
  private NoticeService noticeService;

  @Autowired
  private DailyOrderMypageServiceImpl dailyOrderMypageServiceImpl;

  @Autowired
  private OrderServiceImpl orderServiceImpl;

  public HomeController() {
	super();
  }

  @RequestMapping("index")
  public String home(Model model, Principal principal) throws Exception {
	log.warn("> INDEX START ...");
	List<ProductsDTO> mainbestlist = this.mainMapper.get();
	List<NoticeDTO> noticelist = noticeService.getNoticeList(1, 10);
	if(principal != null) {
	String username = principal.getName();	
	OrderAddrBookDTO member = orderServiceImpl.getMemberInfo(username);
	model.addAttribute("member", member);
	int member_no = member.getMember_no();
	List<DrkOrderMypageDTO> drkOrderMypageList = this.dailyOrderMypageServiceImpl.selectDrinkInfos(member_no, "0");
	model.addAttribute("drkOrderMypageList", drkOrderMypageList);
	}
	model.addAttribute("mainbestlist", mainbestlist);
	model.addAttribute("noticelist", noticelist);
	return "home.index";
  }

  @RequestMapping("cart")
  public String cart(Model model, CartVO vo, Principal principal) throws Exception {
	vo.setMember_id(principal.getName());
	int count = this.cartMapper.cart(vo);
	model.addAttribute("count", count);
	return "home.index";

  }
}
