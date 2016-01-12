package com.yeekee.service.impl;


import java.util.List;

import com.yeekee.dao.GiftDAO;
import com.yeekee.model.Gift;
import com.yeekee.service.GiftManager;

public class GiftManagerImpl implements GiftManager {

	private GiftDAO giftDAO; 
	
	public List<Gift> loadGiftList() {
		return giftDAO.loadGiftList();
	}

	public boolean updateGift(Gift gift) {
		return giftDAO.updateGift(gift);
	}

	public GiftDAO getGiftDAO() {
		return giftDAO;
	}

	public void setGiftDAO(GiftDAO giftDAO) {
		this.giftDAO = giftDAO;
	}

}
