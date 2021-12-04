package com.koreait.basic.board;

import com.koreait.basic.DbUtils;
import com.koreait.basic.Utils;
import com.koreait.basic.board.model.BoardEntity;
import com.koreait.basic.dao.BoardDAO;
import com.koreait.basic.user.model.UserEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/board/del")
public class boardDelServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        BoardEntity entity = new BoardEntity();
        int iboard = Utils.getParameterInt(req,"iboard");
        entity.setIboard(iboard);
        HttpSession hs = req.getSession();
        UserEntity loginuser = (UserEntity) hs.getAttribute("loginUser");
        entity.setWriter(loginuser.getIuser());
        //entity.setWriter(Utils.getLoginUserPk(req));
        int result = BoardDAO.delBoard(entity);
        switch (result){
            case 1 :
                res.sendRedirect("/board/list");
                return;
            default:
                req.setAttribute("err","글 삭제를 실패하였습니다.");
                req.getRequestDispatcher("/board/detail?iboard="+iboard).forward(req,res);
                return;
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

    }
}
