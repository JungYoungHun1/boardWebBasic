package com.koreait.basic.dao;

import com.koreait.basic.DbUtils;
import com.koreait.basic.board.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardCmtDAO {
    public static int delBoardCmt(BoardCmtEntity entity){
        Connection con = null;
        PreparedStatement ps = null;
        String sql = "DELETE FROM t_board_cmt WHERE icmt=? AND writer=? AND iboard=?";
        try{
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            ps.setInt(1,entity.getIcmt());
            ps.setInt(2,entity.getWriter());
            ps.setInt(3,entity.getIboard());
            return ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DbUtils.close(con, ps);
        }
        return 0;
    }
    public static List<BoardCmtVO> selBoardCmtList(BoardCmtDTO param){
        List<BoardCmtVO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT A.icmt, A.ctnt, A.writer, A.rdt, B.nm as writerNm FROM t_board_cmt A INNER JOIN t_user B ON A.writer = B.iuser WHERE A.iboard = ? ORDER BY A.icmt ASC";
        try{
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            ps.setInt(1,param.getIboard());
            rs = ps.executeQuery();
            while(rs.next()){
                BoardCmtVO vo = BoardCmtVO.builder()
                        .icmt(rs.getInt("icmt"))
                        .writer(rs.getInt("writer"))
                        .ctnt(rs.getString("ctnt"))
                        .rdt(rs.getString("rdt"))
                        .writerNm(rs.getString("writerNm"))
                        .build();
                list.add(vo);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DbUtils.close(con, ps, rs);
        }
        return list;
    }
    public static int insBoardCmt(BoardCmtEntity entity){
        Connection con = null;
        PreparedStatement ps = null;
        String sql = "INSERT INTO t_board_cmt(iboard, ctnt, writer) VALUES(?,?,?)";
        try{
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            ps.setInt(1,entity.getIboard());
            ps.setString(2,entity.getCtnt());
            ps.setInt(3,entity.getWriter());
            return ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally{
            DbUtils.close(con, ps);
        }
        return 0;
    }
}
