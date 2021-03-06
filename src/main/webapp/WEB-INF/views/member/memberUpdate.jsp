<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	$(document).ready(function(){
		
		$("#zipcodeBtn").on('click', function(){
			
		    new daum.Postcode({
		        oncomplete: function(data) {
					console.log(data);
					$("#addr1").val(data.roadAddress);
					$("#zipcode").val(data.zonecode);
			    }
		    }).open();
		    
		});


		$("#updateBtn").on('click', function(){
			// client side - validation
			// server side - validation
			// validation 로직은 일단 생략한다.
			
			$("#frm").submit();
			
		});

			
	});

</script>


<form id="frm" class="form-horizontal" role="form" action="${cp }/member/update" method="POST" enctype="multipart/form-data">
tiles
	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">사용자 사진</label>
		<div class="col-sm-10">
			<img src="${cp }/member/profileImg?userid=${memberVo.userid}"/>
			<input type="file" name="file"/>
		</div>
	</div>
	
	<div class="form-group">
		<label for="userid" class="col-sm-2 control-label">사용자 아이디</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="userid" name="userid" placeholder="사용자 아이디" value="${memberVo.userid }" READONLY>
		</div>
	</div>

	<div class="form-group">
		<label for="userNm" class="col-sm-2 control-label">사용자 이름</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="usernm" name="usernm" placeholder="사용자 이름" value="${memberVo.usernm }">
		</div>
	</div>
	<div class="form-group">
		<label for="useralias" class="col-sm-2 control-label">별명</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="alias" name="alias" placeholder="사용자 별명" value="${memberVo.alias }">
		</div>
	</div>
	<div class="form-group">
		<label for="pass" class="col-sm-2 control-label">Password</label>
		<div class="col-sm-10">
			<input type="password" class="form-control" id="pass" name="pass" placeholder="사용자 비밀번호" value="${memberVo.pass }">
		</div>
	</div>
	<div class="form-group">
		<label for="addr1" class="col-sm-2 control-label">주소</label>
		<div class="col-sm-10">
			<button id="zipcodeBtn" type="button" class="btn btn-default">우편번호 찾기</button> <br>
			<input type="text" class="form-control" id="addr1" name="addr1" placeholder="사용자 주소" READONLY value="${memberVo.addr1 }"> 
		</div>
	</div>
	<div class="form-group">
		<label for="addr2" class="col-sm-2 control-label">상세주소</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="addr2" name="addr2" placeholder="사용자 상세주소" value="${memberVo.addr2 }">
		</div>
	</div>
	<div class="form-group">
		<label for="zipcode" class="col-sm-2 control-label">우편번호</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="사용자 우편번호" value="${memberVo.zipcode }" READONLY>
		</div>
	</div>

	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button id="updateBtn" type="button" class="btn btn-default">사용자 수정</button>
		</div>
	</div>
</form>
