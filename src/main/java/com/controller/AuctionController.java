package com.controller;

import com.entity.Auction;
import com.service.AuctionService;
import com.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("/private")
public class AuctionController {
    @Autowired
    private RecordService recordService;
    @Autowired
    private AuctionService auctionService;

    @RequestMapping("/selectAll")
    public String selectAll(Auction auction, Model model, Integer currentPage) {
        if (currentPage == null||currentPage == 0){
            currentPage =1;
        }
        auctionService.selectAll(auction, currentPage, 3, model);
        return "auctionlist";
    }

    @RequestMapping("/addAuction")
    public String add(MultipartFile pic, Auction auction, HttpServletRequest request) throws IOException {
        //获取文件名
        String picFileName = pic.getOriginalFilename();
        //获取images绝对路径
        String path = request.getServletContext().getRealPath("images");
        //文件重命名
        String uuid = UUID.randomUUID().toString();
        String subFile = picFileName.substring(picFileName.lastIndexOf('.'));
        String newFileName = uuid + subFile;
        //创建File对象
        File destFile = new File(path + "/" + newFileName);
        try {
            pic.transferTo(destFile);
            //最后添加,防止拷贝文件出错
            auction.setAuctionPic(newFileName);
            auctionService.add(auction);
        } catch (Exception e) {
            //添加出错后删除拷贝的文件
            destFile.delete();
            e.printStackTrace();
            return "addAuction";
        }
        return "redirect:/private/selectAll";
    }

    @RequestMapping("/selectOneAuction")
    public String selectOne(Auction auction, Model model) {
        auction = auctionService.selectOne(auction);
        model.addAttribute("auction", auction);
        return "updateAuction";
    }

    @RequestMapping("/update")
    public String update(MultipartFile pic, Auction auction, HttpServletRequest request) {

        String picFileName = pic.getOriginalFilename();
        //判断用户是否更改照片
        if (picFileName != null && picFileName.length() != 0) {
            //获取更改后的照片文件名字
            //获取images绝对路径
            String path = request.getServletContext().getRealPath("images");
            //重命名
            String uuid = UUID.randomUUID().toString();
            String subFile = picFileName.substring(picFileName.lastIndexOf('.'));
            String newFileName = uuid + subFile;
            //获取两个File对象,一个更改前的,一个更改后的
            File destFile = new File(path + "/" + newFileName);
            File file = new File(path + "/" + auction.getAuctionPic());
            try {
                pic.transferTo(destFile);
                auction.setAuctionPic(newFileName);
                auctionService.update(auction);
                //最后删除,防止出错
                file.delete();
            } catch (IOException e) {
                destFile.delete();
                e.printStackTrace();
                return "updateAuction";
            }
        } else {
            auctionService.update(auction);
        }
        return "redirect:/private/selectAll";
    }

    @RequestMapping("/delete")
    public String delete(Auction auction, HttpServletRequest request) {
        //删除的同时需要删除掉本地图片
        String path = request.getServletContext().getRealPath("images");
        auction = auctionService.selectOne(auction);
        try {
            File destFile = new File(path + "/" + auction.getAuctionPic());
            recordService.delete(auction.getAuctionId());
            auctionService.delete(auction);
            destFile.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/private/selectAll";
    }

}
