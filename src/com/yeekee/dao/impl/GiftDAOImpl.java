package com.yeekee.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.yeekee.dao.GiftDAO;
import com.yeekee.model.Gift;

public class GiftDAOImpl implements GiftDAO {

	private HibernateTemplate hibernateTemplate;

	@SuppressWarnings("unchecked")
	public List<Gift> loadGiftList() {
		return (List<Gift>) hibernateTemplate.find("from Gift order by score");
	}

	public boolean updateGift(Gift gift) {
		hibernateTemplate.update(gift);
		return true;
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

}
