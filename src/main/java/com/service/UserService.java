package com.service;

import com.entity.User;

public interface UserService {
    User login(User user);

    void register(User user);
}
