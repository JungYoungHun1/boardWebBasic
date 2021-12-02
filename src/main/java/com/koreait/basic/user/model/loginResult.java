package com.koreait.basic.user.model;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public class loginResult {
    private final int result;
    private final UserEntity loginUser;
}
