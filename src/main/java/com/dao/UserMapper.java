package com.dao;

import com.entity.User;
import org.apache.ibatis.annotations.Mapper;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User login(User user);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}