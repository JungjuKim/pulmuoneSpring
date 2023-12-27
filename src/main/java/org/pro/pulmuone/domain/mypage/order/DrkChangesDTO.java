package org.pro.pulmuone.domain.mypage.order;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DrkChangesDTO {
	
	private int changes_no;
	private int change_group_no;
	private int drk_schedule_no;
	private int drk_order_no;
	private int change_type;
	private Date change_date;
	private Date change_start_date;
	private Date change_end_date;
	private int change_period;
	private Date change_ship_start_date;
	private Date change_ship_end_date;
	private String products_no;
	private int is_new;
	private int day_of_week;
	private int before_cnt;
	private int after_cnt;
	
	private String products_name;
	private String img_path;
	private String system_name;
	private String products_size;
	
}
