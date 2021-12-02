package com.koreait.basic.board.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardEntity {
    private int iboard;
    private int writer;
    private int hit;
    private String title;
    private String ctnt;
    private String rdt;
    private String mdt;
}
