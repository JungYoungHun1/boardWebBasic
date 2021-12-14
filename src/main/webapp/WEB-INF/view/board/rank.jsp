<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="/res/css/board/list.css?ver=3">
<h1>${requestScope.title}</h1>
<c:choose>
    <c:when test="${fn:length(requestScope.list) == 0}">
        <div>랭킹이 없습니다.</div>
    </c:when>
    <c:otherwise>

        <div>
            <table id = "boardTable">
                <colgroup>
                    <col width="20%">
                    <col>
                    <col>
                    <col width="100px">
                    <col>
                    <col>
                </colgroup>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <c:if test="${param.type == 1}">
                    <th>조회수</th>
                    </c:if>
                    <c:if test="${param.type == 2}">
                        <th>댓글수</th>
                    </c:if>
                    <c:if test="${param.type == 3}">
                        <th>좋아요</th>
                    </c:if>
                    <th>작성자</th>
                    <th>작성일시</th>
                </tr>
                <c:forEach items="${requestScope.list}" var ="item">
                    <c:set var="eachTitle" value="${item.title}"/><%--fn:replace(fn:replace(item.title, '>', '&gt;'), '<', '&lt;')}" /> 서블릿에서 막아놓음--%>
                    <c:if test="${param.searchType == 1 || param.searchType == 3 || param.searchType == 5}">
                        <c:set var="eachTitle" value="${fn:replace(eachTitle, param.searchText, '<mark>' += param.searchText += '</mark>')}" />
                    </c:if>
                    <c:set var="eachWriterNm" value="${fn:replace(fn:replace(item.writerNm, '>', '&gt;'), '<', '&lt;')}" />
                    <c:if test="${param.searchType == 4 || param.searchType == 5}">
                        <c:set var="eachWriterNm" value="${fn:replace(eachWriterNm, param.searchText, '<mark>' += param.searchText += '</mark>')}" />
                    </c:if>
                    <tr class="record" onclick="moveToDetail(${item.iboard});">
                        <td>${item.iboard}</td>
                        <td>${eachTitle}</td>
                        <c:if test="${param.type == 1}">
                        <td>${item.hit}</td>
                        </c:if>
                        <c:if test="${param.type == 2 || param.type == 3}">
                            <td>${item.cnt}</td>
                        </c:if>
                        <td>${eachWriterNm}</td>
                        <td>${item.rdt eq item.mdt? item.rdt : item.mdt}${item.rdt eq item.mdt? "" : "(수정됨)"}</td>
                    </tr>
                </c:forEach>
                    <%--        c:out으로 감싸는이유 - String형의 보안때문에. 제목이나 내용같은 것들에
                                자바스크립트 문법이 들어갔을때 그게 실행이 되버리기 때문에       --%>
            </table>
        </div>
    </c:otherwise>
</c:choose>
<script src="/res/js/board/list.js?ver=2"></script>

