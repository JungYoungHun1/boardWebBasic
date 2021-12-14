package com.koreait.basic.dao;

import com.koreait.basic.DbUtils;
import com.koreait.basic.board.model.BoardVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardRankDAO {
    public static List<BoardVO> selBoardCmtRankList(){
        List<BoardVO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT A.iboard, A.title, A.writer, A.rdt, A.mdt, B.cnt, C.nm as writerNm FROM t_board A INNER JOIN (SELECT iboard, COUNT(icmt) AS cnt FROM t_board_cmt GROUP BY iboard) B ON A.iboard=B.iboard INNER JOIN t_user C ON A.writer = C.iuser ORDER BY B.cnt DESC LIMIT 10";
        try{
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                int iboard = rs.getInt("iboard");
                String title = rs.getString("title");
                int writer = rs.getInt("writer");
                int cnt = rs.getInt("cnt");
                String rdt = rs.getString("rdt");
                String mdt = rs.getString("mdt");
                String writerNm = rs.getString("writerNm");
                BoardVO vo = BoardVO.builder()
                        .iboard(iboard)
                        .title(title)
                        .writer(writer)
                        .cnt(cnt)
                        .rdt(rdt)
                        .mdt(mdt)
                        .writerNm(writerNm).build();
                list.add(vo);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DbUtils.close(con, ps, rs);
        }
        return list;
    }
    public static List<BoardVO> selBoardHeartRankList(){
        List<BoardVO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT A.iboard, A.title, A.writer, A.rdt, A.mdt, B.cnt, C.nm as writerNm FROM t_board A INNER JOIN (SELECT iboard, COUNT(iuser) AS cnt FROM t_board_heart GROUP BY iboard) B ON A.iboard=B.iboard INNER JOIN t_user C ON A.writer = C.iuser ORDER BY B.cnt DESC LIMIT 10";
        try{
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                int iboard = rs.getInt("iboard");
                String title = rs.getString("title");
                int writer = rs.getInt("writer");
                int cnt = rs.getInt("cnt");
                String rdt = rs.getString("rdt");
                String mdt = rs.getString("mdt");
                String writerNm = rs.getString("writerNm");
                BoardVO vo = BoardVO.builder()
                        .iboard(iboard)
                        .title(title)
                        .writer(writer)
                        .cnt(cnt)
                        .rdt(rdt)
                        .mdt(mdt)
                        .writerNm(writerNm).build();
                list.add(vo);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DbUtils.close(con, ps, rs);
        }
        return list;
    }
    public static List<BoardVO> selBoardHitRankList(){
        List<BoardVO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT A.iboard, A.title, A.writer, A.hit, A.rdt, A.mdt, B.nm as writerNm FROM t_board A INNER JOIN t_user B ON A.writer = B.iuser WHERE A.hit > 0 ORDER BY A.hit DESC, A.iboard DESC LIMIT 10";
        try{
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                int iboard = rs.getInt("iboard");
                String title = rs.getString("title");
                int writer = rs.getInt("writer");
                int hit = rs.getInt("hit");
                String rdt = rs.getString("rdt");
                String mdt = rs.getString("mdt");
                String writerNm = rs.getString("writerNm");
                BoardVO vo = BoardVO.builder()
                        .iboard(iboard)
                        .title(title)
                        .writer(writer)
                        .hit(hit)
                        .rdt(rdt)
                        .mdt(mdt)
                        .writerNm(writerNm).build();
                list.add(vo);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally{
            DbUtils.close(con, ps, rs);
        }
        return list;
    }
}
