package com.entity;

import java.util.Date;
import java.util.List;

public class Auction {
    private Integer auctionId;

    private String auctionName;

    private Double auctionStartPrice;

    private Double auctionUpset;

    private Date auctionStartTime;

    private Date auctionEndTime;

    private String auctionPic;

    private String auctionDesc;

    private List<Record> recordList;

    public List<Record> getRecordList() {
        return recordList;
    }

    public void setRecordList(List<Record> recordList) {
        this.recordList = recordList;
    }

    public Integer getAuctionId() {
        return auctionId;
    }

    public void setAuctionId(Integer auctionId) {
        this.auctionId = auctionId;
    }

    public String getAuctionName() {
        return auctionName;
    }

    public void setAuctionName(String auctionName) {
        this.auctionName = auctionName == null ? null : auctionName.trim();
    }

    public Double getAuctionStartPrice() {
        return auctionStartPrice;
    }

    public void setAuctionStartPrice(Double auctionStartPrice) {
        this.auctionStartPrice = auctionStartPrice;
    }

    public Double getAuctionUpset() {
        return auctionUpset;
    }

    public void setAuctionUpset(Double auctionUpset) {
        this.auctionUpset = auctionUpset;
    }

    public Date getAuctionStartTime() {
        return auctionStartTime;
    }

    public void setAuctionStartTime(Date auctionStartTime) {
        this.auctionStartTime = auctionStartTime;
    }

    public Date getAuctionEndTime() {
        return auctionEndTime;
    }

    public void setAuctionEndTime(Date auctionEndTime) {
        this.auctionEndTime = auctionEndTime;
    }

    public String getAuctionPic() {
        return auctionPic;
    }

    public void setAuctionPic(String auctionPic) {
        this.auctionPic = auctionPic;
    }

    public String getAuctionDesc() {
        return auctionDesc;
    }

    public void setAuctionDesc(String auctionDesc) {
        this.auctionDesc = auctionDesc == null ? null : auctionDesc.trim();
    }

    public Auction(Integer auctionId, String auctionName, Double auctionStartPrice, Double auctionUpset, Date auctionStartTime, Date auctionEndTime, String auctionPic, String auctionDesc) {
        this.auctionId = auctionId;
        this.auctionName = auctionName;
        this.auctionStartPrice = auctionStartPrice;
        this.auctionUpset = auctionUpset;
        this.auctionStartTime = auctionStartTime;
        this.auctionEndTime = auctionEndTime;
        this.auctionPic = auctionPic;
        this.auctionDesc = auctionDesc;
    }

    public Auction() {
    }

    @Override
    public String toString() {
        return "Auction{" +
                "auctionId=" + auctionId +
                ", auctionName='" + auctionName + '\'' +
                ", auctionStartPrice=" + auctionStartPrice +
                ", auctionUpset=" + auctionUpset +
                ", auctionStartTime=" + auctionStartTime +
                ", auctionEndTime=" + auctionEndTime +
                ", auctionPic='" + auctionPic + '\'' +
                ", auctionDesc='" + auctionDesc + '\'' +
                '}';
    }
}