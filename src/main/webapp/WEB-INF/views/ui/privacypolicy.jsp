<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	$(function() {
		$('.dropdown-item').click(function() {
			const idx = $(this).data('idx')				
			if ($(this).hasClass('privacy')) {

				$('.privacyPolicy').hide();
				$(`.privacyPolicy[data-idx=\${idx}]`).show()
			} else {
				$('.terms').hide();
				$(`.terms[data-idx=\${idx}]`).show()
			}
		});
	});
</script>
<div class="modal fade" id="privacyPolicy" tabindex="-1" aria-labelledby="privacyPolicy" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="privacyPolicyLabel">개인정보 처리방침</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" style="border-bottom: 6px #fafafa solid;">
				<div class="privacyPolicy" data-idx="1">


					<style>
.agree-inner+.agree-inner {
	margin-top: 10px;
}

.agree-wrap .agree-cont ul {
	padding: 5px 0;
}

.agree-wrap .agree-cont ul li {
	position: relative;
	padding-left: 20px;
}

.agree-wrap .agree-cont ul li:before {
	content: none;
}

.agree-inner li+li {
	margin-top: 5px;
}

.agree-inner ol li {
	padding-left: 14px;
}

.agree-inner .num {
	position: absolute;
	font-size: 11px;
	left: 0;
	top: 0px;
}

.agree-cont .agree-inner .agree-title {
	font-size: 18px;
	padding-bottom: 10px;
	border-bottom: 1px #e5e5e5 solid;
	margin-bottom: 10px;
}

.agree-wrap th, td {
	word-break: break-all;
	width: auto;
	color: #333;
}

.agree-wrap table {
	width: 100%;
	margin-top: 10px;
	border-right: 1px #eee solid;
	border-top: 1px #eee solid;
	margin-bottom: 15px;
}

.agree-wrap th {
	padding: 10px;
	border-bottom: 1px #333 solid;
	border-left: 1px #eee solid;
}

