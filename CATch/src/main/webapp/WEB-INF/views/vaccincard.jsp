<%@page import="com.smhrd.domain.Vaccination"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 이곳은 바로바로~~ 백신카드 테이블만 저장된 곳입니다~~ -->
<%
	List<Vaccination> jh = (List<Vaccination>)session.getAttribute("jh");
	List<Vaccination> gg = (List<Vaccination>)session.getAttribute("gg");
	List<Vaccination> jb = (List<Vaccination>)session.getAttribute("jb");
	List<Vaccination> hc = (List<Vaccination>)session.getAttribute("hc");
	List<Vaccination> ss = (List<Vaccination>)session.getAttribute("ss");
%>
	
                  
                    <table class = "table table-border table-hover">
                                    <tr class='medi_content_head'>
                                        <td>백신</td>
                                        <td>접종여부</td>
                                        <td>접종병원</td>
                                        <td>접종일자</td>
                                    </tr>
                                    <c:forEach items="${jh}" var="jh" varStatus="status">
                                    <tr>
                                        <td>${jh.getVacc_type()}</td>
                                        <td>${status.count}차</td>
                                        <td>${jh.getMedi_name()}</td>
                                        <td>${fn:split(jh.getVacc_date(), " ")[0]}</td>
                                    </tr>
                                    </c:forEach>
                                    
                                    
                                    <c:choose>
                                    <c:when test="${empty gg}">
                                    	<tr>
                                    	<td>광견병</td>
                                    	<td>미접종</td>
                                    	<td></td>
                                    	<td></td>
                                    </tr>
                                    </c:when>
                                    <c:otherwise>
                                    	<tr>
                                    	<td><%=gg.get(0).getVacc_type() %></td>
                                    	<td>접종</td>
                                    	<td><%=gg.get(0).getMedi_name() %></td>
                                    	<td><%=gg.get(0).getVacc_date().getYear()+1900 %>-0<%=gg.get(0).getVacc_date().getMonth()+1 %>-<%=gg.get(0).getVacc_date().getDate() %></td>
                                    </tr>
                                    </c:otherwise>
                                    </c:choose>
                                    
                                    
                                    <c:choose>
                                    <c:when test="${empty jb}">
                                    	<tr>
                                    	<td>전염성 복막염</td>
                                    	<td>미접종</td>
                                    	<td></td>
                                    	<td></td>
                                    </tr>
                                    </c:when>
                                    <c:otherwise>
                                    	<tr>
                                    	<td><%=jb.get(0).getVacc_type() %></td>
                                    	<td>접종완료</td>
                                    	<td><%=jb.get(0).getMedi_name() %></td>
                                    	<td><%=jb.get(0).getVacc_date().getYear()+1900 %>-0<%=jb.get(0).getVacc_date().getMonth()+1 %>-<%=jb.get(0).getVacc_date().getDate() %></td>
                                    </tr>
                                    </c:otherwise>
                                    </c:choose>
                                    
                                    
                                    <c:choose>
                                    <c:when test="${empty hc}">
                                    	<tr>
                                    	<td>항체 가검사</td>
                                    	<td>미접종</td>
                                    	<td></td>
                                    	<td></td>
                                    </tr>
                                    </c:when>
                                    <c:otherwise>
                                    	<tr>
                                    	<td><%=hc.get(0).getVacc_type() %></td>
                                    	<td>접종완료</td>
                                    	<td><%=hc.get(0).getMedi_name() %></td>
                                    	<td><%=hc.get(0).getVacc_date().getYear()+1900 %>-0<%=hc.get(0).getVacc_date().getMonth()+1 %>-<%=hc.get(0).getVacc_date().getDate() %></td>
                                    </tr>
                                    </c:otherwise>
                                    </c:choose>
                                    
                                    
                                    <c:choose>
                                    <c:when test="${empty ss}">
                                    	<tr>
                                    	<td>심장사상충</td>
                                    	<td>미접종</td>
                                    	<td></td>
                                    	<td></td>
                                    </tr>
                                    </c:when>
                                    <c:otherwise>
                                    	<tr>
                                    	<td><%=ss.get(0).getVacc_type() %></td>
                                    	<td>최근접종내역</td>
                                    	<td><%=ss.get(0).getMedi_name() %></td>
                                    	<td><%=ss.get(0).getVacc_date().getYear()+1900 %>-0<%=ss.get(0).getVacc_date().getMonth()+1 %>-<%=ss.get(0).getVacc_date().getDate() %></td>
                                    </tr>
                                    </c:otherwise>
                                    </c:choose>
                                    

                                </table>
                               
</body>
</html>