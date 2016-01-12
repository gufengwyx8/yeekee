package com.yeekee.dao;

import java.util.List;

import com.yeekee.model.Gift;

public interface GiftDAO {
	boolean updateGift(Gift gift);
	
	List<Gift> loadGiftList();
}
