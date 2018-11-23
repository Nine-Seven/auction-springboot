package com.service.impl;

import com.dao.RecordMapper;
import com.entity.Record;
import com.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class RecordServiceImpl implements RecordService {
    @Autowired
    private RecordMapper recordMapper;

    @Override
    public void add(Record record) {
        recordMapper.insert(record);
    }


    @Override
    public List<Record> select(int id) {
        List<Record> recordList = recordMapper.selectByPrimaryKey(id);
        return recordList;
    }

    @Override
    public void delete(int auctionId) {
        recordMapper.deleteByAuctionId(auctionId);
    }
}
