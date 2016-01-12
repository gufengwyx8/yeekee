package com.yeekee.service;

import java.util.List;

import com.yeekee.model.Gift;

public interface GiftManager {
	boolean updateGift(Gift gift);
	
	List<Gift> loadGiftList();
}
