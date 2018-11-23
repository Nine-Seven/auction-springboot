package com.dao;

import com.entity.Auction;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

public interface AuctionMapper {
    int deleteByPrimaryKey(Integer auctionId);

    int insert(Auction record);

    int insertSelective(Auction record);

    Auction selectByPrimaryKey(Auction auction);

    List<Auction> selectAll(Auction auction);

    int updateByPrimaryKeySelective(Auction record);

    int updateByPrimaryKey(Auction record);
}