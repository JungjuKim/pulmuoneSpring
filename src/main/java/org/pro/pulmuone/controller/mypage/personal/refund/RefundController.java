package org.pro.pulmuone.controller.mypage.personal.refund;

import java.util.List;

import org.pro.pulmuone.domain.mypage.personal.refund.RefundDTO;
import org.pro.pulmuone.domain.mypage.personal.refund.RefundInsttDTO;
import org.pro.pulmuone.security.domain.CurrentUser;
import org.pro.pulmuone.service.mypage.personal.refund.RefundService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage/personal/*")
@Log4j
public class RefundController {

	@Autowired
	private RefundService refundService;
	
	// 환불계좌 관리 페이지 : 등록된 환불계좌를 보여줌
	@GetMapping("/refund")
	public String list(Authentication authentication, Model model) {
		log.warn("> RefundController list()...");
	
		// 로그인한 회원의 회원 번호 가져오기
        CurrentUser user = (CurrentUser) authentication.getPrincipal();
		int memberNo = user.getMember().getMemberNo();
		
		RefundDTO dto = this.refundService.getRefundAcct(memberNo);
		
		if (dto != null) {
			String acctNum = dto.getAcctNum();
			String maskedAcctNum = acctNum.length() < 6 ? "*****" : String.format("%s*****", acctNum.substring(0,acctNum.length()-5));
			
			model.addAttribute("maskedAcctNum", maskedAcctNum);
			
		} else {
			model.addAttribute("memberNo", memberNo);
		}
		
		model.addAttribute("dto", dto);
		
		return "mypage/personal/refund/list.tiles";
	}
	
	// 환불계좌 등록 페이지 : 등록된 환불계좌가 없는 경우, 버튼의 링크는 /refund/write
	@GetMapping("/refund/write")
	public String write(Authentication authentication, Model model) {
		log.warn("> RefundController write()...");
		
		// 로그인한 회원의 회원 번호 가져오기
        CurrentUser user = (CurrentUser) authentication.getPrincipal();
		int memberNo = user.getMember().getMemberNo();
		
		List<RefundInsttDTO> insttDtoList = this.refundService.getAllRefundInstt();
		
		model.addAttribute("memberNo", memberNo);
		model.addAttribute("insttDtoList", insttDtoList);
		
		return "mypage/personal/refund/write.tiles";
	}
	
	// 환불계좌 수정 페이지 : 환불계좌 수정 화면에 뿌려줄 정보 가져옴
	@GetMapping("/refund/{memberNo}")
	public String modify(Authentication authentication, Model model) {
		log.warn("> RefundController modify()...");
		
		// 로그인한 회원의 회원 번호 가져오기
        CurrentUser user = (CurrentUser) authentication.getPrincipal();
		int memberNo = user.getMember().getMemberNo();
		
		RefundDTO dto = this.refundService.getRefundAcct(memberNo);
		List<RefundInsttDTO> insttDtoList = this.refundService.getAllRefundInstt();
		
		model.addAttribute("dto", dto);
		model.addAttribute("insttDtoList", insttDtoList);

		return "mypage/personal/refund/write.tiles";
	}
	
}
