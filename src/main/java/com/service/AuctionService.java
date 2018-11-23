package com.service;

import com.entity.Auction;
import org.springframework.ui.Model;

public interface AuctionService {

    void add(Auction auction);

    void selectAll(Auction auction, int currentPage, int pageSize, Model model);

    Auction selectOne(Auction auction);

    void update(Auction auction);

    void delete(Auction auction);
}
