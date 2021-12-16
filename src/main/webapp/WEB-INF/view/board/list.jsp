<%@ page import="com.koreait.basic.board.model.BoardHeartEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="/res/css/board/list.css?ver=3">
<div>
    <form action="/board/list" method="get" id="searchFrm">
        <span>
            <select name ="searchType">
                <option value="1"${param.searchType == 1 ? 'selected' : ''}>제목</option>
                <option value="2"${param.searchType == 2 ? 'selected' : ''}>내용</option>
                <option value="3"${param.searchType == 3 ? 'selected' : ''}>제목/내용</option>
                <option value="4"${param.searchType == 4 ? 'selected' : ''}>글쓴이</option>
                <option value="5"${param.searchType == 5 ? 'selected' : ''}>전체</option>
            </select>
            <input type="search" name="searchText" value="${param.searchText}">
            <input type="submit" value="검색">
            나타낼 행 수 :
            <select name = "rowCnt">
                <c:forEach var = "cnt" begin="5" end="30" step="5">
                    <option value="${cnt}"${param.rowCnt == cnt ? 'selected' : ''}>${cnt}개</option>
                </c:forEach>
<%--                selected - 계속 고정--%>
            </select>
        </span>
        <span>정렬 : <select name="array">
            <option value="1"${param.array == 1 ? 'selected' : ''}>최신순</option>
            <option value="2"${param.array == 2 ? 'selected' : ''}>제목순</option>
            <option value="3"${param.array == 3 ? 'selected' : ''}>조회순</option>
        </select></span>

    </form>

</div>
<c:choose>
    <c:when test="${requestScope.maxPage == 0}">
        <div>글이 없습니다.</div>
    </c:when>
    <c:otherwise>

<div>
    <table id = "boardTable">
        <colgroup>
            <col width="20%">
            <col width="200px">
            <col>
            <col>
            <col>
            <col>
        </colgroup>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>조회수</th>
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

            <c:set var="pImg" value="defaultProfile.png"/>
            <c:if test="${item.profileImg != null}">
                <c:set var="pImg" value="profile/${item.writer}/${item.profileImg}"/>
            </c:if>

            <tr class="record" onclick="moveToDetail(${item.iboard});">
                <td>${item.iboard} <i class="fas fa-heart" id="heart" style="color: red"></i>x ${requestScope.HeartUp.hit}</td>
                <td>${eachTitle}</td>
                <td>${item.hit}</td>
                <td><span class = "line"><span class="circular--img circular--size40">
                    <img src="/res/img/${pImg}"></span><span class="writer"> ${eachWriterNm}</span></span></td>
                <td>${item.rdt eq item.mdt? item.rdt : item.mdt}${item.rdt eq item.mdt? "" : "(수정됨)"}</td>
            </tr>
        </c:forEach>
<%--        c:out으로 감싸는이유 - String형의 보안때문에. 제목이나 내용같은 것들에
            자바스크립트 문법이 들어갔을때 그게 실행이 되버리기 때문에       --%>
    </table>
</div>
<div class="pageContainer">
    <c:set var="selectedPage" value="${param.page == null ? 1 : param.page}"/>
    <c:forEach var="page" begin="1" end="${maxPage}">
        <div><a href="/board/list?page=${page}&searchType=${param.searchType}&searchText=${param.searchText}&rowCnt=${param.rowCnt}&array=${param.array}"><span class="${selectedPage == page ? 'selected' : ''}">${page}</span></a></div>
<%--        <div><a href="/board/list?page=${page}&array=${param.array}"><span class="${selectedPage == page ? 'selected' : ''}">${page}</span></a></div>--%>
    </c:forEach>

<%--    $searchtype - 페이지 넘어가도 안풀리게 해줌--%>
</div>
    </c:otherwise>
</c:choose>
<script src="/res/js/board/list.js?ver=2"></script>