.agree-wrap td {
	padding: 10px;
	border-bottom: 1px #eee solid;
	border-left: 1px #eee solid;
}
</style>
					<script>
						$(function() {
							$('.pop-content').click(
									function(e) {
										e.preventDefault()
										if ($(this).hasClass('prtn')) {
											$('#alertModal2').find(
													'.modal-body').html(prtn)
										} else {
											$('#alertModal2').find(
													'.modal-body').html(
													consumerCorp)
										}
										$('#alertModal2').modal('show');
									})
							$('#alertModalClose').click(function() {

								$('#alertModal2').modal('hide');
							})
						})
					</script>
					<div class="" style="padding: 0 30px 30px">
						<div class="agree-wrap">
							<div class="agree-cont">
								<div class="agree-inner">
									<h4 class="agree-title">제 1 조 총칙</h4>
									<p>㈜풀무원녹즙은(이하 “회사”라 함) 이용자의 소중한 개인정보 보호를 위하여 관련 법령을 준수하며 개인정보처리방침을 통하여 이용자의 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 이용자의 개인정보 보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</p>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 2 조 개인정보의 수집 항목 및 이용 목적</h4>
									<ul>
										<li><span class="num">①</span> 서비스 이용 시 수집하는 정보
											<table>
												<tbody>
													<tr>
														<th colspan="2">구분</th>
														<th>처리하는 항목</th>
														<th>처리목적</th>
														<th>보유기간</th>
													</tr>
													<tr>
														<td rowspan="2">회원가입</td>
														<td rowspan="4">필수</td>
														<td>아이디, 패스워드, 이메일</td>
														<td>부정이용 및 비인가 사용방지</td>
														<td rowspan="4">회원탈퇴 시 파기<br>(CI값은 무분별한 재가입 방지를 위해 30일간 보관 후 파기)
														</td>
													</tr>
													<tr>
														<td>이름, 휴대전화번호, 생년월일, 성별, CI(연계정보), DI(중복확인정보)</td>
														<td>서비스 이용에 따른 본인식별 및 연령확인</td>
													</tr>
													<tr>
														<td rowspan="2">SNS 간편로그인</td>
														<td>이름, 이메일 주소, 성별, 생일</td>
														<td>네이버 간편 로그인</td>
													</tr>
													<tr>
														<td>닉네임, 프로필사진</td>
														<td>카카오톡 간편 로그인</td>
													</tr>
													<tr>
														<td rowspan="4">주문/결제/배송</td>
														<td rowspan="2">필수</td>
														<td>이름, 휴대전화번호, 배송지주소, 출입정보</td>
														<td>상품배송, 정기배송</td>
														<td rowspan="4">회원탈퇴 또는 서비스 종료 시 파기 <br>단, 관계 법률에 의해 보존할 필요가 있는 경우 법률에 따른 보관 기간 동안 보관
														</td>
													</tr>
													<tr>
														<td>은행계좌번호, 신용카드번호</td>
														<td>상품 결제</td>
													</tr>
													<tr>
														<td rowspan="2">선택</td>
														<td>예금주, 은행/카드사명, 생년월일, 계좌/카드번호</td>
														<td>안심 자동이체 신청</td>
													</tr>
													<tr>
														<td>휴대전화번호, 현금영수증카드번호</td>
														<td>현금영수증 발급</td>
													</tr>
													<tr>
														<td>마케팅 활용</td>
														<td>선택</td>
														<td>성명, 생년월일, 성별, 휴대전화번호 이메일, 주소</td>
														<td>신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리</td>
														<td>회원탈퇴 또는 서비스 종료 시 파기 <br>단, 관계 법률에 의해 보존할 필요가 있는 경우 법률에 따른 보관 기간 동안 보관
														</td>
													</tr>
													<tr>
														<td>이벤트/프로모션</td>
														<td>필수</td>
														<td>아이디, 이름, 휴대전화번호, 배송지주소</td>
														<td>이벤트 경품지급 및 CS 처리</td>
														<td>경품 지급 완료 후 1개월 보관 후 파기 <br>(경품 발송 후, CS처리를 위한 보유기간)
														</td>
													</tr>
												</tbody>
											</table></li>
										<li><span class="num">②</span> 서비스 이용 과정에서 생성되거나 자동으로 수집하는 정보
											<table>
												<tbody>
													<tr>
														<th>수집 목적</th>
														<th>수집하는 항목</th>
														<th>보유기간</th>
													</tr>
													<tr>
														<td>IP주소, 서비스 이용기록, 접속 로그, 쿠키, 접속기기 정보, 결제기록, 네트워크 연결정보</td>
														<td>- 서비스 이용 기록 통계분석<br> - 앱 실행 시 오류 확인<br> - 사용성 개선
														</td>
														<td>회원탈퇴 시 또는 법정 의무 보관기간</td>
													</tr>
												</tbody>
											</table></li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 3 조 개인정보 수집 방법</h4>
									<ul>
										<li><span class="num">①</span> 온라인(홈페이지) 이용 회원가입</li>
										<li><span class="num">②</span> 오프라인(모닝스탭) 음용신청서 작성</li>
										<li><span class="num">③</span> 제휴사로부터 제공받아 수집</li>
										<li><span class="num">④</span> 쿠키(cookie)에 의한 정보 수집</li>
										<li><span class="num">⑤</span> Application 통한 정보 수집</li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 4 조 개인정보의 처리 위탁</h4>
									<ul>
										<li><span class="num">①</span> 회사는 원활한 개인정보 업무 처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.
											<table>
												<tbody>
													<tr>
														<th>수탁 받는 자</th>
														<th>위탁 업무 내용</th>
													</tr>
													<tr>
														<td><a class="pop-content prtn" href="#">[풀무원녹즙 가맹점]</a></td>
														<td>오프라인 음용회원 모집, 판매 및 요금 결제, 상품 배송, 청구서 발송, 고객 불만처리, 고지사항 전달, 이벤트 및 광고성 정보 제공 및 참여기회 제공</td>
													</tr>
													<tr>
														<td>아이엔</td>
														<td>오프라인 음용회원 모집</td>
													</tr>
													<tr>
														<td>유림기획</td>
														<td rowspan="3">오픈마켓 위탁판매 운영</td>
													</tr>
													<tr>
														<td>PL2K</td>
													</tr>
													<tr>
														<td>쿨앤쿨</td>
													</tr>
													<tr>
														<td>㈜풀무원식품</td>
														<td>고객상담 및 CS처리</td>
													</tr>
													<tr>
														<td>㈜풀무원</td>
														<td rowspan="2">정보시스템 유지보수 및 운영</td>
													</tr>
													<tr>
														<td>메타넷</td>
													</tr>
													<tr>
														<td>CJ대한통운</td>
														<td>주문 상품 배송</td>
													</tr>
													<tr>
														<td><a class="pop-content consumerCorp">[소비자 조사 업체]</a></td>
														<td>소비자 조사 및 실사</td>
													</tr>
													<tr>
														<td>엠포플러스</td>
														<td>카카오 알림톡 및 톡기반서비스, 문자발송(SMS/LMS/MMS)</td>
													</tr>
													<tr>
														<td>(주)NICE신용평가정보</td>
														<td>CI/DI 및 휴대폰번호 실명인증</td>
													</tr>
													<tr>
														<td>효성 FMS</td>
														<td>CMS, 카드자동결제 관리</td>
													</tr>
												</tbody>
											</table></li>
										<li><span class="num">②</span> 회사는 위탁 계약 체결 시 관련 법령에 따라 ‘목적 외 개인정보 처리금지’, ‘기술적ㆍ관리적 보호조치’, ‘재-위탁 제한’ 등 수탁자에 대한 관리ㆍ감독에 관한 사항을 계약서 문서에 명시하여 수탁자가 개인정보를 안전하게 처리하는지 감독하고 있습니다.</li>
										<li><span class="num">③</span> 회사는 위탁업무의 내용이나 수탁자가 변경될 경우 지체없이 본 개인정보처리방침을 통하여 공개합니다.</li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 5 조 개인정보의 제3자 제공</h4>
									<ul>
										<li><span class="num">①</span> 회사는 이용자의 개인정보를 제2조(개인정보의 수집 항목 및 이용 목적)에서 고지한 범위내에서 사용하며, 동 범위를 초과하여 이용하거나 타인을 포함한 제3자에게 임의 제공하지 않습니다. 다만, 아래의 경우에는 예외로 제공할 수 있습니다.
											<ol>
												<li><span class="num">1.</span> 정보주체의 제3자 제공에 대하여 동의한 경우</li>
												<li><span class="num">2.</span> 다른 법률에 특별한 규정이 있는 경우</li>
												<li><span class="num">3</span> 수사기관의 요구가 있는 경우로서 법령상 제출근거가 존재하는 경우</li>
											</ol></li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 6 조 개인정보의 보유 및 이용기간</h4>
									<p>회사는 수집된 개인정보는 서비스 미 이용 시 5년간 보관 후 지체없이 파기합니다. 다만, 『전자상거래 등에서의 소비자 보호에 관한 법률』 등과 관련 법령에 따라 보존할 필요가 있는 경우 아래와 같이 보유합니다.</p>
									<table>
										<tbody>
											<tr>
												<th>보존근거</th>
												<th>목적</th>
												<th>보유기간</th>
											</tr>
											<tr>
												<td rowspan="4">전자상거래 소비자 보호에 관한 법률</td>
												<td>계약 또는 청약 철회</td>
												<td>5년</td>
											</tr>
											<tr>
												<td>대금결제 및 재화 등의 공급에 관한 기록</td>
												<td>5년</td>
											</tr>
											<tr>
												<td>소비자 불만 또는 분쟁처리에 관한 기록</td>
												<td>3년</td>
											</tr>
											<tr>
												<td>표시ㆍ광고에 관한 기록</td>
												<td>6개월</td>
											</tr>
											<tr>
												<td>통신비밀보호법</td>
												<td>통신사실 확인자료에 관한 기록</td>
												<td>3개월</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 7 조 개인정보 파기절차 및 방법</h4>
									<ul>
										<li><span class="num">①</span> 회사는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.</li>
										<li><span class="num">②</span> 정보주체로부터 동의 받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 보존하여야 하는 경우에는 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.</li>
										<li><span class="num">③</span> 개인정보 파기의 절차 및 방법은 다음과 같습니다.
											<ol>
												<li><span class="num">1.</span> 파기절차 : 회사는 파기 사유가 발생한 개인정보를 선정하고, 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.</li>
												<li><span class="num">2.</span> 파기방법 : 전자적 파일 형태로 기록ㆍ저장 된 개인정보는 재생할 수 없도록 파기하며, 종이 문서에 기록ㆍ저장 된 개인정보는 분쇄하거나 소각하여 파기합니다.</li>
											</ol></li>
										<li><span class="num">④</span> 회사는 개인정보보호법 제39조의6에 의거 1년간 이용 내역이 없는 이용자의 개인정보를 파기합니다.</li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 8 조 이용자 및 법정대리인의 권리ㆍ의무 및 그 행사방법</h4>
									<ul>
										<li><span class="num">①</span> 이용자 및 법정대리인은 언제든지 개인정보 열람ㆍ정정ㆍ삭제ㆍ처리정지 요구 등의 권리를 행사할 수 있습니다. 다만, 열람ㆍ정정ㆍ삭제ㆍ처리정지 요구 시 열람 등을 요구한 한자가 이용자 본인이거나 정당한 대리인인지를 확인합니다.</li>
										<li><span class="num">②</span> 이용자 및 법정대리인은 인터넷, 전화, 서면 등을 통하여 하실 수 있습니다.</li>
										<li><span class="num">③</span> 개인정보의 열람 및 처리정지 요구는 개인정보보호법 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한될 수 있습니다.</li>
										<li><span class="num">④</span> 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.</li>
										<li><span class="num">⑤</span> 회사는 원칙적으로 만 14세 미만 아동의 개인정보를 수집하지 않습니다. 다만, 법정대리인의 동의를 받은 경우에 한하여 처리할 수 있습니다.</li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 9 조 개인정보의 안정성 확보조치</h4>
									<p>회사는 이용자의 개인정보를 처리함에 있어 개인정보가 분실, 도난, 유출, 변조, 훼손 등이 되지 아니하도록 안전성을 확보하기 위하여 다음과 같이 기술적·관리적 보호대책을 강구하고 있습니다.</p>
									<ul>
										<li><span class="num">①</span> 관리적 조치 : 내부관리계획 수립 시행, 정기적 직원 교육 등</li>
										<li><span class="num">②</span> 기술적 조치 : 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 고유식별정보 등의 암호화, 보안프로그램 설치 등</li>
										<li><span class="num">③</span> 물리적 조치 : 전산실, 자료보관실 등의 접근통제 등</li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 10 조 개인정보 자동 수집 장치의 설치ㆍ운영 및 거부에 관한 사항</h4>
									<ul>
										<li><span class="num">①</span> 회사는 개인화되고 맞춤화 된 서비스를 제공하기 위해서 이용자의 정보를 저장하고 수시로 불러오는 '쿠키(cookie)'를 사용합니다. 쿠키는 웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에게 보내는 아주 작은 텍스트 파일로 이용자 컴퓨터의 하드디스크에 저장됩니다.</li>
										<li><span class="num">②</span> 회사는 접속빈도 또는 머문 시간 등을 분석하여 이용자의 취향과 관심 분야를 파악하여 이용자의 관심분야에 따라 차별화된 정보를 제공하기 위하여 쿠키를 사용합니다.</li>
										<li><span class="num">③</span> 쿠키 설치 허용 여부를 지정하는 방법은 다음과 같습니다.
											<ol>
												<li><span class="num">1.</span> Edge : 설정 메뉴 &gt; 설정 &gt; 개인정보, 검색 및 서비스 &gt; 추적방지 여부 수준 설정</li>
												<li><span class="num">2.</span> Chrome : 설정 메뉴 &gt; 고급 설정 표시 &gt; 개인정보 &gt; 쿠키 수준 설정</li>
											</ol></li>
										<li><span class="num">④</span> 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.</li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 11 조 개인정보 보호책임자 및 열람청구 담당부서</h4>
									<ul>
										<li><span class="num">①</span> 회사는 이용자의 개인정보를 보호하고 개인정보와 관련된 불만을 처리하기 위하여 아래와 같이 개인정보 보호책임자 및 관련 부서를 지정하고 있습니다.
											<table>
												<tbody>
													<tr>
														<td>개인정보보호책임자</td>
														<td>개인정보보호 담당부서</td>
													</tr>
													<tr>
														<td>성명: 최미현<br> 소속부서: 풀무원녹즙 사업혁신담당<br> 이메일: pmocs_05@pulmuone.com
														</td>
														<td>부서명: 디지털커뮤니케이션팀<br> 연락처: 02-800-0393<br> 이메일: pmocs_05@pulmuone.com
														</td>
													</tr>
												</tbody>
											</table></li>
										<li><span class="num">②</span> 이용자는 개인정보 침해에 대한 신고나 상담이 필요하신 경우 아래 기관에 문의하시기 바랍니다.
											<ol>
												<li><span class="num">1. </span> 개인정보침해신고센터 (privacy.kisa.or.kr / 국번없이 118)</li>
												<li><span class="num">2. </span> 대검찰청 사이버수사과 (www.spo.go.kr / 국번없이 1301)</li>
												<li><span class="num">3. </span> 경찰청 사이버안전국 (police.go.kr / 국번없이 182)</li>
												<li><span class="num">4. </span> 개인정보 분쟁조정위원회 (kopico.go.kr / 1833-6972)</li>
											</ol></li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 12 조 고지의 의무</h4>
									<p>개인정보처리방침은 법령ㆍ정책 및 회사 내부 운영방침 또는 보안기술의 변경에 따라 내용이 수정될 수 있으며, 이때 변경되는 개인정보처리방침을 지체없이 공지합니다. 이 정책은 공지한 날로부터 시행됩니다.</p>
								</div>
								<div class="agree-inner">
									<p>시행일자 : 2023년 9월 21일</p>
								</div>
							</div>
						</div>
					</div>

					<style>
a.pop-content {
	color: #7acc12;
	text-decoration: underline;
	font-weight: bold;
	cursor: pointer;
}

a.pop-content.hover {
	color: #7acc12;
	text-decoration: underline;
}

.agree-wrap td {
	vertical-align: middle;
}
</style>


					<div class="modal fade show" id="alertModal2" style="z-index: 1051" tabindex="-1" aria-labelledby="alertModalLabel" aria-modal="true" role="dialog">
						<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable ">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="alertModalLabel"></h5>
									<button type="button" class="close" id="alertModalClose" aria-label="Close"></button>
								</div>
								<div class="modal-body" style="font-size: 13px; padding: 20px; color: #333;"></div>

							</div>
						</div>
					</div>





				</div>
				<div class="privacyPolicy" data-idx="2" style="display: none">


					<style>
.agree-inner+.agree-inner {
	margin-top: 10px;
}

.agree-wrap .agree-cont ul {
	padding: 5px 0;
}

.agree-wrap .agree-cont ul li {
	position: relative;
	padding-left: 20px;
}

.agree-wrap .agree-cont ul li:before {
	content: none;
}

.agree-inner li+li {
	margin-top: 5px;
}

.agree-inner ol li {
	padding-left: 14px;
}

.agree-inner .num {
	position: absolute;
	font-size: 11px;
	left: 0;
	top: 0px;
}

.agree-cont .agree-inner .agree-title {
	font-size: 18px;
	padding-bottom: 10px;
	border-bottom: 1px #e5e5e5 solid;
	margin-bottom: 10px;
}

.agree-wrap th, td {
	word-break: break-all;
	width: auto;
	color: #333;
}

.agree-wrap table {
	width: 100%;
	margin-top: 10px;
	border-right: 1px #eee solid;
	border-top: 1px #eee solid;
	margin-bottom: 15px;
}

.agree-wrap th {
	padding: 10px;
	border-bottom: 1px #333 solid;
	border-left: 1px #eee solid;
}

