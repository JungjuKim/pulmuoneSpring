package org.pro.pulmuone.service.mypage.order;

import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.IllegalFormatCodePointException;
import java.util.Iterator;
import java.util.List;

import org.pro.pulmuone.domain.mypage.order.BoxOrderMypageProductsDTO;
import org.pro.pulmuone.domain.mypage.order.DrkChangesDTO;
import org.pro.pulmuone.domain.mypage.order.DrkOrderBillDTO;
import org.pro.pulmuone.domain.mypage.order.DrkOrderMypageDTO;
import org.pro.pulmuone.domain.mypage.order.DrkOrderMypageProductsDTO;
import org.pro.pulmuone.domain.order.daily.AcntInfoDTO;
import org.pro.pulmuone.domain.order.daily.DrkHistoryDTO;
import org.pro.pulmuone.domain.order.daily.DrkScheduleDTO;
import org.pro.pulmuone.domain.order.daily.DrkShipDTO;
import org.pro.pulmuone.mapper.mypage.order.DailyOrderMypageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class DailyOrderMypageServiceImpl implements DailyOrderMypageService {

	@Autowired
	private DailyOrderMypageMapper dailyOrderMypageMapper;
	
	@Override
	public DrkOrderMypageDTO selectDailyOrder(int member_no) {
		log.info("DailyOrderMypageServiceImpl.selectDailyOrder()...");
		return dailyOrderMypageMapper.selectDailyOrder(member_no);
	}

	@Override
	public List<DrkOrderMypageDTO> selectDrinkInfos(int member_no, String drinkingType) {
		log.info("DailyOrderMypageServiceImpl.selectDrinkInfos()...");
		return dailyOrderMypageMapper.selectDrinkInfos(member_no, drinkingType);
	}

	@Override
	public List<DrkOrderMypageDTO> selectDrinkInfos(int member_no) {
		log.info("DailyOrderMypageServiceImpl.selectDrinkInfos()...");
		return dailyOrderMypageMapper.selectDrinks(member_no);
	}

	@Override
	public DrkOrderMypageDTO selectDrinkInfo(int drk_order_no) {
		log.info("DailyOrderMypageServiceImpl.selectDrinkInfo()...");
		return dailyOrderMypageMapper.selectDrinkInfo(drk_order_no);
	}

	@Override
	public DrkShipDTO selectDrinkShip(int drk_order_no) {
		log.info("DailyOrderMypageServiceImpl.selectDrinkShip()...");
		return dailyOrderMypageMapper.selectDrinkShip(drk_order_no);
	}

	@Override
	public List<List<BoxOrderMypageProductsDTO>> selectNextWeekDrink(int drk_order_no) {
		log.info("DailyOrderMypageServiceImpl.selectNextWeekDrink()...");
		List<List<BoxOrderMypageProductsDTO>> list = new ArrayList<>();
		List<BoxOrderMypageProductsDTO> products = null;
		for (int i = 0; i < 5; i++) {
			products = dailyOrderMypageMapper.selectNextWeekDrink(drk_order_no, i);
			list.add(products);
		} // for
		return list;
	}

	@Override
	public int changeDrkOrderName(int drk_order_no, String drk_order_name) {
		log.info("DailyOrderMypageServiceImpl.changeDrkOrderName()...");
		return dailyOrderMypageMapper.changeDrkOrderName(drk_order_no, drk_order_name);
	}

	@Override
	public List<DrkOrderBillDTO> selectDrinkBills(int member_no, String searchDate) {
		log.info("DailyOrderMypageServiceImpl.selectDrinkBills()...");
		
		int year = 0, month = 0;
		if (searchDate == null) {
			LocalDate today = LocalDate.now();
			year = today.getYear();
			month = today.getMonthValue();
		} else {
			year = Integer.parseInt(searchDate.substring(0, 4));
			month = Integer.parseInt(searchDate.substring(4));
		} // if
		
		return dailyOrderMypageMapper.selectDailyBills(member_no, year, month); 
	}

	@Override
	public DrkOrderBillDTO selectDrinkBill(int drk_order_no) {
		log.info("DailyOrderMypageServiceImpl.selectDrinkBill()...");
		LocalDate today = LocalDate.now();
		int year = today.getYear();
		int month = today.getMonthValue();
		return dailyOrderMypageMapper.selectDailyBill(drk_order_no, year, month);
	}

	@Override
	public AcntInfoDTO selectAcntInfo(int pay_info_no) {
		log.info("DailyOrderMypageServiceImpl.selectAcntInfo()...");
		return dailyOrderMypageMapper.selectAcntInfo(pay_info_no);
	}

	@Override
	public int getNowPrice(int drk_order_no) {
		log.info("DailyOrderMypageServiceImpl.getNowPrice()...");
		return dailyOrderMypageMapper.getNowPrice(drk_order_no);
	}

	@Override
	public int stopOrder(int drk_order_no, Date drk_end_date) {
		log.info("DailyOrderMypageServiceImpl.stopOrder()...");
		dailyOrderMypageMapper.updateDrkOrderStatus(drk_order_no);
		dailyOrderMypageMapper.updateDrkScheduleEndDate(drk_order_no, drk_end_date);
		return dailyOrderMypageMapper.deleteDrkHistory(drk_order_no, drk_end_date);
	}

	@Override
	public List<DrkOrderMypageProductsDTO> selectDrkOrderMypageProducts(int drk_order_no) {
		log.info("DailyOrderMypageServiceImpl.stopOrder()...");
		return dailyOrderMypageMapper.selectDrkOrderMypageProducts(drk_order_no);
	}

	@Override
	public int updateDrkOrder(int drk_order_no, List<DrkScheduleDTO> drkNewScheduleList) {
		log.info("DailyOrderMypageServiceImpl.updateDrkOrder()...");
		int rowCnt = 0;
		
		// change_group_no 조회
		int change_group_no = dailyOrderMypageMapper.selectChangeGroupNo();
		
		// 기존 스케줄 가져오기
		List<DrkScheduleDTO> drkOldScheduleList = dailyOrderMypageMapper.selectDrkScheduleList(drk_order_no);
		
		Iterator<DrkScheduleDTO> ir = drkOldScheduleList.iterator();
		DrkScheduleDTO oldSchedule = null;
		DrkScheduleDTO newSchedule = null;
		String productsNo = null;
		int oldCnt[] = new int [5];
		int newCnt[] = new int [5];
		int changeCnt = 0;
		LocalDate drk_date = null;
		int prdCnt = 0;
		LocalDate end_date = null;
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSSX");
		DrkHistoryDTO drkHistoryDTO = null;
		int drk_dayOfWeek = 0; 
		
		// 기존 스케줄 변경
		while (ir.hasNext()) {
			oldSchedule = (DrkScheduleDTO) ir.next();
			productsNo = oldSchedule.getProducts_no();
			
			for (int i = 0; i < drkNewScheduleList.size(); i++) {
				newSchedule = drkNewScheduleList.get(i);
				newSchedule.setDrk_end_date(oldSchedule.getDrk_end_date());	 // 기존 스케줄의 end_date 가져오기
				
				// 같은 상품이라면?
				if (newSchedule.getProducts_no().equals(productsNo)) {
					newSchedule.setDrk_schedule_no(oldSchedule.getDrk_schedule_no());
					
					oldCnt[0] = oldSchedule.getMon_cnt();
					oldCnt[1] = oldSchedule.getTue_cnt();
					oldCnt[2] = oldSchedule.getWed_cnt();
					oldCnt[3] = oldSchedule.getThu_cnt();
					oldCnt[4] = oldSchedule.getFri_cnt();
					newCnt[0] = newSchedule.getMon_cnt();
					newCnt[1] = newSchedule.getTue_cnt();
					newCnt[2] = newSchedule.getWed_cnt();
					newCnt[3] = newSchedule.getThu_cnt();
					newCnt[4] = newSchedule.getFri_cnt();
				
					changeCnt = 0;
					for (int j = 0; j < 5; j++) {
						// 카운드 수가 다르다면?
						if(oldCnt[j] != newCnt[j]) {
							if (changeCnt == 0) {	// drk_schedule 수정 작업 한 번만 하기
								changeCnt = dailyOrderMypageMapper.changeDrkSchedule(newSchedule); 	// 기존 스케줄 변경
							} // if
	
							dailyOrderMypageMapper.changeDrkHistory(newSchedule);	// 기존 drk_history 삭제
							
							// 새 drk_history 추가
							end_date = oldSchedule.getDrk_end_date().toLocalDate();
							drk_date = LocalDate.parse(newSchedule.getDrk_start_date(), formatter);
							while (drk_date.isBefore(end_date) || drk_date.isEqual(end_date)) {		// start_date 부터 end_date까지 반복
								drk_dayOfWeek = drk_date.getDayOfWeek().getValue();
								
								// 주말일 때는 빠져나가기
								if (drk_dayOfWeek == 6) {
									drk_date = drk_date.plusDays(2);
									continue;
								} // if
	
								prdCnt = newCnt[drk_dayOfWeek-1];
								// 수량이 0일 때는 빠져나가기
								if (prdCnt == 0) {
									drk_date = drk_date.plusDays(1);
									continue;
								} // if
								
								drkHistoryDTO = DrkHistoryDTO.builder()
																			.drk_schedule_no(newSchedule.getDrk_schedule_no())
																			.drk_order_no(drk_order_no)
																			.products_no(productsNo)
																			.products_cnt(prdCnt)
																			.drk_complete(0)
																			.drk_date(Date.valueOf(drk_date))
																			.drk_day(i+1)
																			.build();
								dailyOrderMypageMapper.insertDrkHistory(drkHistoryDTO);		// 새 drk_history 추가
								
								drk_date = drk_date.plusDays(1);
							} // while history
							
							DrkChangesDTO changesDTO = DrkChangesDTO.builder()
																								.drk_schedule_no(newSchedule.getDrk_schedule_no())
																								.drk_order_no(drk_order_no)
																								.change_type(1)
																								.change_start_date(Date.valueOf(newSchedule.getDrk_start_date().substring(0, 10)))
																								.change_end_date(newSchedule.getDrk_end_date())
																								.products_no(newSchedule.getProducts_no())
																								.before_cnt(oldCnt[j])
																								.after_cnt(newCnt[j])
																								.is_new(0)
																								.day_of_week(j+1)
																								.change_group_no(change_group_no)
																							.build();
							rowCnt += dailyOrderMypageMapper.insertDrkChanges(changesDTO); 	// drk 변경 내역 추가
						} // if 카운트 수가 다르다면?
					} // for cnt

		            // newScheduleList에서 제거
		            drkNewScheduleList.remove(i);
		            // 루프를 빠져나감
		            break;
		            
				} // if 같은 상품이라면?
			} // for new
		} // while old
		
		// 새 상품이 남아있다면 추가
		Iterator<DrkScheduleDTO> ir2 = drkNewScheduleList.iterator();
		while (ir2.hasNext()) {
			newSchedule = ir2.next();
			newSchedule.setDrk_end_date(oldSchedule.getDrk_end_date());	 // 기존 스케줄의 end_date 가져오기
			dailyOrderMypageMapper.insertDrkSchedule(newSchedule);
			
			// 새 drk_history 추가
			end_date = oldSchedule.getDrk_end_date().toLocalDate();
			drk_date = LocalDate.parse(newSchedule.getDrk_start_date(), formatter);
			while (drk_date.isBefore(end_date) || drk_date.isEqual(end_date)) {		// start_date 부터 end_date까지 반복
				drk_dayOfWeek = drk_date.getDayOfWeek().getValue();
				switch (drk_dayOfWeek) {
				case 1:
					prdCnt = newSchedule.getMon_cnt();
					break;
				case 2:
					prdCnt = newSchedule.getTue_cnt();
					break;
				case 3:
					prdCnt = newSchedule.getWed_cnt();
					break;
				case 4:
					prdCnt = newSchedule.getThu_cnt();
					break;
				case 5:
					prdCnt = newSchedule.getFri_cnt();
					break;
				case 6:
					// 주말일 때는 빠져나가기
					drk_date = drk_date.plusDays(2);
					continue;
				} // switch

				// 수량이 0일 때는 빠져나가기
				if (prdCnt == 0) {
					drk_date = drk_date.plusDays(1);
					continue;
				} // if
				
				drkHistoryDTO = DrkHistoryDTO.builder()
															.drk_schedule_no(newSchedule.getDrk_schedule_no())
															.drk_order_no(drk_order_no)
															.products_no(newSchedule.getProducts_no())
															.products_cnt(prdCnt)
															.drk_complete(0)
															.drk_date(Date.valueOf(drk_date))
															.drk_day(drk_dayOfWeek)
															.build();
				dailyOrderMypageMapper.insertDrkHistory(drkHistoryDTO);		// 새 drk_history 추가
				
				drk_date = drk_date.plusDays(1);
			} // while history
			
			newCnt[0] = newSchedule.getMon_cnt();
			newCnt[1] = newSchedule.getTue_cnt();
			newCnt[2] = newSchedule.getWed_cnt();
			newCnt[3] = newSchedule.getThu_cnt();
			newCnt[4] = newSchedule.getFri_cnt();
			
			for (int i = 0; i < 5; i++) {
				// cnt가 0이면 빠져나가기
				if (newCnt[i] == 0) continue;
				
				DrkChangesDTO changesDTO = DrkChangesDTO.builder()
																						.drk_schedule_no(newSchedule.getDrk_schedule_no())
																						.drk_order_no(drk_order_no)
																						.change_type(1)
																						.change_start_date(Date.valueOf(newSchedule.getDrk_start_date().substring(0,10)))
																						.change_end_date(newSchedule.getDrk_end_date())
																						.products_no(newSchedule.getProducts_no())
																						.before_cnt(0)
																						.after_cnt(newCnt[i])
																						.is_new(1)
																						.day_of_week(i+1)
																						.change_group_no(change_group_no)
																					.build();
				rowCnt += dailyOrderMypageMapper.insertDrkChanges(changesDTO);
			} // for changes
		} // while
		
		return rowCnt;
	}

	@Override
	public List<DrkChangesDTO> selectDrkChanges(int drk_order_no) {
		log.info("DailyOrderMypageServiceImpl.selectDrkChanges()...");
		return dailyOrderMypageMapper.selectDrkChanges(drk_order_no);
	}

	@Override
	public List<DrkChangesDTO> selectDrkChange(int change_group_no) {
		log.info("DailyOrderMypageServiceImpl.selectDrkChange()...");
		return dailyOrderMypageMapper.selectDrkChange(change_group_no);
	}
	
}
