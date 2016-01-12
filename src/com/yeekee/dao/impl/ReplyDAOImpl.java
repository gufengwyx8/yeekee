package com.yeekee.dao.impl;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.yeekee.dao.ReplyDAO;
import com.yeekee.model.Reply;

public class ReplyDAOImpl implements ReplyDAO {

	private HibernateTemplate hibernateTemplate;

	public boolean addReply(Reply reply) {
		hibernateTemplate.save(reply);
		return true;
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

}
