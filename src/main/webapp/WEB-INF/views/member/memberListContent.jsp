<%@page import="kr.or.ddit.member.model.MemberVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script>
	$(document).ready(function() {
		$("#memberList tr").on("click", function() {
			//console.log("memberList tr click");

			// data-userid
			var userid = $(this).data("userid");
			console.log("userid : " + userid);

			document.location = "/member/member?userid=" + userid;

		});
	});
</script>


<div class="row">
	tiles : memberListContent.jsp
	<div class="col-sm-8 blog-main">
		<h2 class="sub-header">사용자</h2>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>사용자 아이디</th>
						<th>사용자 이름</th>
						<th>사용자 별명</th>
						<th>등록일시</th>
					</tr>
				</thead>
				<tbody id="memberList">
					<c:forEach items="${memberList }" var="member">
						<tr data-userid="${member.userid }">
							<td>${member.userid }</td>
							<td>${member.usernm }</td>
							<td>${member.alias }</td>
							<!-- format : yyyy-MM-dd -->
							<td><fmt:formatDate value="${member.reg_dt }" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<a class="btn btn-default pull-right" href="${cp }/member/regist">사용자 등록</a>

		<div class="text-center">
			<ul class="pagination">
				<c:forEach var="i" begin="1" end="${pages }" step="1">
					<c:choose>
						<c:when test="${i == page }">
							<li class="active"><span>${i }</span></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath }/member/list?page=${i }">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
