package com.koreait.basic.board.cmt;

import com.koreait.basic.Utils;
import com.koreait.basic.board.model.BoardCmtEntity;
import com.koreait.basic.dao.BoardCmtDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/board/cmt/mod")
public class BoardCmtModServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int iboard = Utils.getParameterInt(req, "iboard");
        BoardCmtEntity entity = new BoardCmtEntity();
        entity.setIcmt(Utils.getParameterInt(req,"icmt"));
        entity.setCtnt(req.getParameter("ctnt"));
        entity.setWriter(Utils.getLoginUserPk(req));

        int result = BoardCmtDAO.modBoardCmt(entity);

        res.sendRedirect("/board/detail?iboard="+iboard);

    }
}
