package com.service;

import com.entity.Record;

import java.util.List;

public interface RecordService {
    void add(Record record);

    List<Record> select(int id);

    void delete(int auctionId);
}
