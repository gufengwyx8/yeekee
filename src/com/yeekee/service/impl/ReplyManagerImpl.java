package com.yeekee.service.impl;

import com.yeekee.dao.ReplyDAO;
import com.yeekee.model.Reply;
import com.yeekee.service.ReplyManager;

public class ReplyManagerImpl implements ReplyManager {
	
	private ReplyDAO replyDAO;

	public boolean addReply(Reply reply) {
		return replyDAO.addReply(reply);
	}

	public ReplyDAO getReplyDAO() {
		return replyDAO;
	}

	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}

}