.agree-wrap td {
	padding: 10px;
	border-bottom: 1px #eee solid;
	border-left: 1px #eee solid;
}
</style>
					<script>
						$(function() {
							$('.pop-content').click(
									function(e) {
										e.preventDefault()
										if ($(this).hasClass('prtn')) {
											$('#alertModal2').find(
													'.modal-body').html(prtn)
										} else {
											$('#alertModal2').find(
													'.modal-body').html(
													consumerCorp)
										}
										$('#alertModal2').modal('show');
									})
							$('#alertModalClose').click(function() {

								$('#alertModal2').modal('hide');
							})
						})
					</script>

					<div class="" style="padding: 0 30px 30px">
						<div class="agree-wrap">
							<div class="agree-cont">
								<div class="agree-inner">
									<h4 class="agree-title">제 1 조 총칙</h4>
									<p>㈜풀무원녹즙은(이하 “회사”라 함) 이용자의 소중한 개인정보 보호를 위하여 관련 법령을 준수하며 개인정보처리방침을 통하여 이용자의 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 이용자의 개인정보 보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</p>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 2 조 개인정보의 수집 항목 및 이용 목적</h4>
									<ul>
										<li><span class="num">①</span> 서비스 이용 시 수집하는 정보
											<table>
												<tbody>
													<tr>
														<th colspan="2">구분</th>
														<th>처리하는 항목</th>
														<th>처리목적</th>
														<th>보유기간</th>
													</tr>
													<tr>
														<td rowspan="2">회원가입</td>
														<td rowspan="4">필수</td>
														<td>아이디, 패스워드, 이메일</td>
														<td>부정이용 및 비인가 사용방지</td>
														<td rowspan="4">회원탈퇴 시 파기<br>(CI값은 무분별한 재가입 방지를 위해 30일간 보관 후 파기)
														</td>
													</tr>
													<tr>
														<td>이름, 휴대전화번호, 생년월일, 성별, CI(연계정보), DI(중복확인정보)</td>
														<td>서비스 이용에 따른 본인식별 및 연령확인</td>
													</tr>
													<tr>
														<td rowspan="2">SNS 간편로그인</td>
														<td>이름, 이메일 주소, 성별, 생일</td>
														<td>네이버 간편 로그인</td>
													</tr>
													<tr>
														<td>닉네임, 프로필사진</td>
														<td>카카오톡 간편 로그인</td>
													</tr>
													<tr>
														<td rowspan="4">주문/결제/배송</td>
														<td rowspan="2">필수</td>
														<td>이름, 휴대전화번호, 배송지주소, 출입정보</td>
														<td>상품배송, 정기배송</td>
														<td rowspan="4">회원탈퇴 또는 서비스 종료 시 파기 <br>단, 관계 법률에 의해 보존할 필요가 있는 경우 법률에 따른 보관 기간 동안 보관
														</td>
													</tr>
													<tr>
														<td>은행계좌번호, 신용카드번호</td>
														<td>상품 결제</td>
													</tr>
													<tr>
														<td rowspan="2">선택</td>
														<td>예금주, 은행/카드사명, 생년월일, 계좌/카드번호</td>
														<td>안심 자동이체 신청</td>
													</tr>
													<tr>
														<td>휴대전화번호, 현금영수증카드번호</td>
														<td>현금영수증 발급</td>
													</tr>
													<tr>
														<td>마케팅 활용</td>
														<td>선택</td>
														<td>성명, 생년월일, 성별, 휴대전화번호 이메일, 주소</td>
														<td>신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리</td>
														<td>회원탈퇴 또는 서비스 종료 시 파기 <br>단, 관계 법률에 의해 보존할 필요가 있는 경우 법률에 따른 보관 기간 동안 보관
														</td>
													</tr>
													<tr>
														<td>이벤트/프로모션</td>
														<td>필수</td>
														<td>아이디, 이름, 휴대전화번호, 배송지주소</td>
														<td>이벤트 경품지급 및 CS 처리</td>
														<td>경품 지급 완료 후 1개월 보관 후 파기 <br>(경품 발송 후, CS처리를 위한 보유기간)
														</td>
													</tr>
												</tbody>
											</table></li>
										<li><span class="num">②</span> 서비스 이용 과정에서 생성되거나 자동으로 수집하는 정보
											<table>
												<tbody>
													<tr>
														<th>수집 목적</th>
														<th>수집하는 항목</th>
														<th>보유기간</th>
													</tr>
													<tr>
														<td>IP주소, 서비스 이용기록, 접속 로그, 쿠키, 접속기기 정보, 결제기록, 네트워크 연결정보</td>
														<td>- 서비스 이용 기록 통계분석<br> - 앱 실행 시 오류 확인<br> - 사용성 개선
														</td>
														<td>회원탈퇴 시 또는 법정 의무 보관기간</td>
													</tr>
												</tbody>
											</table></li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 3 조 개인정보 수집 방법</h4>
									<ul>
										<li><span class="num">①</span> 온라인(홈페이지) 이용 회원가입</li>
										<li><span class="num">②</span> 오프라인(모닝스탭) 음용신청서 작성</li>
										<li><span class="num">③</span> 제휴사로부터 제공받아 수집</li>
										<li><span class="num">④</span> 쿠키(cookie)에 의한 정보 수집</li>
										<li><span class="num">⑤</span> Application 통한 정보 수집</li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 4 조 개인정보의 처리 위탁</h4>
									<ul>
										<li><span class="num">①</span> 회사는 원활한 개인정보 업무 처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.
											<table>
												<tbody>
													<tr>
														<th>수탁 받는 자</th>
														<th>위탁 업무 내용</th>
													</tr>
													<tr>
														<td><a class="pop-content prtn" href="#">[풀무원녹즙 가맹점]</a></td>
														<td>오프라인 음용회원 모집, 판매 및 요금 결제, 상품 배송, 청구서 발송, 고객 불만처리, 고지사항 전달, 이벤트 및 광고성 정보 제공 및 참여기회 제공</td>
													</tr>
													<tr>
														<td>아이엔</td>
														<td>오프라인 음용회원 모집</td>
													</tr>
													<tr>
														<td>유림기획</td>
														<td rowspan="3">오픈마켓 위탁판매 운영</td>
													</tr>
													<tr>
														<td>PL2K</td>
													</tr>
													<tr>
														<td>쿨앤쿨</td>
													</tr>
													<tr>
														<td>㈜풀무원식품</td>
														<td>고객상담 및 CS처리</td>
													</tr>
													<tr>
														<td>㈜풀무원</td>
														<td rowspan="2">정보시스템 유지보수 및 운영</td>
													</tr>
													<tr>
														<td>메타넷</td>
													</tr>
													<tr>
														<td>CJ대한통운</td>
														<td>주문 상품 배송</td>
													</tr>
													<tr>
														<td><a class="pop-content consumerCorp">[소비자 조사 업체]</a></td>
														<td>소비자 조사 및 실사</td>
													</tr>
													<tr>
														<td>엠포플러스</td>
														<td>카카오 알림톡 및 톡기반서비스, 문자발송(SMS/LMS/MMS)</td>
													</tr>
													<tr>
														<td>(주)NICE신용평가정보</td>
														<td>CI/DI 및 휴대폰번호 실명인증</td>
													</tr>
													<tr>
														<td>효성 FMS</td>
														<td>CMS, 카드자동결제 관리</td>
													</tr>
												</tbody>
											</table></li>
										<li><span class="num">②</span> 회사는 위탁 계약 체결 시 관련 법령에 따라 ‘목적 외 개인정보 처리금지’, ‘기술적ㆍ관리적 보호조치’, ‘재-위탁 제한’ 등 수탁자에 대한 관리ㆍ감독에 관한 사항을 계약서 문서에 명시하여 수탁자가 개인정보를 안전하게 처리하는지 감독하고 있습니다.</li>
										<li><span class="num">③</span> 회사는 위탁업무의 내용이나 수탁자가 변경될 경우 지체없이 본 개인정보처리방침을 통하여 공개합니다.</li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 5 조 개인정보의 제3자 제공</h4>
									<ul>
										<li><span class="num">①</span> 회사는 이용자의 개인정보를 제2조(개인정보의 수집 항목 및 이용 목적)에서 고지한 범위내에서 사용하며, 동 범위를 초과하여 이용하거나 타인을 포함한 제3자에게 임의 제공하지 않습니다. 다만, 아래의 경우에는 예외로 제공할 수 있습니다.
											<ol>
												<li><span class="num">1.</span> 정보주체의 제3자 제공에 대하여 동의한 경우</li>
												<li><span class="num">2.</span> 다른 법률에 특별한 규정이 있는 경우</li>
												<li><span class="num">3</span> 수사기관의 요구가 있는 경우로서 법령상 제출근거가 존재하는 경우</li>
											</ol></li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 6 조 개인정보의 보유 및 이용기간</h4>
									<p>회사는 수집된 개인정보는 수집 및 이용목적 또는 제공받은 목적이 달성된 경우 지체없이 파기합니다. 다만, 『전자상거래 등에서의 소비자 보호에 관한 법률』 등과 관련 법령에 따라 보존할 필요가 있는 경우 아래와 같이 보유합니다.</p>
									<table>
										<tbody>
											<tr>
												<th>보존근거</th>
												<th>목적</th>
												<th>보유기간</th>
											</tr>
											<tr>
												<td rowspan="4">전자상거래 소비자 보호에 관한 법률</td>
												<td>계약 또는 청약 철회</td>
												<td>5년</td>
											</tr>
											<tr>
												<td>대금결제 및 재화 등의 공급에 관한 기록</td>
												<td>5년</td>
											</tr>
											<tr>
												<td>소비자 불만 또는 분쟁처리에 관한 기록</td>
												<td>3년</td>
											</tr>
											<tr>
												<td>표시ㆍ광고에 관한 기록</td>
												<td>6개월</td>
											</tr>
											<tr>
												<td>통신비밀보호법</td>
												<td>통신사실 확인자료에 관한 기록</td>
												<td>3개월</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 7 조 개인정보 파기절차 및 방법</h4>
									<ul>
										<li><span class="num">①</span> 회사는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.</li>
										<li><span class="num">②</span> 정보주체로부터 동의 받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 보존하여야 하는 경우에는 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.</li>
										<li><span class="num">③</span> 개인정보 파기의 절차 및 방법은 다음과 같습니다.
											<ol>
												<li><span class="num">1.</span> 파기절차 : 회사는 파기 사유가 발생한 개인정보를 선정하고, 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.</li>
												<li><span class="num">2.</span> 파기방법 : 전자적 파일 형태로 기록ㆍ저장 된 개인정보는 재생할 수 없도록 파기하며, 종이 문서에 기록ㆍ저장 된 개인정보는 분쇄하거나 소각하여 파기합니다.</li>
											</ol></li>
										<li><span class="num">④</span> 회사는 개인정보보호법 제39조의6에 의거 1년간 이용 내역이 없는 이용자의 개인정보를 파기합니다.</li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 8 조 이용자 및 법정대리인의 권리ㆍ의무 및 그 행사방법</h4>
									<ul>
										<li><span class="num">①</span> 이용자 및 법정대리인은 언제든지 개인정보 열람ㆍ정정ㆍ삭제ㆍ처리정지 요구 등의 권리를 행사할 수 있습니다. 다만, 열람ㆍ정정ㆍ삭제ㆍ처리정지 요구 시 열람 등을 요구한 한자가 이용자 본인이거나 정당한 대리인인지를 확인합니다.</li>
										<li><span class="num">②</span> 이용자 및 법정대리인은 인터넷, 전화, 서면 등을 통하여 하실 수 있습니다.</li>
										<li><span class="num">③</span> 개인정보의 열람 및 처리정지 요구는 개인정보보호법 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한될 수 있습니다.</li>
										<li><span class="num">④</span> 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.</li>
										<li><span class="num">⑤</span> 회사는 원칙적으로 만 14세 미만 아동의 개인정보를 수집하지 않습니다. 다만, 법정대리인의 동의를 받은 경우에 한하여 처리할 수 있습니다.</li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 9 조 개인정보의 안정성 확보조치</h4>
									<p>회사는 이용자의 개인정보를 처리함에 있어 개인정보가 분실, 도난, 유출, 변조, 훼손 등이 되지 아니하도록 안전성을 확보하기 위하여 다음과 같이 기술적·관리적 보호대책을 강구하고 있습니다.</p>
									<ul>
										<li><span class="num">①</span> 관리적 조치 : 내부관리계획 수립 시행, 정기적 직원 교육 등</li>
										<li><span class="num">②</span> 기술적 조치 : 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 고유식별정보 등의 암호화, 보안프로그램 설치 등</li>
										<li><span class="num">③</span> 물리적 조치 : 전산실, 자료보관실 등의 접근통제 등</li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 10 조 개인정보 자동 수집 장치의 설치ㆍ운영 및 거부에 관한 사항</h4>
									<ul>
										<li><span class="num">①</span> 회사는 개인화되고 맞춤화 된 서비스를 제공하기 위해서 이용자의 정보를 저장하고 수시로 불러오는 '쿠키(cookie)'를 사용합니다. 쿠키는 웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에게 보내는 아주 작은 텍스트 파일로 이용자 컴퓨터의 하드디스크에 저장됩니다.</li>
										<li><span class="num">②</span> 회사는 접속빈도 또는 머문 시간 등을 분석하여 이용자의 취향과 관심 분야를 파악하여 이용자의 관심분야에 따라 차별화된 정보를 제공하기 위하여 쿠키를 사용합니다.</li>
										<li><span class="num">③</span> 쿠키 설치 허용 여부를 지정하는 방법은 다음과 같습니다.
											<ol>
												<li><span class="num">1.</span> Edge : 설정 메뉴 &gt; 설정 &gt; 개인정보, 검색 및 서비스 &gt; 추적방지 여부 수준 설정</li>
												<li><span class="num">2.</span> Chrome : 설정 메뉴 &gt; 고급 설정 표시 &gt; 개인정보 &gt; 쿠키 수준 설정</li>
											</ol></li>
										<li><span class="num">④</span> 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.</li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 11 조 개인정보 보호책임자 및 열람청구 담당부서</h4>
									<ul>
										<li><span class="num">①</span> 회사는 이용자의 개인정보를 보호하고 개인정보와 관련된 불만을 처리하기 위하여 아래와 같이 개인정보 보호책임자 및 관련 부서를 지정하고 있습니다.
											<table>
												<tbody>
													<tr>
														<td>개인정보보호책임자</td>
														<td>개인정보보호 담당부서</td>
													</tr>
													<tr>
														<td>성명: 최미현<br> 소속부서: 풀무원녹즙 사업혁신담당<br> 이메일: pmocs_05@pulmuone.com
														</td>
														<td>부서명: 디지털커뮤니케이션팀<br> 연락처: 02-800-0393<br> 이메일: pmocs_05@pulmuone.com
														</td>
													</tr>
												</tbody>
											</table></li>
										<li><span class="num">②</span> 이용자는 개인정보 침해에 대한 신고나 상담이 필요하신 경우 아래 기관에 문의하시기 바랍니다.
											<ol>
												<li><span class="num">1. </span> 개인정보침해신고센터 (privacy.kisa.or.kr / 국번없이 118)</li>
												<li><span class="num">2. </span> 대검찰청 사이버수사과 (www.spo.go.kr / 국번없이 1301)</li>
												<li><span class="num">3. </span> 경찰청 사이버안전국 (police.go.kr / 국번없이 182)</li>
												<li><span class="num">4. </span> 개인정보 분쟁조정위원회 (kopico.go.kr / 1833-6972)</li>
											</ol></li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 12 조 고지의 의무</h4>
									<p>개인정보처리방침은 법령ㆍ정책 및 회사 내부 운영방침 또는 보안기술의 변경에 따라 내용이 수정될 수 있으며, 이때 변경되는 개인정보처리방침을 지체없이 공지합니다. 이 정책은 공지한 날로부터 시행됩니다.</p>
								</div>
								<div class="agree-inner">
									<p>시행일자 : 2023년 8월 10일</p>
								</div>
							</div>
						</div>
					</div>

					<style>
