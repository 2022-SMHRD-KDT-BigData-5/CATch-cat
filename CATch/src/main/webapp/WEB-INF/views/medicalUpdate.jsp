<%@page import="com.smhrd.domain.Vaccination"%>
<%@page import="com.smhrd.domain.Medical"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.CatCard"%>
<%@page import="com.smhrd.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	Member member = (Member)session.getAttribute("member");
 	CatCard catcardInfo = (CatCard)session.getAttribute("catcardInfo");
 	List<Medical> medicalList = (List<Medical>)session.getAttribute("medicalList");
	List<Vaccination> jh = (List<Vaccination>)session.getAttribute("jh");
	List<Vaccination> gg = (List<Vaccination>)session.getAttribute("gg");
	List<Vaccination> jb = (List<Vaccination>)session.getAttribute("jb");
	List<Vaccination> hc = (List<Vaccination>)session.getAttribute("hc");
	List<Vaccination> ss = (List<Vaccination>)session.getAttribute("ss");

	%>

	<div class="testmonial_wrap">
		<div class="single_testmonial d-flex align-items-center">

			<h7>진료 내역</h7>
			<div class="medical_thumb">
				<table class="table table-border table-hover">
					<tr>
						<td></td>
						<td>진료병원</td>
						<td>진료내역</td>
						<td>진료일</td>
					</tr>
					<c:forEach items="${medicalList}" var="medi" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${medi.getMedi_name()}</td>
							<td>${medi.getMedi_content()}</td>
							<td>${medi.getMedi_date()}</td>
						</tr>
					</c:forEach>
				</table>
				
				<form action="mediUpdate.do">
					<input type="hidden" name="medi_id" value=<%=member.getMem_id() %> >  
					<input type="hidden" name="medi_name" value=<%=member.getMem_id() %>> 
					<input type="hidden" name="cat_seq" value=<%=catcardInfo.getCat_seq() %>>
					진료 내용 <textarea name="medi_content"></textarea>
					<br>
					<input type="submit" value="등록">
				</form>
			</div>
			
			<h7>접종 백신</h7>
			<div class="vacc_content">
			<form action="vaccUpdate.do">
				<input type="hidden" name="medi_id" value=<%=member.getMem_id() %>>
				<input type="hidden" name="medi_name" value=<%=member.getMem_name() %>>
				<input type="hidden" name="cat_seq" value=<%=catcardInfo.getCat_seq() %>>
				종합백신 <input type="checkbox" name="vacc_type" value="종합백신">
				광견병 <input type="checkbox" name="vacc_type" value="광견병">
				전염성 복막염 <input type="checkbox" name="vacc_type" value="전염성 복막염">
				항체가검사 <input type="checkbox" name="vacc_type" value="항체가검사">
				심장사상충 <input type="checkbox" name="vacc_type" value="심장사상충">
				<br>
				<input type="submit" value="접종완료">
			</form>

			</div>
		</div>
	</div>




	<form action=""></form>

</body>
</html>