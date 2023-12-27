<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/assets/js/order/mypageDrink.js"></script>

<div class="container">
	
	<div class="border-wrapper">
		<h2 class="container-title">배송일정변경</h2>
	</div>
							
	<div class="page-addiction-wrapper">
		<div class="info-copy">
			<div class="box" style="flex:1; margin-bottom:10px;">
				<div class="nickname-format">
					<label class="basic">기본</label>
					<h5>${ drkOrderMypageDTO.drk_order_name }</h5>
					<span>${ drkOrderMypageDTO.drk_order_no }</span>
				</div>
			</div>
		</div>
	</div>
	
	<div class="box-partition">
		<div class="part" style="padding:29px 29px 30px;">
			<div>
				<div class="form-input select">
					<dl style="display: none">
						<dt style="width:180px; padding-left:20px;"><label>배송일정 변경사유</label></dt>
						<dd>
							<div class="dropdown">
								<button class="btn dropdown-toggle" data-value="MR05" type="button" data-toggle="dropdown" aria-expanded="false">
									<em class="placeholder">사유를 선택해주세요</em>
								</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="javascript:void(0)" data-value="MR01">출장</a>
									<a class="dropdown-item" href="javascript:void(0)" data-value="MR02">휴가</a>
									<a class="dropdown-item" href="javascript:void(0)" data-value="MR03">방학</a>
									<a class="dropdown-item" href="javascript:void(0)" data-value="MR04">병가</a>
									<a class="dropdown-item" href="javascript:void(0)" data-value="MR05">기타</a>
									</div>
							</div>
						</dd>
					</dl>
				</div>
				<div class="form-input period">
					<dl class="date">
						<dt style="width:180px; padding-left:20px;"><label>변경 기간(시작일~종료일)</label></dt>
						<dd>
							<input style="padding-left:16px;" id="rangePicker" type="text" name="daterange" placeholder="기간을 선택하세요">
						</dd>
					</dl>
					<p id="ing-text" class="ing-txt">영업일 1일</p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="addiction-foot" style="margin-top:0; border:0; padding-top:21px;">
		<p class="foot-copy"></p>
		<div class="btn-area-right">
			<a href="/mypage/drink/drinks/${ drkOrderMypageDTO.drk_order_no }"  id="cancel" style="cursor:pointer;padding:0; width:140px;" class="btn-default btn-white">취소</a>
			<button type="button" style="padding:0; width:140px;" id="pauseBtn" class="btn-default btn-default">배송일정변경</button>
		</div>
	</div>
	
	<div class="alert-area lg">
		<h4>안내사항</h4>
		<ul>
			<li>배송 일정 변경은 신청일로부터 3일 이후부터 변경 가능합니다. (영업일 기준)</li>
			<li>배송 일정 변경은 영업일 기준 매 월 총 10일간 가능합니다. (1달 기간 중 합산하여 총 10일간 변경 가능)</li>
			<li>후불 정기 결제 고객님은 배송 일정 변경으로 미음용하신 내역은 당월 청구 결제 내역에서 제외되고 결제됩니다.</li>
			<li>후불 정기 결제로 이용하시면서 배송일 변경을 하신 경우 해당 내역에 대한 취소가 불가합니다. 재음용을 원하시면 스케줄 변경 또는 담당 가맹점을 통해 문의해주세요.</li>
			<li>타 쇼핑몰 주문 건은 변경하시고자 하는 배송 일정 기간 동안의 상품이 선택하신 배송일 뒤로 연장되어 순차 배송됩니다.</li>
			<li>배송일정 변경에 따라 현재 음용 중이신 주문 패턴이 일부 변경될 수 있습니다.</li>
			<li>추가 궁금한 사항은 배송가맹점 또는 고객기쁨센터를 통해 문의해주세요.</li>
		</ul>
	</div>
</div>

<%@ include file="/WEB-INF/views/ui/alertmodal.jsp"%>

<script>
	let today = new Date();
	let startDate = new Date()
	let endDate = new Date()
	
	startDate.setDate(today.getDate()+3);
	endDate.setDate(today.getDate()+30);
	
	startWeekDay = getWeekDay(startDate);
	endWeekDay = getWeekDay(endDate);
	
	$(function () {
		$('input[name="daterange"]').daterangepicker({
	          opens: 'left',
	          minDate: startDate,
	          maxDate: endDate
	      }, function (startDate, endDate, label) {
	    	  let days = Math.trunc((endDate - startDate)/1000/60/60/24);
	          if (days >= 10) {
	        	  handleExceed();
	        	  return;
	          } // if
	          $('#ing-text').text(`영업일 \${days}일`);
	     });
	})
	function handleExceed(){
          const opt =  $('input[name="daterange"]').data('daterangepicker');
          console.log(opt)
          opt.setStartDate(startDate);
          console.log(startDate)
          opt.setEndDate(startDate);
          console.log(endDate)
          $("body").trigger("click");
          alert('배송 일정 변경은 영업일 기준 매 월 총 10일간 가능합니다');
      }
