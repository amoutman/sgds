package com.creditease.sgds.order.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.creditease.sgds.order.dao.DictionaryMapper;
import com.creditease.sgds.order.model.Dictionary;
import com.creditease.sgds.order.service.DictionaryService;

@Service("dictionaryService")
public class DictionaryServiceImpl implements DictionaryService {
	
	private DictionaryMapper dictionaryMapper;
	
	public DictionaryMapper getDictionaryMapper() {
		return dictionaryMapper;
	}

	@Autowired
	public void setDictionaryMapper(DictionaryMapper dictionaryMapper) {
		this.dictionaryMapper = dictionaryMapper;
	}

	@Override
	public void saveDictionary(Dictionary dictionary) throws Exception {
		dictionaryMapper.insertSelective(dictionary);
	}

	@Override
	public void updateDictionary(Dictionary dictionary) throws Exception {
		dictionaryMapper.updateByPrimaryKeySelective(dictionary);
	}

	@Override
	public Dictionary getDictionaryByCode(String code) throws Exception {
		return dictionaryMapper.getDictionaryByCode(code);
	}

}
