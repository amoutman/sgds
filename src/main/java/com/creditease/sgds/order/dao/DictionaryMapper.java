package com.creditease.sgds.order.dao;

import com.creditease.sgds.order.model.Dictionary;

public interface DictionaryMapper {
    int deleteByPrimaryKey(String id);

    int insert(Dictionary record);

    int insertSelective(Dictionary record);

    Dictionary selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Dictionary record);

    int updateByPrimaryKey(Dictionary record);
    
    Dictionary getDictionaryByCode(String code);
}