package org.pro.pulmuone.service.mypage.order;

import java.sql.Date;
import java.util.List;

import org.pro.pulmuone.domain.mypage.order.BoxOrderMypageProductsDTO;
import org.pro.pulmuone.domain.mypage.order.DrkChangesDTO;
import org.pro.pulmuone.domain.mypage.order.DrkOrderBillDTO;
import org.pro.pulmuone.domain.mypage.order.DrkOrderMypageDTO;
import org.pro.pulmuone.domain.mypage.order.DrkOrderMypageProductsDTO;
import org.pro.pulmuone.domain.order.daily.AcntInfoDTO;
import org.pro.pulmuone.domain.order.daily.DrkScheduleDTO;
import org.pro.pulmuone.domain.order.daily.DrkShipDTO;

public interface DailyOrderMypageService {

	DrkOrderMypageDTO selectDailyOrder(int member_no);

	List<DrkOrderMypageDTO> selectDrinkInfos(int member_no, String drinkingType);
	List<DrkOrderMypageDTO> selectDrinkInfos(int member_no);

	DrkOrderMypageDTO selectDrinkInfo(int drk_order_no);

	DrkShipDTO selectDrinkShip(int drk_order_no);

	List<List<BoxOrderMypageProductsDTO>> selectNextWeekDrink(int drk_order_no);

	int changeDrkOrderName(int drk_order_no, String drk_order_name);

	List<DrkOrderBillDTO> selectDrinkBills(int member_no, String searchDate);

	DrkOrderBillDTO selectDrinkBill(int drk_order_no);

	AcntInfoDTO selectAcntInfo(int pay_info_no);

	int getNowPrice(int drk_order_no);

	int stopOrder(int drk_order_no, Date drk_end_date);

	List<DrkOrderMypageProductsDTO> selectDrkOrderMypageProducts(int drk_order_no);

	int updateDrkOrder(int drk_order_no, List<DrkScheduleDTO> drkScheduleList);

	List<DrkChangesDTO> selectDrkChanges(int drk_order_no);

	List<DrkChangesDTO> selectDrkChange(int change_group_no);

	
}
