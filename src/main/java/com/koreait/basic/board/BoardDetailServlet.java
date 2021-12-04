package com.koreait.basic.board;

import com.koreait.basic.Utils;
import com.koreait.basic.board.model.BoardDTO;
import com.koreait.basic.board.model.BoardVO;
import com.koreait.basic.dao.BoardDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/board/detail")
public class BoardDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int iboard = Utils.getParameterInt(req, "iboard");
        BoardDTO param = new BoardDTO();
        param.setIboard(iboard);

        BoardVO data = BoardDAO.selBoardDetail(param);
        //로그인 한 사람이 pk값과 data에 들어있는 writer값이 다르다면 혹은 로그인이
        //안돼있으면 hit 값 올리기
        int loginUserPk = Utils.getLoginUserPk(req);
        if(loginUserPk != data.getWriter()){
            BoardDAO.updBoardHitUp(param);
        }
        req.setAttribute("data", data);
        Utils.displayView(data.getTitle(), "board/detail", req, res);    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

    }
}