</script>
<!-- 
<script>
      function filter10days(sd,ed){
          if(limitPerMonth){

              var available = 10;

              const hasMonth = Object.keys(limitPerMonth).filter(v=>v==sd.month()+1)


              if(hasMonth.length>0){

                  console.log(limitPerMonth[hasMonth[0]])
                  available = available - limitPerMonth[hasMonth[0]].filter(v=>v.year===sd.year()).filter(v=>{
                      const date = new Date(v.year,v.month-1,v.day);
                      return !moment(date).isBetween(sd,ed,'days','[]')
                  } ).length

              }
          }
          return available;
      }
      
        function calculateWorkDayAndExceed(startDate , endDate){
	       	console.log(startDate)
            if(startDate.month()!==endDate.month()){
				const startEndMonth = moment(startDate).endOf('Month')
                const startDiff = diff(startDate.format('YYYY-MM-DD'),startEndMonth.format('YYYY-MM-DD'))
                const ed = moment(endDate)

                const endDiff = diff( ed.startOf('Month').format('YYYY-MM-DD'),endDate.format('YYYY-MM-DD'))
                if(startDiff>10||endDiff>10){
                    return handleExceed()
                }
                if(filter10days(startDate,startEndMonth)-startDiff<0||filter10days(ed,endDate)-endDiff<0){
                    return handleExceed()
                }
                // weekDayCal = endDiff+startDiff
            }else {
                const startDiff = moment().isoWeekdayCalc(startDate.format('YYYY-MM-DD'), endDate.format('YYYY-MM-DD'), [1, 2, 3, 4, 5], null)
                if(startDiff>10){
                    return handleExceed()
                }
                if(filter10days(startDate,endDate)-startDiff<0){
                    return handleExceed();
                }
            }
        }

      var d = moment("20231229", "YYYYMMDD");


        $('#cancel').click(function () {
            confirmDesign('', '배송일정변경을 취소하시겠습니까?', () => location.href = "/mypage/drink/drinks/230000234094/23812")
        })

        $(".ip-datepicker").keydown(function () {
            return false;
        });

        function dateDiff(_date1, _date2) {
            var diffDate_1 = _date1 instanceof Date ? _date1 : new Date(_date1);
            var diffDate_2 = _date2 instanceof Date ? _date2 : new Date(_date2);

            diffDate_1 = new Date(diffDate_1.getFullYear(), diffDate_1.getMonth() + 1, diffDate_1.getDate());
            diffDate_2 = new Date(diffDate_2.getFullYear(), diffDate_2.getMonth() + 1, diffDate_2.getDate());
            var diff = diffDate_2.getTime() - diffDate_1.getTime();
            var minus = diff < 0;

            var diffAbs = Math.abs(diff);
            diffAbs = Math.ceil(diffAbs / (1000 * 3600 * 24));

            return {"diff": diffAbs, "sign": minus ? "-" : "+"};
        }

        var changeDates = [];

        $("#ip-datepicker-1").change();

        function replaceAll(str, oldChar, newChar) {

            while (str.indexOf(oldChar) >= 0) {
                str = str.replace(oldChar, newChar);
            }

            return str;
        }

        var hasPassed = false;

        

        var d = undefined;

        function calculate() {
            d = {}
            const data =
            {"data":[{"SAT_QTY":0,"MON_QTY":0,"FRI_QTY":0,"DRNK_QTY":1,"PRTN_ID":"23812","DAILY_PC_THUMBNAIL":"/product/20220310/4cf0398b-fb18-45f9-97c4-be8b5bd2edd6.jpg","IDX":440,"FD_CUST_ID":"230000234094","CAPACITY":"130","ORD_ACQR_ROUTE":"60","ITEM_CD":"0073080","UNIT":"ml","PRICE":"3300","WED_QTY":1,"START_DATE":"20231106","THUMBNAIL":"/product/20220310/4cf0398b-fb18-45f9-97c4-be8b5bd2edd6.jpg","TUE_QTY":0,"SUN_QTY":0,"CUST_ITEM_ID":"2023110109273710002","PRODUCT_NAME":"하트러브 엑스투","DAILY_MO_THUMBNAIL":"/product/20220310/28b42e28-fdb4-47e2-886e-fad4592f9c76.jpg","DRNK_CUSTNM":"신종혁","THU_QTY":0,"DRNK_PTRN":"PT99"},{"SAT_QTY":0,"MON_QTY":0,"FRI_QTY":1,"DRNK_QTY":1,"PRTN_ID":"23812","DAILY_PC_THUMBNAIL":"/product/20220525/d386ba2b-d786-421e-92c6-fc0677393d12.jpg","IDX":442,"FD_CUST_ID":"230000234094","CAPACITY":"190","ORD_ACQR_ROUTE":"60","ITEM_CD":"0073184","UNIT":"ml","PRICE":"3300","WED_QTY":0,"START_DATE":"20231031","THUMBNAIL":"/product/20230302/685a5aac-588c-4366-82c4-217f17b38067.jpg","TUE_QTY":0,"SUN_QTY":0,"CUST_ITEM_ID":"2023102718143700000000011","PRODUCT_NAME":"핸디밀 그린샐러드 식이섬유플랜","DAILY_MO_THUMBNAIL":"/product/20220525/cc9a3b57-c1e1-47de-9250-6c43e7783044.jpg","DRNK_CUSTNM":"신종혁","THU_QTY":0,"DRNK_PTRN":"PT99"},{"SAT_QTY":0,"MON_QTY":0,"FRI_QTY":0,"DRNK_QTY":1,"PRTN_ID":"23812","DAILY_PC_THUMBNAIL":"/product/20220525/2f3ecf01-a7ea-41a1-b4ce-a0eabcb9b321.jpg","IDX":443,"FD_CUST_ID":"230000234094","CAPACITY":"190","ORD_ACQR_ROUTE":"60","ITEM_CD":"0073155","UNIT":"ml","PRICE":"3300","WED_QTY":0,"START_DATE":"20231031","THUMBNAIL":"/product/20230302/42da9a6f-9889-4ff7-bf77-af5989855f86.jpg","TUE_QTY":0,"SUN_QTY":0,"CUST_ITEM_ID":"2023102718143700000000012","PRODUCT_NAME":"핸디밀 블랙콩콩 비타D플랜","DAILY_MO_THUMBNAIL":"/product/20220525/32b5ed64-6c76-4398-8776-d099539650f6.jpg","DRNK_CUSTNM":"신종혁","THU_QTY":1,"DRNK_PTRN":"PT99"},{"SAT_QTY":0,"MON_QTY":0,"FRI_QTY":0,"DRNK_QTY":1,"PRTN_ID":"23812","IDX":612,"FD_CUST_ID":"230000234094","CAPACITY":"130","ORD_ACQR_ROUTE":"60","ITEM_CD":"0073271","UNIT":"ml","PRICE":"3300","WED_QTY":0,"START_DATE":"20231031","THUMBNAIL":"/product/20221108/abde0d7f-d546-4cc4-acec-99a4b895b9d7.jpg","TUE_QTY":1,"SUN_QTY":0,"CUST_ITEM_ID":"2023102718143700000000013","PRODUCT_NAME":"아이러브엑스투","DRNK_CUSTNM":"신종혁","THU_QTY":0,"DRNK_PTRN":"PT99"},{"SAT_QTY":0,"MON_QTY":1,"FRI_QTY":0,"DRNK_QTY":1,"PRTN_ID":"23812","IDX":725,"FD_CUST_ID":"230000234094","CAPACITY":"125","ORD_ACQR_ROUTE":"60","ITEM_CD":"0073397","UNIT":"g","PRICE":"4500","WED_QTY":0,"START_DATE":"20231031","THUMBNAIL":"/product/20230220/5e98ba4b-ea3d-4b14-b7db-a6b4399981dc.png","TUE_QTY":0,"SUN_QTY":0,"CUST_ITEM_ID":"2023102718143700000000015","PRODUCT_NAME":"바이탈엑스투 스타트업 메모리케어","DRNK_CUSTNM":"신종혁","THU_QTY":0,"DRNK_PTRN":"PT99"},{"SAT_QTY":0,"MON_QTY":0,"FRI_QTY":1,"DRNK_QTY":1,"PRTN_ID":"23812","DAILY_PC_THUMBNAIL":"/product/20211019/440c80f2-2f24-47bc-9e78-b3057b76712f.jpg","IDX":316,"FD_CUST_ID":"230000234094","CAPACITY":"150","ORD_ACQR_ROUTE":"60","ITEM_CD":"0070445","UNIT":"ml","PRICE":"2300","WED_QTY":0,"START_DATE":"20231106","THUMBNAIL":"/product/20230417/0512477d-b440-4adf-9cd3-3cc9ca29ab98.png","TUE_QTY":0,"SUN_QTY":0,"CUST_ITEM_ID":"2023110105455310001","PRODUCT_NAME":"식물성유산균쌀요거트","DAILY_MO_THUMBNAIL":"/product/20211019/c369d1eb-e2ef-45ab-9bbb-895daa8c65f9.jpg","DRNK_CUSTNM":"신종혁","THU_QTY":0,"DRNK_PTRN":"PT99"}]}.
            data
            const dd = [];

            d.items = data.map((v, i) => {
                v.pcode = v.PCODE
                v.custItemId = v.CUST_ITEM_ID
                v.itemCode = v.ITEM_CD
                v.acqrSource = v.ORD_ACQR_ROUTE
                //선결제 변경일 모음


                if (changeDates && changeDates.length > 0 && changeDates.filter(a => a.ITEM_CD === v.itemCode && a.DRNK_RCPT_NO === v.CUST_ITEM_ID && isExternalShop(v.acqrSource)).length > 0) {
                    const changeDateItems = changeDates.filter(a => a.ITEM_CD === v.itemCode && a.DRNK_RCPT_NO === v.CUST_ITEM_ID);
                    v.startDate = changeDateItems[0].ORG_DELV_DT
                    v.endDate = changeDateItems[0].ORG_DELV_DT
                    v.delvDt = changeDateItems[0].DELV_DT
                    if (changeDateItems.length > 1) {
                        for (let i = 1; i < changeDateItems.length; i++) {
                            const a = {...v}
                            a.startDate = changeDateItems[i].ORG_DELV_DT
                            a.endDate = changeDateItems[i].ORG_DELV_DT
                            a.delvDt = changeDateItems[i].DELV_DT
                            dd.push(a);

                        }
                    }


                } else {
                    v.startDate = moment(startDateVal).format('YYYYMMDD')
                    v.endDate = moment(endDateVal).format('YYYYMMDD')

                }

                return v;
            })

            function checkOption(v) {
                if (!isExternalShop(v.acqrSource)) {
                    if (v.delvDt) {
                        v.delvDt = undefined;
                    }
                    if (v.END_DATE) {

                        return !!(moment(v.startDate).isBetween(moment(v.START_DATE), moment(v.END_DATE), 'days', '[]') || moment(v.endDate).isBetween(moment(v.START_DATE), moment(v.END_DATE), 'days', '[]'));

                    } else {

                        return !!(moment(v.START_DATE).isBetween(moment(v.startDate), moment(v.endDate), 'days', '[]') || moment(v.START_DATE).isBefore(moment(v.startDate)));
                    }
                } else {
                    return !!v.delvDt;
                }
            }

            d.items = d.items.concat(dd);
            d.items = d.items.filter(v => checkOption(v))
            var distinct = []
            d.items.forEach((v, i) => {
                if (distinct.filter(a => {
                    return a.custItemId === v.custItemId && a.startDate === v.startDate && a.endDate === v.endDate
                }).length === 0) {
                    distinct.push(v);
                }
            })
            d.items = distinct;
            d.startDate = moment(startDateVal).format('YYYYMMDD')
            d.endDate = moment(endDateVal).format('YYYYMMDD')
            d.holdResnCd = $('.dropdown-toggle').data('value')
            d.changeDates = changeDates;

            if (d.items.length>0) {
                get({
                    url: `/mypage/drink/drink/check/${d.items[0].FD_CUST_ID}/${d.items[0].PRTN_ID}`,
                    param: {startDate: d.startDate, endDate: d.endDate}
                }, function (r) {
                    if (r.RESULT_MSG && r.RESULT_MSG.length > 0) {
                        const a = r.RESULT_MSG;
                        d.items = d.items.filter(v => a.includes(v.custItemId))
                        $('.external').toggle(d.items.filter(v => v.delvDt).length > 0);

                    } else {
                        alert('선택하신 변경기간 안에 음용예정 상품이 없습니다.')
                        const opt = $('#rangePicker').data('daterangepicker')
	                    console.log(opt);


	                    opt.setStartDate(moment('20231229'))
	                    opt.setEndDate(moment('20231229'))
                        opt.callback(moment('20231229'),moment('20231229'))
                    }
                })
            }
        }

        var duplicate = false;
        // 신청버튼 클릭
        $("#pauseBtn").click(function () {

            $("#pauseBtn").prop('disabled', true);
			// console.log(111);
            if (!$('.dropdown-toggle').data('value')) {
                alert("배송일정변경 사유를 선택해 주세요");
                $("#pauseBtn").prop('disabled', false);
                return;
            }
            try {
	        calculateWorkDayAndExceed(moment(startDateVal),moment(endDateVal));
			
            }catch (e){
              console.log(e)
                return $("#pauseBtn").prop('disabled', false);
            }
            calculate();
            console.log(d)
            $('#confirmModal .confirm').unbind('click');
            confirmDesign('', "지정한 기간동안 배송일정을 변경하시겠습니까?", function () {
                $('#loading').modal('show')
                newPost({
                    url: "/mypage/drink/drink/pause/230000234094/" + "23812",
                    data: d
                }, function (response) {
                    alert(response.RESULT_MSG, () => location.href = "/mypage/drink/drinks/230000234094/23812");

                },undefined,()=>$('#loading').modal('hide'))

            })

            $("#pauseBtn").prop('disabled', false);
        });
</script> -->