package com.creditease.sgds.order.service;

import com.creditease.sgds.order.model.Dictionary;

public interface DictionaryService {
	
	public void saveDictionary(Dictionary dictionary) throws Exception;
	
	public void updateDictionary(Dictionary dictionary) throws Exception;
	
	public Dictionary getDictionaryByCode(String code) throws Exception;
	
}
