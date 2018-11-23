package com.service.impl;

import com.dao.AuctionMapper;
import com.entity.Auction;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.AuctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.List;

@Service
@Transactional
public class AuctionServiceImpl implements AuctionService {
    @Autowired
    private AuctionMapper auctionMapper;

    @Override
    public void add(Auction auction) {
        auctionMapper.insert(auction);
    }

    @Override
    public void selectAll(Auction auction, int currentPage, int pageSize, Model model) {
        PageHelper.startPage(currentPage, pageSize);

        List<Auction> auctions = auctionMapper.selectAll(auction);

        PageInfo<Auction> pageInfo = new PageInfo<>(auctions);
/*
        for (Auction auction1 : auctions) {
            System.out.println(auction1);
        }
        System.out.println(pageInfo);*/
        model.addAttribute("currentPage", pageInfo.getPageNum());
        model.addAttribute("totalPage", pageInfo.getPages());
        model.addAttribute("auctionList", pageInfo.getList());
    }

    @Override
    public Auction selectOne(Auction auction) {
        return auctionMapper.selectByPrimaryKey(auction);
    }

    @Override
    public void update(Auction auction) {
        auctionMapper.updateByPrimaryKeySelective(auction);
    }

    @Override
    public void delete(Auction auction) {
        auctionMapper.deleteByPrimaryKey(auction.getAuctionId());
    }
}
