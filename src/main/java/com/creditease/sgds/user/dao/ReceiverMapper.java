package com.creditease.sgds.user.dao;

import java.util.List;

import com.creditease.sgds.user.model.Receiver;

public interface ReceiverMapper {
    int deleteByPrimaryKey(String id);

    int insert(Receiver record);

    int insertSelective(Receiver record);

    Receiver selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Receiver record);

    int updateByPrimaryKey(Receiver record);
    
    Receiver selectDefReceiverByUserId(String userId);
    
    List<Receiver> selectReceiversByUserId(String userId);
}