a.pop-content {
	color: #7acc12;
	text-decoration: underline;
	font-weight: bold;
	cursor: pointer;
}

a.pop-content.hover {
	color: #7acc12;
	text-decoration: underline;
}

.agree-wrap td {
	vertical-align: middle;
}
</style>


					<div class="modal fade show" id="alertModal2" style="z-index: 1051" tabindex="-1" aria-labelledby="alertModalLabel" aria-modal="true" role="dialog">
						<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable ">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="alertModalLabel"></h5>
									<button type="button" class="close" id="alertModalClose" aria-label="Close"></button>
								</div>
								<div class="modal-body" style="font-size: 13px; padding: 20px; color: #333;"></div>

							</div>
						</div>
					</div>





				</div>
				<div class="privacyPolicy" data-idx="3" style="display: none">


					<style>
.agree-inner+.agree-inner {
	margin-top: 10px;
}

.agree-wrap .agree-cont ul {
	padding: 5px 0;
}

.agree-wrap .agree-cont ul li {
	position: relative;
	padding-left: 20px;
}

.agree-wrap .agree-cont ul li:before {
	content: none;
}

.agree-inner li+li {
	margin-top: 5px;
}

.agree-inner ol li {
	padding-left: 14px;
}

.agree-inner .num {
	position: absolute;
	font-size: 11px;
	left: 0;
	top: 0px;
}

.agree-cont .agree-inner .agree-title {
	font-size: 18px;
	padding-bottom: 10px;
	border-bottom: 1px #e5e5e5 solid;
	margin-bottom: 10px;
}

.agree-wrap th, td {
	word-break: break-all;
	width: auto;
	color: #333;
}

.agree-wrap table {
	width: 100%;
	margin-top: 10px;
	border-right: 1px #eee solid;
	border-top: 1px #eee solid;
	margin-bottom: 15px;
}

.agree-wrap th {
	padding: 10px;
	border-bottom: 1px #333 solid;
	border-left: 1px #eee solid;
}

