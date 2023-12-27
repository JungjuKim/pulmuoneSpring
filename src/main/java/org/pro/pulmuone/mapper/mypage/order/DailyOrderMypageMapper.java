package org.pro.pulmuone.mapper.mypage.order;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.pro.pulmuone.domain.mypage.order.BoxOrderMypageProductsDTO;
import org.pro.pulmuone.domain.mypage.order.DrkChangesDTO;
import org.pro.pulmuone.domain.mypage.order.DrkOrderBillDTO;
import org.pro.pulmuone.domain.mypage.order.DrkOrderMypageDTO;
import org.pro.pulmuone.domain.mypage.order.DrkOrderMypageProductsDTO;
import org.pro.pulmuone.domain.order.daily.AcntInfoDTO;
import org.pro.pulmuone.domain.order.daily.DrkHistoryDTO;
import org.pro.pulmuone.domain.order.daily.DrkScheduleDTO;
import org.pro.pulmuone.domain.order.daily.DrkShipDTO;

@Mapper
public interface DailyOrderMypageMapper {

	DrkOrderMypageDTO selectDailyOrder(int member_no);

	List<DrkOrderMypageDTO> selectDrinkInfos(@Param("member_no") int member_no, @Param("drinkingType") String drinkingType);
	List<DrkOrderMypageDTO> selectDrinks(int member_no);

	DrkOrderMypageDTO selectDrinkInfo(int drk_order_no);

	DrkShipDTO selectDrinkShip(int drk_order_no);

	List<BoxOrderMypageProductsDTO> selectNextWeekDrink(@Param("drk_order_no") int drk_order_no, @Param("plusDay") int plusDay);

	int changeDrkOrderName(@Param("drk_order_no") int drk_order_no, @Param("drk_order_name") String drk_order_name);

	List<DrkOrderBillDTO> selectDailyBills(@Param("member_no") int member_no, @Param("year") int year, @Param("month") int month);

	DrkOrderBillDTO selectDailyBill(@Param("drk_order_no") int drk_order_no, @Param("year") int year, @Param("month") int month);

	AcntInfoDTO selectAcntInfo(int pay_info_no);

	int getNowPrice(int drk_order_no);

	int updateDrkOrderStatus(int drk_order_no);

	int updateDrkScheduleEndDate(@Param("drk_order_no") int drk_order_no, @Param("drk_end_date") Date drk_end_date);

	int deleteDrkHistory(@Param("drk_order_no") int drk_order_no, @Param("drk_end_date") Date drk_end_date);

	List<DrkOrderMypageProductsDTO> selectDrkOrderMypageProducts(int drk_order_no);

	List<DrkScheduleDTO> selectDrkScheduleList(int drk_order_no);

	int changeDrkSchedule(DrkScheduleDTO newSchedule);

	int insertDrkSchedule(@Param("newSchedule") DrkScheduleDTO newSchedule);

	int changeDrkHistory(DrkScheduleDTO newSchedule);

	int insertDrkHistory(DrkHistoryDTO drkHistoryDTO);

	int insertDrkChanges(DrkChangesDTO changesDTO);

	List<DrkChangesDTO> selectDrkChanges(int drk_order_no);

	int selectChangeGroupNo();

	List<DrkChangesDTO> selectDrkChange(int change_group_no);

}
