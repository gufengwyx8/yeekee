package com.yeekee.service.impl;

import java.util.Date;
import java.util.List;

import com.yeekee.dao.ReplyDAO;
import com.yeekee.dao.UserDAO;
import com.yeekee.model.Reply;
import com.yeekee.model.User;
import com.yeekee.model.UserType;
import com.yeekee.service.UserManager;

public class UserManagerImpl implements UserManager {

	private UserDAO userDAO;
	private ReplyDAO replyDAO;

	public boolean containsName(String email) {
		return userDAO.containsName(email);
	}

	public boolean regUser(User user) {
		return userDAO.addUser(user);
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public User loadUserByPassword(String email, String password) {
		return userDAO.loadUserByPassword(email, password);
	}

	public User loadUserById(int id) {
		return userDAO.loadUserById(id);
	}

	public boolean addFriend(int userid1, int userid2) {
		if (userid1 == userid2) {
			return false;
		}
		return userDAO.addFriend(userid1, userid2);
	}

	public boolean setLogo(User user, String logo) {
		userDAO.loadUserById(user.getId()).setLogo(logo);
		return true;
	}

	public List<User> getNgoList(String domain, int pageNo, int pageSize) {
		return userDAO.getNgoList(domain, pageNo, pageSize);
	}

	public long getNgoCount(String domain) {
		return userDAO.getNgoCount(domain);
	}

	public long getNgoCountBySearch(String msg) {
		return userDAO.getNgoCountBySearch(msg);
	}

	public long getUserCountBySearch(String msg) {
		return userDAO.getUserCountBySearch(msg);
	}

	public List<User> loadNgoBySearch(String msg, int pageNo, int pageSize) {
		return userDAO.loadNgoBySearch(msg, pageNo, pageSize);
	}

	public List<User> loadUserBySearch(String msg, int pageNo, int pageSize) {
		return userDAO.loadUserBySearch(msg, pageNo, pageSize);
	}

	public long getFriendCount(User user) {
		return userDAO.getFriendCount(user);
	}

	public List<User> getFriendList(User user, int pageNo, int pageSize) {
		return userDAO.getFriendList(user, pageNo, pageSize);
	}

	public long getFriendNgoCount(User user) {
		return userDAO.getFriendNgoCount(user);
	}

	public List<User> getFriendNgoList(User user, int pageNo, int pageSize) {
		return userDAO.getFriendNgoList(user, pageNo, pageSize);
	}

	public long getFriendUserCount(User user) {
		return userDAO.getFriendUserCount(user);
	}

	public List<User> getFriendUserList(User user, int pageNo, int pageSize) {
		return userDAO.getFriendUserList(user, pageNo, pageSize);
	}

	public User loadAdminById(int id) {
		User user = userDAO.loadUserById(id);
		if (user.getUserType() == UserType.ADMIN) {
			return user;
		}
		return null;
	}

	public boolean updateUser(User user) {
		return userDAO.updateUser(user);
	}

	public boolean addReply(User parentUser, Reply reply, User user) {
		reply.setUser(user);
		reply.setDate(new Date());
		reply.setParentUser(parentUser);
		replyDAO.addReply(reply);
		return true;
	}

	public ReplyDAO getReplyDAO() {
		return replyDAO;
	}

	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}

}