.agree-wrap td {
	padding: 10px;
	border-bottom: 1px #eee solid;
	border-left: 1px #eee solid;
}
</style>


					<div class="" style="padding: 0 30px 30px">
						<div class="agree-wrap">
							<div class="agree-cont">
								<div class="agree-inner">
									<h4 class="agree-title">제 1 조 총칙</h4>
									<p>㈜풀무원녹즙은(이하 “회사”라 함) 이용자의 소중한 개인정보 보호를 위하여 관련 법령을 준수하며 개인정보처리방침을 통하여 이용자의 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 이용자의 개인정보 보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</p>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 2 조 개인정보의 수집 항목 및 이용 목적</h4>
									<ul>
										<li><span class="num">①</span> 서비스 이용 시 수집하는 정보
											<table>
												<tbody>
													<tr>
														<th colspan="2">구분</th>
														<th>처리하는 항목</th>
														<th>처리목적</th>
														<th>보유기간</th>
													</tr>
													<tr>
														<td rowspan="2">회원가입</td>
														<td rowspan="4">필수</td>
														<td>아이디, 패스워드, 이메일</td>
														<td>부정이용 및 비인가 사용방지</td>
														<td rowspan="4">회원탈퇴 시 파기<br>(CI값은 무분별한 재가입 방지를 위해 30일간 보관 후 파기)
														</td>
													</tr>
													<tr>
														<td>이름, 휴대전화번호, 생년월일, 성별, CI(연계정보), DI(중복확인정보)</td>
														<td>서비스 이용에 따른 본인식별 및 연령확인</td>
													</tr>
													<tr>
														<td rowspan="2">SNS 간편로그인</td>
														<td>이름, 이메일 주소, 성별, 생일</td>
														<td>네이버 간편 로그인</td>
													</tr>
													<tr>
														<td>닉네임, 프로필사진</td>
														<td>카카오톡 간편 로그인</td>
													</tr>
													<tr>
														<td rowspan="4">주문/결제/배송</td>
														<td rowspan="2">필수</td>
														<td>이름, 휴대전화번호, 배송지주소, 출입정보</td>
														<td>상품배송, 정기배송</td>
														<td rowspan="4">회원탈퇴 또는 서비스 종료 시 파기 <br>단, 관계 법률에 의해 보존할 필요가 있는 경우 법률에 따른 보관 기간 동안 보관
														</td>
													</tr>
													<tr>
														<td>은행계좌번호, 신용카드번호</td>
														<td>상품 결제</td>
													</tr>
													<tr>
														<td rowspan="2">선택</td>
														<td>예금주, 은행/카드사명, 생년월일, 계좌/카드번호</td>
														<td>안심 자동이체 신청</td>
													</tr>
													<tr>
														<td>휴대전화번호, 현금영수증카드번호</td>
														<td>현금영수증 발급</td>
													</tr>
													<tr>
														<td>마케팅 활용</td>
														<td>선택</td>
														<td>성명, 생년월일, 성별, 휴대전화번호 이메일, 주소</td>
														<td>신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리</td>
														<td>회원탈퇴 또는 서비스 종료 시 파기 <br>단, 관계 법률에 의해 보존할 필요가 있는 경우 법률에 따른 보관 기간 동안 보관
														</td>
													</tr>
													<tr>
														<td>이벤트/프로모션</td>
														<td>필수</td>
														<td>아이디, 이름, 휴대전화번호, 배송지주소</td>
														<td>이벤트 경품지급 및 CS 처리</td>
														<td>경품 지급 완료 후 1개월 보관 후 파기 <br>(경품 발송 후, CS처리를 위한 보유기간)
														</td>
													</tr>
												</tbody>
											</table></li>
										<li><span class="num">②</span> 서비스 이용 과정에서 생성되거나 자동으로 수집하는 정보
											<table>
												<tbody>
													<tr>
														<th>수집 목적</th>
														<th>수집하는 항목</th>
														<th>보유기간</th>
													</tr>
													<tr>
														<td>IP주소, 서비스 이용기록, 접속 로그, 쿠키, 접속기기 정보, 결제기록, 네트워크 연결정보</td>
														<td>- 서비스 이용 기록 통계분석<br> - 앱 실행 시 오류 확인<br> - 사용성 개선
														</td>
														<td>회원탈퇴 시 또는 법정 의무 보관기간</td>
													</tr>
												</tbody>
											</table></li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 3 조 개인정보 수집 방법</h4>
									<ul>
										<li><span class="num">①</span> 온라인(홈페이지) 이용 회원가입</li>
										<li><span class="num">②</span> 오프라인(모닝스탭) 음용신청서 작성</li>
										<li><span class="num">③</span> 제휴사로부터 제공받아 수집</li>
										<li><span class="num">④</span> 쿠키(cookie)에 의한 정보 수집</li>
										<li><span class="num">⑤</span> Application 통한 정보 수집</li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 4 조 개인정보의 처리 위탁</h4>
									<ul>
										<li><span class="num">①</span> 회사는 원활한 개인정보 업무 처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.
											<table>
												<tbody>
													<tr>
														<th>수탁 받는 자</th>
														<th>위탁 업무 내용</th>
													</tr>
													<tr>
														<td><a class="pop-content prtn" href="#">[풀무원녹즙 가맹점]</a></td>
														<td>오프라인 음용회원 모집, 판매 및 요금 결제, 상품 배송, 청구서 발송, 고객 불만처리, 고지사항 전달, 이벤트 및 광고성 정보 제공 및 참여기회 제공</td>
													</tr>
													<tr>
														<td>유림기획</td>
														<td rowspan="3">오픈마켓 위탁판매 운영</td>
													</tr>
													<tr>
														<td>PL2K</td>
													</tr>
													<tr>
														<td>쿨앤쿨</td>
													</tr>
													<tr>
														<td>㈜풀무원식품</td>
														<td>고객상담 및 CS처리</td>
													</tr>
													<tr>
														<td>㈜풀무원</td>
														<td rowspan="2">정보시스템 유지보수 및 운영</td>
													</tr>
													<tr>
														<td>메타넷</td>
													</tr>
													<tr>
														<td>CJ대한통운</td>
														<td>주문 상품 배송</td>
													</tr>
													<tr>
														<td><a class="pop-content consumerCorp">[소비자 조사 업체]</a></td>
														<td>소비자 조사 및 실사</td>
													</tr>
													<tr>
														<td>엠포플러스</td>
														<td>카카오 알림톡 및 톡기반서비스, 문자발송(SMS/LMS/MMS)</td>
													</tr>
													<tr>
														<td>(주)NICE신용평가정보</td>
														<td>CI/DI 및 휴대폰번호 실명인증</td>
													</tr>
													<tr>
														<td>효성 FMS</td>
														<td>CMS, 카드자동결제 관리</td>
													</tr>
												</tbody>
											</table></li>
										<li><span class="num">②</span> 회사는 위탁 계약 체결 시 관련 법령에 따라 ‘목적 외 개인정보 처리금지’, ‘기술적ㆍ관리적 보호조치’, ‘재-위탁 제한’ 등 수탁자에 대한 관리ㆍ감독에 관한 사항을 계약서 문서에 명시하여 수탁자가 개인정보를 안전하게 처리하는지 감독하고 있습니다.</li>
										<li><span class="num">③</span> 회사는 위탁업무의 내용이나 수탁자가 변경될 경우 지체없이 본 개인정보처리방침을 통하여 공개합니다.</li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 5 조 개인정보의 제3자 제공</h4>
									<ul>
										<li><span class="num">①</span> 회사는 이용자의 개인정보를 제2조(개인정보의 수집 항목 및 이용 목적)에서 고지한 범위내에서 사용하며, 동 범위를 초과하여 이용하거나 타인을 포함한 제3자에게 임의 제공하지 않습니다. 다만, 아래의 경우에는 예외로 제공할 수 있습니다.
											<ol>
												<li><span class="num">1.</span> 정보주체의 제3자 제공에 대하여 동의한 경우</li>
												<li><span class="num">2.</span> 다른 법률에 특별한 규정이 있는 경우</li>
												<li><span class="num">3</span> 수사기관의 요구가 있는 경우로서 법령상 제출근거가 존재하는 경우</li>
											</ol></li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 6 조 개인정보의 보유 및 이용기간</h4>
									<p>회사는 수집된 개인정보는 수집 및 이용목적 또는 제공받은 목적이 달성된 경우 지체없이 파기합니다. 다만, 『전자상거래 등에서의 소비자 보호에 관한 법률』 등과 관련 법령에 따라 보존할 필요가 있는 경우 아래와 같이 보유합니다.</p>
									<table>
										<tbody>
											<tr>
												<th>보존근거</th>
												<th>목적</th>
												<th>보유기간</th>
											</tr>
											<tr>
												<td rowspan="4">전자상거래 소비자 보호에 관한 법률</td>
												<td>계약 또는 청약 철회</td>
												<td>5년</td>
											</tr>
											<tr>
												<td>대금결제 및 재화 등의 공급에 관한 기록</td>
												<td>5년</td>
											</tr>
											<tr>
												<td>소비자 불만 또는 분쟁처리에 관한 기록</td>
												<td>3년</td>
											</tr>
											<tr>
												<td>표시ㆍ광고에 관한 기록</td>
												<td>6개월</td>
											</tr>
											<tr>
												<td>통신비밀보호법</td>
												<td>통신사실 확인자료에 관한 기록</td>
												<td>3개월</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 7 조 개인정보 파기절차 및 방법</h4>
									<ul>
										<li><span class="num">①</span> 회사는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.</li>
										<li><span class="num">②</span> 정보주체로부터 동의 받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 보존하여야 하는 경우에는 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.</li>
										<li><span class="num">③</span> 개인정보 파기의 절차 및 방법은 다음과 같습니다.
											<ol>
												<li><span class="num">1.</span> 파기절차 : 회사는 파기 사유가 발생한 개인정보를 선정하고, 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.</li>
												<li><span class="num">2.</span> 파기방법 : 전자적 파일 형태로 기록ㆍ저장 된 개인정보는 재생할 수 없도록 파기하며, 종이 문서에 기록ㆍ저장 된 개인정보는 분쇄하거나 소각하여 파기합니다.</li>
											</ol></li>
										<li><span class="num">④</span> 회사는 개인정보보호법 제39조의6에 의거 1년간 이용 내역이 없는 이용자의 개인정보를 파기합니다.</li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 8 조 이용자 및 법정대리인의 권리ㆍ의무 및 그 행사방법</h4>
									<ul>
										<li><span class="num">①</span> 이용자 및 법정대리인은 언제든지 개인정보 열람ㆍ정정ㆍ삭제ㆍ처리정지 요구 등의 권리를 행사할 수 있습니다. 다만, 열람ㆍ정정ㆍ삭제ㆍ처리정지 요구 시 열람 등을 요구한 한자가 이용자 본인이거나 정당한 대리인인지를 확인합니다.</li>
										<li><span class="num">②</span> 이용자 및 법정대리인은 인터넷, 전화, 서면 등을 통하여 하실 수 있습니다.</li>
										<li><span class="num">③</span> 개인정보의 열람 및 처리정지 요구는 개인정보보호법 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한될 수 있습니다.</li>
										<li><span class="num">④</span> 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.</li>
										<li><span class="num">⑤</span> 회사는 원칙적으로 만 14세 미만 아동의 개인정보를 수집하지 않습니다. 다만, 법정대리인의 동의를 받은 경우에 한하여 처리할 수 있습니다.</li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 9 조 개인정보의 안정성 확보조치</h4>
									<p>회사는 이용자의 개인정보를 처리함에 있어 개인정보가 분실, 도난, 유출, 변조, 훼손 등이 되지 아니하도록 안전성을 확보하기 위하여 다음과 같이 기술적·관리적 보호대책을 강구하고 있습니다.</p>
									<ul>
										<li><span class="num">①</span> 관리적 조치 : 내부관리계획 수립 시행, 정기적 직원 교육 등</li>
										<li><span class="num">②</span> 기술적 조치 : 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 고유식별정보 등의 암호화, 보안프로그램 설치 등</li>
										<li><span class="num">③</span> 물리적 조치 : 전산실, 자료보관실 등의 접근통제 등</li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 10 조 개인정보 자동 수집 장치의 설치ㆍ운영 및 거부에 관한 사항</h4>
									<ul>
										<li><span class="num">①</span> 회사는 개인화되고 맞춤화 된 서비스를 제공하기 위해서 이용자의 정보를 저장하고 수시로 불러오는 '쿠키(cookie)'를 사용합니다. 쿠키는 웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에게 보내는 아주 작은 텍스트 파일로 이용자 컴퓨터의 하드디스크에 저장됩니다.</li>
										<li><span class="num">②</span> 회사는 접속빈도 또는 머문 시간 등을 분석하여 이용자의 취향과 관심 분야를 파악하여 이용자의 관심분야에 따라 차별화된 정보를 제공하기 위하여 쿠키를 사용합니다.</li>
										<li><span class="num">③</span> 쿠키 설치 허용 여부를 지정하는 방법은 다음과 같습니다.
											<ol>
												<li><span class="num">1.</span> Edge : 설정 메뉴 &gt; 설정 &gt; 개인정보, 검색 및 서비스 &gt; 추적방지 여부 수준 설정</li>
												<li><span class="num">2.</span> Chrome : 설정 메뉴 &gt; 고급 설정 표시 &gt; 개인정보 &gt; 쿠키 수준 설정</li>
											</ol></li>
										<li><span class="num">④</span> 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.</li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 11 조 개인정보 보호책임자 및 열람청구 담당부서</h4>
									<ul>
										<li><span class="num">①</span> 회사는 이용자의 개인정보를 보호하고 개인정보와 관련된 불만을 처리하기 위하여 아래와 같이 개인정보 보호책임자 및 관련 부서를 지정하고 있습니다.
											<table>
												<tbody>
													<tr>
														<td>개인정보보호책임자</td>
														<td>개인정보보호 담당부서</td>
													</tr>
													<tr>
														<td>성명: 최미현<br> 소속부서: 풀무원녹즙 사업혁신담당<br> 이메일: pmocs_05@pulmuone.com
														</td>
														<td>부서명: 디지털커뮤니케이션팀<br> 연락처: 02-800-0393<br> 이메일: pmocs_05@pulmuone.com
														</td>
													</tr>
												</tbody>
											</table></li>
										<li><span class="num">②</span> 이용자는 개인정보 침해에 대한 신고나 상담이 필요하신 경우 아래 기관에 문의하시기 바랍니다.
											<ol>
												<li><span class="num">1. </span> 개인정보침해신고센터 (privacy.kisa.or.kr / 국번없이 118)</li>
												<li><span class="num">2. </span> 대검찰청 사이버수사과 (www.spo.go.kr / 국번없이 1301)</li>
												<li><span class="num">3. </span> 경찰청 사이버안전국 (police.go.kr / 국번없이 182)</li>
												<li><span class="num">4. </span> 개인정보 분쟁조정위원회 (kopico.go.kr / 1833-6972)</li>
											</ol></li>
									</ul>
								</div>
								<div class="agree-inner">
									<h4 class="agree-title">제 12 조 고지의 의무</h4>
									<p>개인정보처리방침은 법령ㆍ정책 및 회사 내부 운영방침 또는 보안기술의 변경에 따라 내용이 수정될 수 있으며, 이때 변경되는 개인정보처리방침을 지체없이 공지합니다. 이 정책은 공지한 날로부터 시행됩니다.</p>
								</div>
								<div class="agree-inner">
									<p>공고일자 : 2023년 1월 11일</p>
									<p>시행일자 : 2023년 1월 25일</p>
								</div>
							</div>
						</div>
					</div>

					<style>
