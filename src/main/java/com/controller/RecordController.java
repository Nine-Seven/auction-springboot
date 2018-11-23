package com.controller;

import com.entity.Auction;
import com.entity.Record;
import com.entity.User;
import com.service.AuctionService;
import com.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/private")
public class RecordController {
    @Autowired
    private AuctionService auctionService;
    @Autowired
    private RecordService recordService;

    @RequestMapping("/addRecord")
    public String add(HttpSession session, Record record) {
        User user = (User) session.getAttribute("login");
        record.setUserId(user.getUserId());
        recordService.add(record);
        return "redirect:selectRecord?auctionId=" + record.getAuctionId();
    }

    @RequestMapping("/selectRecord")
    public String selectAll(Auction auction, Model model) {
        auction = auctionService.selectOne(auction);
        List<Record> recordList = recordService.select(auction.getAuctionId());
        model.addAttribute("auction", auction);
        model.addAttribute("recordList", recordList);
        return "auction";
    }


}
