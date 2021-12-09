<%@ page import="com.koreait.basic.board.model.BoardVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href="/res/css/board/detail.css">
<% BoardVO vo = (BoardVO) request.getAttribute("data");%>

<div>
    <c:if test="${sessionScope.loginUser.iuser == requestScope.data.writer}">
    <div>
        <a href="/board/del?iboard=${requestScope.data.iboard}"><button>삭제</button></a>
        <a href="/board/regmod?iboard=${requestScope.data.iboard}"><button>수정</button></a>
    </div>
    </c:if>
    <div>글번호: ${requestScope.data.iboard}</div>
    <div>조회수 : <c:out value="${requestScope.data.hit}"/></div>
    <div>작성자 : <c:out value="${requestScope.data.writerNm}"/></div>
    <% if(vo.getRdt().equals(vo.getMdt())){%>
    <div>등록일시 : <c:out value="${requestScope.data.rdt}"/></div>
    <% } else {%>
    <div>등록일시 : <c:out value="${requestScope.data.rdt}"/></div>
    <div>수정일시 : <c:out value="${requestScope.data.mdt}"/></div>
    <%}%>
    <div>제목 : <c:out value="${requestScope.data.title}"/></div>
    <div>내용 : <c:out value="${requestScope.data.ctnt}"/></div>


    <c:if test="${sessionScope.loginUser != null}">
    <div>댓글 쓰기</div>
    <div>
        <form action="/board/cmt/reg" method="post">
            <div><input type="hidden" name="iboard" value="${requestScope.data.iboard}"></div>
            <div><textarea name="ctnt"></textarea>
            <input type="submit" value="등록"></div>
        </form>
    </div>
    </c:if>
    <table>
        <tr>
            <th>내용</th>
            <th>작성자</th>
            <th>작성일시</th>
<%--            <C:if test="${requestScope.data.rdt != requestScope.data.mdt}">--%>
<%--                <th>수정일시</th>--%>
<%--            </C:if>--%>
            <th>비고</th>
        </tr>
        <c:forEach items="${requestScope.cmtList}" var="item">
            <tr>
                <td><c:out value="${item.ctnt}"></c:out></td>
                <td>${item.writerNm}</td>
                <td>${item.rdt}</td>
<%--                <C:if test="${requestScope.data.rdt != requestScope.data.mdt}">--%>
<%--                    <td>${item.mdt}</td>--%>
<%--                </C:if>--%>
                <td>
                    <c:if test="${sessionScope.loginUser.iuser == item.writer}">
                        <button onclick="openModForm(${item.icmt}, '${item.ctnt}');">수정</button>
                        <button onclick="isDelCmt(${requestScope.data.iboard}, ${item.icmt});">삭제</button>
                        </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>

</div>
<div class="cmtModContainer">
    <div class="cmtModBody">
        <form action="/board/cmt/mod" method="post" id="cmtModFrm">
            <input type="hidden" name="iboard" value="${requestScope.data.iboard}">
            <input type="hidden" name="icmt">
            <div><input type="text" name="ctnt" placeholder="댓글 내용"></div>
            <div><input type="submit" value="수정">
            <input type="button" value="취소" id="btnCancel"></div>
        </form>
    </div>
</div>
<script src="/res/js/board/detail.js?ver=1"></script>