a.pop-content {
	color: #7acc12;
	text-decoration: underline;
	font-weight: bold;
	cursor: pointer;
}

a.pop-content.hover {
	color: #7acc12;
	text-decoration: underline;
}

.agree-wrap td {
	vertical-align: middle;
}
</style>


					<div class="modal fade show" id="alertModal2" style="z-index: 1051" tabindex="-1" aria-labelledby="alertModalLabel" aria-modal="true" role="dialog">
						<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable ">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="alertModalLabel"></h5>
									<button type="button" class="close" id="alertModalClose" aria-label="Close"></button>
								</div>
								<div class="modal-body" style="font-size: 13px; padding: 20px; color: #333;"></div>

							</div>
						</div>
					</div>





				</div>
				<div class="privacyPolicy" data-idx="4" style="display: none">


					<style>
.agree-inner+.agree-inner {
	margin-top: 10px;
}

.agree-wrap .agree-cont ul {
	padding: 5px 0;
}

.agree-wrap .agree-cont ul li {
	position: relative;
	padding-left: 20px;
}

.agree-wrap .agree-cont ul li:before {
	content: none;
}

.agree-inner li+li {
	margin-top: 5px;
}

.agree-inner ol li {
	padding-left: 14px;
}

.agree-inner .num {
	position: absolute;
	font-size: 11px;
	left: 0;
	top: 0px;
}

.agree-cont .agree-inner .agree-title {
	font-size: 18px;
	padding-bottom: 10px;
	border-bottom: 1px #e5e5e5 solid;
	margin-bottom: 10px;
}

.agree-wrap th, td {
	word-break: break-all;
	width: auto;
	color: #333;
}

.agree-wrap table {
	width: 100%;
	margin-top: 10px;
	border-right: 1px #eee solid;
	border-top: 1px #eee solid;
	margin-bottom: 15px;
}

.agree-wrap th {
	padding: 10px;
	border-bottom: 1px #333 solid;
	border-left: 1px #eee solid;
}

