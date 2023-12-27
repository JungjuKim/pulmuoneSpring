<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


		
				
<div class="container">


    <div class="border-wrapper">
        <h2 class="container-title">
            개인정보 변경
        </h2>
    </div>
    
    <div class="box-partition nobox" style="width:640px;">
    
        <div class="part" style="padding:13px 0 40px;">
            <div class="part-head" style="margin-bottom:26px;">
                <h4 style="line-height:34px;">고객님의 개인정보보호를 위해<br>
                    비밀번호를 입력해주세요.
                </h4>
            </div>
            <form action="/mypage/personal/info/detail" id="checkPwd">
                <div class="form-input disabled">
                    <dl>
                        <dt>
                            <label for="input01">아이디</label>
                        </dt>
                        <dd>
                        	<sec:authentication property="principal.member.memberId" var="memberId"/>
                            <input type="text" id="input01" name="memberId" value="${ memberId }" disabled="">
                        </dd>
                    </dl>
                </div>
                
                <div class="form-input">
                    <dl>
                        <dt>
                            <label for="input01">비밀번호</label>
                        </dt>
                        <dd>
                            <input type="password" id="input02" name="pwd" value="">
                        </dd>
                    </dl>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
            </form>
        </div>
        
        <div class="part">
            <div class="button-set b0" style="margin-top:10px;">
                <button type="submit" class="basic-big-button primary" id="pwdCheckBtn">
                    확인
                </button>
            </div>
        </div>
        
    </div>
    
</div>

 	
<script>
// 	$(function () {
// 	    $("div.item p").each(function(index) {
// 	        if ($(this).text() != 0) {
// 	            $("div.item:eq(" + index + ")").parent("li").addClass("active");
// 	        } // if
// 	    });
// 	})
	

	$().ready(function() {
	
	    $("#input02").keydown(function(keyNum){
		    if(keyNum.keyCode == 13){
		    	$("#pwdCheckBtn").click()
		    }
	    });
	
	    $("#pwdCheckBtn").click(function(e){
	    	e.preventDefault();
	    	
			var header = '${_csrf.headerName}';
			var token = '${_csrf.token}';
			
			var input = $("#input02").val();
			$.ajax({
				url: "/ajax/mypage/personal/info" , 
				dataType:"json",
				data: { pwd : input },
				type:"POST",
				cache:false ,
				beforeSend: function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success: function ( pwdIsMatch,  textStatus, jqXHR ){
					if( pwdIsMatch ) {
						location.href = "/mypage/personal/info/detail";

					} else {  
						alert("비밀번호가 일치하지 않습니다.");
					}
				 
				},
				error:function (request, status, error){
					alert("에러~~~ ");
					console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
	    	
	    	
// 	    	post({
// 			    url: "/mypage/personal/info",
// 			    param: { memberPwd:$("#input02").val()}
// 		    	}, function(response) {
// 	    	});
	    });
	    
	});

</script>

