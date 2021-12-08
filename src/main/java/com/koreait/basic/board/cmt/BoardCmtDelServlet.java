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

@WebServlet("/board/cmt/del")
public class BoardCmtDelServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        BoardCmtEntity entity = new BoardCmtEntity();
        entity.setIcmt(Utils.getParameterInt(req, "icmt"));
        entity.setIboard(Utils.getParameterInt(req,"iboard"));
        entity.setWriter(Utils.getLoginUserPk(req));

        int result = BoardCmtDAO.delBoardCmt(entity);
        switch (result){
            case 1:
                res.sendRedirect("/board/detail?iboard="+entity.getIboard());
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

    }
}