.agree-wrap td {
	padding: 10px;
	border-bottom: 1px #eee solid;
	border-left: 1px #eee solid;
}
</style>

					<div class="" style="padding: 0 30px 30px">
						<div class="agree-wrap">
							<div class="cbody-cont">
								<div class="agree-wrap">
									<!-- s: 20200310 약관 수정 (최신 수급 컨텐츠로 수정 -->
									<!-- s: 20200217 약관 수정 (최신 수급 컨텐츠로 수정 -->
									<p>(주)풀무원녹즙은 (이하 ""회사""라 함) 회원님의 개인정보를 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률(이하 '정보통신망법'이라함) 등 관련법령(이하 '관련법령'이라 함)에 근거하여 수집 ㆍ 보유 및 처리되고 있습니다.</p>

									<!--s:repeat agree cont-->
									<div class="agree-cont">
										<h3 class="agree-title">1. 수집하는 개인정보의 항목</h3>
										<p>회사는 회원에게 다양한 서비스 제공 위해 다음과 같은 개인정보를 수집하고 있습니다. 단, 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)와 주민등록번호는 수집하지 않습니다.</p>
										<ol>
											<li><span>①</span> 최초 회원 가입 시 고객님 식별 및 고지 전달, 불만처리나 서비스/이벤트 정보 안내 등 원활한 의사소통 경로 확보를 위해 다음과 같은 정보를 수집하여 이용합니다.
												<ul>
													<li>아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호, 이메일, CI(연계정보),DI(중복확인정보), 관심항목</li>
													<li>휴대폰번호는 나이스평가정보에서 인증 받은 휴대폰 번호를 사용하고 있습니다</li>
												</ul></li>
											<li><span>②</span> 재화 혹은 용역 주문에 따른 청구서, 상품 배송지의 확보를 위해 아래와 같은 정보를 수집하여 이용합니다.
												<ul>
													<li>배송정보 : 성명, 전화번호, 휴대폰번호, 배송지주소</li>
													<li>결제정보 : 은행계좌정보, 신용카드정보, 휴대폰가입정보</li>
													<li>현금영수증 발급정보 : 휴대폰번호, 신용카드번호, 현금영수증카드번호</li>
												</ul></li>
											<li><span>③</span> 이벤트, 프로모션, 마케팅에 참여를 원하시는 고객님의 경우 아래와 같은 정보를 수집하여 이용합니다. (선택)
												<ul>
													<li>마케팅 정보 수신 동의
														<p>* 경품 수령을 위해 제세공과금 처리가 필요한 경우, 소득세법에 따라 고객님의 주민등록번호, 계좌번호, 배송지주소 정보를 추가로 수집 및 이용 할 수 있습니다</p>
													</li>
												</ul></li>
											<li><span>④</span> 서비스 이용 과정에서 아래와 같은 정보들이 간접적으로 수집될 수 있습니다.
												<ul>
													<li>네이버ID로그인시 네이버 이용자고유식별정보, 카카오ID로그인시 카카오 이용자고유식별정보</li>
													<li>IP주소, 서비스 이용기록, 접속 로그, 쿠키, 접속기기 정보, 결제기록, 네트워크 연결정보등</li>
												</ul>
												<p>고객님께서 제공하신 모든 정보는 상기 목적에 필요한 용도 이외로는 사용되지 않으며, 수집정보의 범위나 사용 목적, 용도가 변경될 시에는 반드시 고객님께 사전 동의를 구할 것 입니다.</p></li>
										</ol>
										<p></p>
									</div>
									<!--e:repeat agree cont-->
									<!--s:repeat agree cont-->
									<div class="agree-cont">
										<h3 class="agree-title">2. 개인정보 수집 및 이용목적</h3>
										<ol>
											<li><span>①</span> 회사는 개인정보를 다음 목적을 위해 합니다.
												<ol>
													<li><span>가.</span> 서비스 제공 계약의 성립 및 유지 종료를 위한 본인 식별, 가입의사 확인, 회원에 대한 고지사항전달, 고객정보분석 및 분석정보의 통계적 활용, 불량회원 부정이용방지 및 비인가 사용방지, 서비스 개발을 위한 연구/조사</li>
													<li><span>나.</span> 불만처리 등 원활한 의사소통 경로의 확보</li>
													<li><span>다.</span> 상품 및 서비스의 구매에 대한 결제와 공급 및 배송</li>
												</ol></li>
											<li><span>②</span> 수집한 개인정보는 상기의 목적 이외의 용도로는 사용되지 않으며 보다 나은 서비스 혜택 제공을 위해 다양한 방법(전화, SMS, 우편 등)을 통해 서비스 관련 정보를 회원에게 제공할 수 있습니다.<br> 단, 회원이 서비스 혜택 정보 제공을 원치 않는다는 의사를 명확히 밝히는 경우 정보제공을 하지 않으며 이 경우 회원에게 정보 미 제공으로 인한 불이익이 발생하더라도 회사가 책임지지 않습니다. 또한, 이용 목적이 변경될 시에는 사전 동의를 구할 예정입니다.</li>
											<li><span>③</span> 이용자는 회사가 회원의 개인정보를 수집할 때 이를 거부할 수 있습니다. 다만, 필수동의 관련 제공을 거부하는 경우에는 서비스 제공 불가 또는 제한의 불이익을 받을 수 있습니다.<br> 단, 회원이 서비스 혜택 정보 제공을 원치 않는다는 의사를 명확히 밝히는 경우 정보제공을 하지 않으며 이 경우 회원에게 정보 미 제공으로 인한 불이익이 발생하더라도 회사가 책임지지 않습니다. 또한, 이용 목적이 변경될 시에는 사전 동의를 구할 예정입니다.</li>
										</ol>
									</div>
									<!--e:repeat agree cont-->
									<!--s:repeat agree cont-->
									<div class="agree-cont">
										<h3 class="agree-title">3. 개인정보의 처리 위탁</h3>
										<p>회사는 원활하고 향상된 서비스를 위하여 개인정보 처리를 타인에게 위탁할 수 있습니다.이 경우 회사는 사전에 다음 각 호의 사항 모두를 이용자에게 미리 알리고 동의를 받습니다. 그리고 회사는 위탁받은 업체가 정보통신망법에 따라 개인정보를 안전하게 처리하도록 필요한 사항을 규정하고 관리/감독을 하고 있습니다.</p>
										<ul>
											<li>메타넷: 정보전산 처리 및 유지관리</li>
											<li>성화기업택배, 디엠라인, 비즈콘: 이벤트 진행등에 따른 물품배송</li>
											<li>엠포플러스: 카카오 알림톡 및 톡기반 서비스</li>
											<li>(주)Nice신용평가정보: CI/DI 및 휴대폰번호 실명인증</li>
											<li>효성CMS: CSM, 카드자동결제 관리</li>
											<li>풀무원녹즙 가맹점: 고객 음용제품 배송 및 서비스</li>
											<li>엠포플러스: 문자발송(SMS/LMS)</li>
											<li>벨류랩, 마크로일 엠브레인, 이사이트코리아, 아이앤아이마케팅, 와이즈 인사이트: 소비자조사</li>
										</ul>
									</div>
									<!--e:repeat agree cont-->
									<!--s:repeat agree cont-->
									<div class="agree-cont">
										<h3 class="agree-title">4. 개인정보의 제 3자 제공</h3>
										<p>회사는 이용자들의 개인정보를 「개인정보의 수집·이용」에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 제3자에게 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.</p>
										<ol>
											<li><span>가.</span> 이용자들이 사전에 공개 또는 제3자 제공에 동의한 경우</li>
											<li><span>나.</span> 법령의 규정에 의거하거나, 수사, 조사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관 및 감독 당국의 요구가 있는 경우</li>
											<li><span>다.</span> 요금 정산을 위하여 필요한 경우</li>
											<li><span>라.</span> 통계작성, 학술연구,시장조사, 정보제공의 경우로서 특정 개인을 식별할 수 없는 형태로 제공되는 경우</li>
										</ol>
									</div>
									<!--e:repeat agree cont-->
									<!--s:repeat agree cont-->
									<div class="agree-cont">
										<h3 class="agree-title">5. 개인정보 수집방법</h3>
										<p>회사는 다음과 같은 방법으로 개인정보를 수집합니다.</p>
										<ol>
											<li><span>①</span> 홈페이지 이용</li>
											<li><span>②</span> 제휴사로부터의 제공</li>
											<li><span>③</span> 로그 분석 프로그램을 통한 생성정보 수집</li>
											<li><span>④</span> '쿠키(cookie)'에 의한 정보 수집</li>
											<li><span>⑤</span> Application을 통한 정보 수집</li>
										</ol>
									</div>
									<!--e:repeat agree cont-->
									<!--s:repeat agree cont-->
									<div class="agree-cont">
										<h3 class="agree-title">6. 개인정보의 보유 , 이용기간 및 파기</h3>
										<ol>
											<li><span>1)</span> 풀무원녹즙은 고객님이 동의한 개인정보 수집목적 또는 제공받은 목적이 달성되거나, 풀무원녹즙 이용약관에 표명한 절차에 따라 탈퇴를 요청한 경우, 지체 없이 파기합니다. 단, 법에 의해 일정기간 보유하여야 할 필요가 있을 경우에는 해당 기간 동안 고객님의 개인정보를 보유합니다.
												<ol>
													<li><span>①</span> 계약 또는 청약철회 등에 관한 기록
														<ul>
															<li>보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률</li>
															<li>보존기간 : 5년</li>
														</ul></li>
													<li><span>②</span> 대금결제 및 재화 등의 공급에 관한 기록
														<ul>
															<li>보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률</li>
															<li>보존기간 : 5년</li>
														</ul></li>
													<li><span>③</span> 소비자의 불만 또는 분쟁처리에 관한 기록
														<ul>
															<li>보존근거 : 전자상거래 등에서의 소비자보호에 관한 법률</li>
															<li>보존기간 : 3년</li>
														</ul></li>
													<li><span>④</span> 접속에 관한 기록보존
														<ul>
															<li>보존근거 : 통신비밀보호법</li>
															<li>보존기간 : 3개월</li>
														</ul></li>
													<li><span>⑤</span> 그 외
														<ul>
															<li>국세기본법 등에 따라 거래기록 등을 보관해야 하는 경우</li>
															<li>정보주체에게 별도 동의를 받은 경우</li>
														</ul></li>
												</ol></li>
											<li><span>2)</span> 개인정보의 파기 방법
												<p>회사는 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다. 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제하며, 어떠한 용도로도 열람 또는 이용될 수 없도록 처리합니다. 단, 이때 기록을 재생할 수 없는 기술적 방법은 사회통념상 현재의 기술수준에서 적절한 비용이 소요되는 방법을 말합니다. 해당 개인정보의 처리가 제3자에게 위탁된 경우에는 수탁자가 더 이상 해당 개인정보를 처리하지 못하도록 합니다.</p></li>
											<li><span>3)</span> 이용하지 아니하는 고객의 개인정보의 파기 등
												<p>회사는 개인정보보호법 제39조의6 제1항 에 따라 12개월간 이용내역(로그인, 주문등)이 없는 고객님의 개인정보를 다른 고객님의 개인정보와 분리하여 별도로 저장 · 관리합니다.</p>
												<p>개인정보 분리 예정의 고객님께 분리되기 1개월 전에 개인정보가 분리되어 저장 · 관리되는 사실과 기간 만료 일 및 해당 개인정보의 항목을 전자우편 · 서면 · 모사전송 · 전화 또는 이와 유사한 방법 중 어느 하나의 방법으로 고객님에게 알립니다.</p></li>
										</ol>
									</div>
									<!--e:repeat agree cont-->
									<!--s:repeat agree cont-->
									<div class="agree-cont">
										<h3 class="agree-title">7. 이용자 및 법정대리인의 권리ㆍ의무 및 그 행사방법</h3>
										<p>회사는 고객님의 개인정보를 보호하기 위해 노력하고 있습니다.</p>
										<p>회사의 고의 또는 과실 등 귀책사유 없이 ID, 비밀번호 공유 등 고객님의 부주의로 인해 발생하는 문제에 대해서는 회사는 책임지지 않습니다. 타인의 개인정보를 도용하여 회원 가입 또는 구매가 확인되었을 경우, 이용계약이 일방적으로 해지되어 회원자격이 상실될 수 있습니다.</p>
										<p>고객님의 ID 및 비밀번호는 원칙적으로 고객님만 사용하셔야 하며, 타인에게 이를 양도하거나 대여할 수 없습니다. 타인의 개인정보를 도용한 회원가입 또는 ID 도용으로 구매를 한 경우, 회원 자격 상실과 함께 관계법령에 의거하여 처벌될 수 있습니다.</p>
										<p>고객님은 게시물을 포함한 타인의 개인정보를 훼손하지 않도록 주의하셔야 합니다. 만약 이같은 책임을 다하지 못하고 타인의 정보 및 존엄성을 훼손할 시에는 '정보통신망 이용촉진 및 정보보호 등에 관한 법률' , '개인정보보호법', '주민등록법' 등에 의해 처벌받을 수 있습니다.</p>
										<p>이용자는 정보주체로서 다음과 같은 권리를 행사할 수 있습니다.</p>
										<ol>
											<li><span>①</span> 자신의 개인정보의 조회, 수정 및 가입해지의 요청</li>
											<li><span>②</span> 개인정보의 오류에 대한 정정 및 삭제의 요청</li>
											<li><span>③</span> 개인정보의 조회, 수정 및 해지, 삭제 등의 요청은 '고객정보변경' 및 '회원탈퇴' 등을 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정, 혹은 탈퇴가 가능합니다.</li>
											<li><span>④</span> 이용자가 개인정보의 오류에 대한 정정 및 삭제를 요청한 경우에는 정정 및 삭제를 완료할 때까지 해당 개인정보를 이용 또는 제공하지 않습니다. 이 경우, 잘못된 개인정보를 이용 또는 제공한 경우 지체 없이 수정하겠습니다.</li>
											<li><span>⑤</span> 회사는 이용자의 요청에 의해 해지 또는 삭제되는 개인정보는 개인정보의 파기절차 및 방법에 따라 처리합니다.</li>
											<li><span>⑥</span> 개인정보의 열람, 정정, 삭제, 처리, 정지 요구가 다른 법령상의 의무를 준수하기 위하여 불가피한 경우, 다른 사람의 생명, 신체를 해할 우려가 있거나 다른 사람의 재산과 그 밖의 이익을 부당하게 침해할 우려가 있는 경우, 개인정보를 처리하지 아니하면 정보주체와 약정한 서비스를 제공하지 못하는 등 계약이행이 곤란한 경우는 요구를 거절할 수 있습니다.</li>
										</ol>
									</div>
									<!--e:repeat agree cont-->
									<!--s:repeat agree cont-->
									<div class="agree-cont">
										<h3 class="agree-title">8. 개인정보 자동 수집 장치의 설치/운영 및 거부에 관한 사항</h3>
										<p>회사는 개인화되고 맞춤화된 서비스를 제공하기 위해서 이용자의 정보를 저장하고 수시로 불러오는 '쿠키(cookie)'를 사용합니다. 쿠키는 웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에게 보내는 아주 작은 텍스트 파일로 이용자 컴퓨터의 하드디스크에 저장됩니다.</p>
										<ol>
											<li><span>①</span> 회사는 다음과 같은 목적을 위해 쿠키를 사용합니다.
												<ol>
													<li><span>가.</span> 쿠키의 사용 목적<br> 회사는 이용자의 편의를 위하여 쿠키를 운영합니다. 회사가 쿠키를 통해 수집하는 정보는 회원 ID에 한하며, 그 외의 다른 정보는 수집하지 않습니다.</li>
													<li><span>나.</span> 회사가 쿠키(cookie)를 통해 수집한 회원 ID는 다음의 목적을 위해 사용됩니다.
														<ol>
															<li><span>1)</span> 개인의 관심 분야에 따라 차별화된 정보를 제공</li>
															<li><span>2)</span> 회원과 비회원의 접속빈도 또는 머문 시간 등을 분석하여 이용자의 취향과 관심분야를 파악하여 타겟(target) 마케팅에 활용</li>
															<li><span>3)</span> 쇼핑한 품목들에 대한 정보와 관심 있게 둘러본 품목들에 대한 자취를 추적하여 다음 번 쇼핑 때 개인 맞춤 서비스를 제공</li>
															<li><span>4)</span> 유료서비스 이용 시 이용기간 안내</li>
															<li><span>5)</span> 회원들의 습관을 분석하여 서비스 개편 등의 척도</li>
														</ol></li>
												</ol></li>
											<li><span>②</span> 쿠키의 설치/운영 및 거부
												<ol>
													<li><span>가.</span> 쿠이용자는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서 이용자는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다. 다만, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 회사의 일부 서비스는 이용에 어려움이 있을 수 있습니다.</li>
													<li><span>나.</span> 쿠키 설치 허용 여부를 지정하는 방법(Internet Explorer의 경우)
														<ol>
															<li><span>1)</span> [도구] 메뉴에서 [인터넷 옵션]을 선택합니다.</li>
															<li><span>2)</span> [개인정보 탭]을 클릭합니다.</li>
															<li><span>3)</span> [개인정보처리 수준]을 설정하시면 됩니다.</li>
														</ol></li>
												</ol></li>
										</ol>
									</div>
									<!--e:repeat agree cont-->
									<!--s:repeat agree cont-->
									<div class="agree-cont">
										<h3 class="agree-title">9. 개인정보의 기술적/관리적 보호 대책</h3>
										<p>회사는 「개인정보보호법」 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적, 관리적, 물리적 조치를 하고 있습니다.</p>
										<ol>
											<li><span>①</span> 개인정보 암호화 : 이용자의 개인정보는 비밀번호에 의해 보호되며, 중요한 데이터는 파일 및 전송 데이터를 암호화하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 통해 보호 하고 있습니다.</li>
											<li><span>②</span> 해킹 등에 대비한 기술적 대책 : 회사는 해킹이나 컴퓨터 바이러스 등에 의해 회원의 개인정보가 유출되거나 훼손되는 것을 막기 위해 최선을 다하고 있습니다.
												<ol>
													<li><span>가.</span> 개인정보의 훼손에 대비해서 자료를 수시로 백업</li>
													<li><span>나.</span> 최신 백신프로그램을 이용하여 이용자들의 개인정보나 자료가 누출되거나 손상되지 않도록 방지</li>
													<li><span>다.</span> 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제</li>
													<li><span>라.</span> 물리적 무단 접근을 차단하기 위해 통제된 구역에 시스템 설치</li>
													<li><span>마.</span> 기타 시스템적으로 보안성을 확보하기 위해 가능한 모든 기술적 장치를 갖추려 노력하고 있습니다.</li>
												</ol></li>
											<li><span>③</span> 개인정보처리시스템 접근 제한 : 회사는 개인정보를 처리할 수 있도록 체계적으로 구성한 데이터베이스시스템에 대한 접근권한의 부여, 변경, 말소 등에 관한 기준을 수립하고 비밀번호의 생성 방법, 변경 주기 등을 규정 운영하며 기타 개인정보에 대한 접근통제를 위해 필요한 조치를 다하고 있습니다.</li>
											<li><span>④</span> 처리직원의 최소화 및 교육 :회사의 개인정보관련 처리 직원은 담당자에 한정시키고 있고 이를 위한 별도의 비밀번호를 부여하여 정기적으로 갱신하고 있으며, 담당자에 대한 수시 교육을 통하여 회사의 개인정보처리방침의 준수를 항상 강조하고 있습니다.</li>
											<li><span>⑤</span> 개인정보보호전담기구의 운영 : 사내 개인정보보호전담기구 등을 통하여 회사의 개인정보처리방침의 이행사항 및 담당자의 준수여부를 확인하여 문제가 발견될 경우 즉시 수정하고 바로 잡을 수 있도록 노력하고 있습니다.</li>
										</ol>
									</div>
									<!--e:repeat agree cont-->
									<!--s:repeat agree cont-->
									<div class="agree-cont">
										<h3 class="agree-title">10. 개인정보보호 관리책임자</h3>
										<p>회사는 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 개인정보보호 관리책임자를 지정하고 있습니다. (개인정보보호법 제31조 제1항에 따른 개인정보 보호책임자)</p>
										<dl>
											<!-- s: 20200310 개인정보관리책임자 정보 수정 -->
											<dt>&lt;개인정보관리 책임자&gt;</dt>
											<dd>성 명: 장종의</dd>
											<dd>소속부서: FDD 영업본부장</dd>
											<dd>전자우편: jejang@pulmuone.com</dd>
											<dd>전화번호: 02-2186-8786</dd>
											<dd>팩스번호: 02-582-4115</dd>
											<!-- e: 20200310 개인정보관리책임자 정보 수정 -->
										</dl>
										<dl>
											<dt>&lt;개인정보관리 부서&gt;</dt>
											<dd>부서명: 디지털커뮤니케이션팀</dd>
											<dd>담당자: 김수현</dd>
											<dd>전자우편: shkimi@pulmuone.com</dd>
											<dd>전화번호: 02-2186-8532</dd>
											<dd>팩스번호: 02-582-4115</dd>
										</dl>
										<p>
											귀하께서는 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보보호책임자에게 신고하실 수 있으며, 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.<br> 기타 개인정보 침해/피해와 관련한 상담이 필요한 경우에는 아래 기관으로 문의하시기 바랍니다.
										</p>
										<ul>
											<li>개인정보침해신고센터 (http://privacy.kisa.or.kr / 국번없이 118)</li>
											<li>대검찰청 사이버수사과 (http://www.spo.go.kr / 국번없이 02-3480-3571)</li>
											<li>경찰청 사이버안전국 (http://cyberbureau.police.go.kr / 국번없이 182)</li>
											<li>개인정보 분쟁조정위원회 (http://kopico.go.kr / 02-2100-2499)</li>
										</ul>

									</div>
									<!--e:repeat agree cont-->
									<!--s:repeat agree cont-->
									<div class="agree-cont">
										<h3 class="agree-title">11. 고지의 의무</h3>
										<p>이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 가능한 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.</p>
										<dl>
											<!-- s: 20200310 개인정보처리방침 버전번호,공고, 시행일자 변경 -->
											<dt>개인정보처리방침 버전번호: 6.0</dt>
											<dd>공고일자 : 2020년 3월 3일</dd>
											<dd>시행일자 : 2020년 3월 10일</dd>
											<!-- e: 20200310 개인정보처리방침 버전번호,공고, 시행일자 변경 -->
										</dl>
									</div>
									<!--e:repeat agree cont-->
									<!-- e: 20200217 약관 수정 (최신 수급 컨텐츠로 수정 -->
									<!-- e: 20200310 약관 수정 (최신 수급 컨텐츠로 수정 -->

									<p>이전 버전 개인정보 처리방침은 공지사항에서 확인할 수 있습니다.</p>
									<!-- 20200221 문구 추가 -->
								</div>

							</div>
						</div>
					</div>

				</div>
				<div class="dropdown site-link" style="padding-block: 20px; margin-top: 10px; border-top: 1px solid #e5e5e5; margin-inline: 10px;">
					<button class="btn dropdown-toggle" type="button" style="width: 230px" data-toggle="dropdown" aria-expanded="false">개인정보처리방침 변경이력</button>
					<div class="dropdown-menu" style="width: 230px">
						<a class="dropdown-item privacy" data-idx="1" href="javascript:void(0)">2023-09-21 시행</a> <a class="dropdown-item privacy" data-idx="2" href="javascript:void(0)">2023-08-10 시행</a> <a class="dropdown-item privacy" data-idx="3" href="javascript:void(0)">2023-01-25 시행</a> <a class="dropdown-item privacy" data-idx="4" href="javascript:void(0)">2020-03-10 시행</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>