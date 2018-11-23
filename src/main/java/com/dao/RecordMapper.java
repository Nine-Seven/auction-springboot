package com.dao;

import com.entity.Record;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

public interface RecordMapper {
    int deleteByAuctionId(Integer id);

    int insert(Record record);

    int insertSelective(Record record);

    List<Record> selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Record record);

    int updateByPrimaryKey(Record record);
}