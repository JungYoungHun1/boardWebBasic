<%--<%@ page import="com.koreait.basic.board.model.BoardVO" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<link rel = "stylesheet" href="/res/css/board/detail.css?ver=2">--%>
<%--<% BoardVO vo = (BoardVO) request.getAttribute("data");%>--%>

<%--<div>--%>
<%--    <c:if test="${sessionScope.loginUser.iuser == requestScope.data.writer}">--%>
<%--    <div>--%>
<%--        <a href="/board/del?iboard=${requestScope.data.iboard}"><button>삭제</button></a>--%>
<%--        <a href="/board/regmod?iboard=${requestScope.data.iboard}"><button>수정</button></a>--%>
<%--    </div>--%>
<%--    </c:if>--%>
<%--    <c:if test="${sessionScope.loginUser != null}">--%>
<%--    <div class="fav">--%>
<%--        <c:choose>--%>
<%--            <c:when test="${requestScope.isHeart == 1}">--%>
<%--            <a href="/board/heart?proc=2&iboard=${requestScope.data.iboard}"><i class="fas fa-heart", style="color: red"></i></a>--%>
<%--                <span> : ${requestScope.HeartUp.hit}</span>--%>
<%--            </c:when>--%>
<%--            <c:otherwise>--%>
<%--            <a href="/board/heart?proc=1&iboard=${requestScope.data.iboard}"><i class="far fa-heart", style="color: red"></i></a>--%>
<%--                <span> : ${requestScope.HeartUp.hit}</span>--%>
<%--            </c:otherwise>--%>
<%--        </c:choose>--%>
<%--    </div>--%>
<%--    </c:if>--%>

<%--    <div>글번호 : ${requestScope.data.iboard}</div>--%>
<%--    <div>조회수 : <c:out value="${requestScope.data.hit}"/></div>--%>
<%--    <div>작성자 : <c:out value="${requestScope.data.writerNm}"/></div>--%>
<%--    <% if(vo.getRdt().equals(vo.getMdt())){%>--%>
<%--    <div>등록일시 : <c:out value="${requestScope.data.rdt}"/></div>--%>
<%--    <% } else {%>--%>
<%--    <div>등록일시 : <c:out value="${requestScope.data.rdt}"/></div>--%>
<%--    <div>수정일시 : <c:out value="${requestScope.data.mdt}"/></div>--%>
<%--    <%}%>--%>
<%--    <div>제목 : <c:out value="${requestScope.data.title}"/></div>--%>
<%--    <div>내용 : <c:out value="${requestScope.data.ctnt}"/></div>--%>



<%--    <div id="cmtListContainer" data-iboard="${requestScope.data.iboard}"></div>--%>

<%--</div>--%>
<%--<div class="cmtModContainer">--%>
<%--    <div class="cmtModBody">--%>
<%--        <form action="/board/cmt/mod" method="post" id="cmtModFrm">--%>
<%--            <input type="hidden" name="iboard" value="${requestScope.data.iboard}">--%>
<%--            <input type="hidden" name="icmt">--%>
<%--            <div><input type="text" name="ctnt" placeholder="댓글 내용"></div>--%>
<%--            <div><input type="submit" value="수정">--%>
<%--            <input type="button" value="취소" id="btnCancel"></div>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<c:if test="${sessionScope.loginUser != null}">--%>
<%--    <div>--%>
<%--        <form action="/board/cmt/reg" method="post">--%>
<%--            <div><input type="hidden" name="iboard" value="${requestScope.data.iboard}"></div>--%>
<%--            <div><input type="text" name="ctnt" placeholder="댓글 입력">--%>
<%--                <input type="submit" value="등록"></div>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--</c:if>--%>
<%--<script src="/res/js/board/detail2.js?ver=3"></script>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/res/css/board/detail.css">
<div>
    <c:if test="${sessionScope.loginUser.iuser == requestScope.data.writer}">
        <div>
            <a href="/board/del?iboard=${requestScope.data.iboard}">
                <button>삭제</button>
            </a>
            <a href="/board/regmod?iboard=${requestScope.data.iboard}">
                <button>수정</button>
            </a>
        </div>
    </c:if>

    <div>
        <c:if test="${sessionScope.loginUser != null}">
            <c:choose>
                <c:when test="${requestScope.isHeart == 1}">
                    <a href="/board/heart?proc=2&iboard=${requestScope.data.iboard}"><i class="fas fa-heart"></i></a>
                </c:when>
                <c:otherwise>
                    <a href="/board/heart?proc=1&iboard=${requestScope.data.iboard}"><i class="far fa-heart"></i></a>
                </c:otherwise>
            </c:choose>
        </c:if>
    </div>

    <div>글번호: ${requestScope.data.iboard}</div>
    <div>조회수 : <c:out value="${requestScope.data.hit}"/></div>
    <div>작성자 : <c:out value="${requestScope.data.writerNm}"/></div>
    <div>등록일시 : <c:out value="${requestScope.data.rdt}"/></div>
    <div>제목 : <c:out value="${requestScope.data.title}"/></div>
    <div><c:out value="${requestScope.data.ctnt}"/></div>

    <c:if test="${sessionScope.loginUser != null}">
        <div>
            <form action="/board/cmt/reg" method="post">
                <input type="hidden" name="iboard" value="${requestScope.data.iboard}">
                <input type="text" name="ctnt" placeholder="댓글 내용">
                <input type="submit" value="댓글달기">
            </form>
        </div>
    </c:if>
    <div id="cmtListContainer" data-iboard="${requestScope.data.iboard}" data-loginuserpk="${sessionScope.loginUser.iuser}"></div>
</div>
<div class="cmtModContainer">
    <div class="cmtModBody">
        <form id="cmtModFrm" onsubmit="return false;">
<%--            <input type="hidden" name="iboard" value="${requestScope.data.iboard}">--%>
            <input type="hidden" name="icmt">
            <div><input type="text" name="ctnt" placeholder="댓글 내용"></div>
            <div>
                <input type="submit" value="수정">
                <input type="button" value="취소" id="btnCancel">
            </div>
        </form>
    </div>
</div>
<script src="/res/js/board/detail2.js?ver=2"></script>
