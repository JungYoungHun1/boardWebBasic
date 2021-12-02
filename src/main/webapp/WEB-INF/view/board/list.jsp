<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/res/css/board/list.css">
<div>
    <table id = "boardTable">
        <tr>
            <th>no</th>
            <th>title</th>
            <th>hit</th>
            <th>writer</th>
            <th>reg-datetime</th>
        </tr>
        <c:forEach items="${requestScope.list}" var ="item">
            <tr class="record" onclick="moveToDetail(${item.iboard});">
                <td><c:out value="${item.iboard}"/></td>
                <td><c:out value="${item.title}"/></td>
                <td><c:out value="${item.hit}"/></td>
                <td><c:out value="${item.writerNm}"/></td>
                <td><c:out value="${item.rdt}"/></td>
            </tr>
        </c:forEach>
<%--        c:out으로 감싸는이유 - String형의 보안때문에. 제목이나 내용같은 것들에
            자바스크립트 문법이 들어갔을때 그게 실행이 되버리기 때문에       --%>
    </table>
</div>
<script src="/res/js/board/list.js"></script>
