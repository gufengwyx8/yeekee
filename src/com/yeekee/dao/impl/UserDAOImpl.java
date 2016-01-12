package com.yeekee.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.yeekee.dao.UserDAO;
import com.yeekee.model.User;
import com.yeekee.util.PagerCallBack;

public class UserDAOImpl implements UserDAO {
	private HibernateTemplate hibernateTemplate;

	public boolean addUser(User user) {
		if (containsName(user.getEmail())) {
			return false;
		}
		hibernateTemplate.save(user);
		return true;
	}

	public boolean containsName(String email) {
		return hibernateTemplate.find("from User u where u.email = ?", email)
				.size() > 0;
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@SuppressWarnings("unchecked")
	public User loadUserByPassword(String email, String password) {
		List<User> result = hibernateTemplate.find(
				"from User u where u.email = ? and u.password = ?", email,
				password);
		if (result.size() > 0) {
			return (User) result.get(0);
		}
		return null;
	}

	public User loadUserById(int id) {
		return (User) hibernateTemplate.load(User.class, id);
	}

	public boolean addFriend(int userid1, int userid2) {
		User user1 = loadUserById(userid1);
		User user2 = loadUserById(userid2);
		if (user1 == null || user2 == null) {
			return false;
		}
		user1.getFriends().add(user2);
		return true;
	}

	@SuppressWarnings("unchecked")
	public List<User> getNgoList(String domain, int pageNo, int pageSize) {
		List<User> list = null;
		if (domain == null || domain.equals("")) {
			list = hibernateTemplate.execute(new PagerCallBack(pageNo,
					pageSize, "from User u where u.userType = 1"));
		} else {
			list = hibernateTemplate
					.execute(new PagerCallBack(
							pageNo,
							pageSize,
							"from User u where u.userType = 1 and u.domain = ?",
							domain));
		}
		return list;
	}

	public long getNgoCount(String domain) {
		if (domain == null || domain.equals("")) {
			return (Long) hibernateTemplate.find(
					"select count(*) from User u where u.userType = 1").get(0);
		}
		return (Long) hibernateTemplate
				.find(
						"select count(*) from User u where u.userType = 1 and u.domain = ?",
						domain).get(0);
	}

	public long getNgoCountBySearch(String msg) {
		msg = "%" + msg + "%";
		return (Long) hibernateTemplate
				.find(
						"select count(*) from User u where (u.nickName like ? or u.domain like ? or u.activityArea like ?) and u.userType = 1",
						msg, msg, msg).get(0);
	}

	public long getUserCountBySearch(String msg) {
		msg = "%" + msg + "%";
		return (Long) hibernateTemplate
				.find(
						"select count(*) from User u where (u.nickName like ? or u.email like ? or u.realName like ?) and u.userType = 0",
						msg, msg, msg).get(0);
	}

	@SuppressWarnings("unchecked")
	public List<User> loadNgoBySearch(String msg, int pageNo, int pageSize) {
		msg = "%" + msg + "%";
		List<User> list = hibernateTemplate
				.executeFind(new PagerCallBack(
						pageNo,
						pageSize,
						"from User u where (u.nickName like ? or u.domain like ? or u.activityArea like ?) and u.userType = 1 order by u.id",
						msg, msg, msg));
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<User> loadUserBySearch(String msg, int pageNo, int pageSize) {
		msg = "%" + msg + "%";
		List<User> list = hibernateTemplate
				.executeFind(new PagerCallBack(
						pageNo,
						pageSize,
						"from User u where (u.nickName like ? or u.email like ? or u.realName like ?) and u.userType = 0 order by u.id",
						msg, msg, msg));
		return list;
	}

	public long getFriendCount(User user) {
		return (Long) hibernateTemplate
				.find(
						"select count(u.id) from User u , User u2 where u2.id = ? and u in elements(u2.friends)",
						user.getId()).get(0);
	}

	@SuppressWarnings("unchecked")
	public List<User> getFriendList(User user, int pageNo, int pageSize) {
		List<User> list = hibernateTemplate
				.executeFind(new PagerCallBack(
						pageNo,
						pageSize,
						"select u from User u , User u2 where u2.id = ? and u in elements(u2.friends)",
						user.getId()));
		return list;
	}

	public long getFriendNgoCount(User user) {
		return (Long) hibernateTemplate
				.find(
						"select count(u.id) from User u , User u2 where u2.id = ? and u in elements(u2.friends) and u.userType = 1",
						user.getId()).get(0);
	}

	@SuppressWarnings("unchecked")
	public List<User> getFriendNgoList(User user, int pageNo, int pageSize) {
		List<User> list = hibernateTemplate
				.executeFind(new PagerCallBack(
						pageNo,
						pageSize,
						"select u from User u , User u2 where u2.id = ? and u in elements(u2.friends) and u.userType = 1",
						user.getId()));
		return list;
	}

	public long getFriendUserCount(User user) {
		return (Long) hibernateTemplate
				.find(
						"select count(u.id) from User u , User u2 where u2.id = ? and u in elements(u2.friends) and u.userType = 0",
						user.getId()).get(0);
	}

	@SuppressWarnings("unchecked")
	public List<User> getFriendUserList(User user, int pageNo, int pageSize) {
		List<User> list = hibernateTemplate
				.executeFind(new PagerCallBack(
						pageNo,
						pageSize,
						"select u from User u , User u2 where u2.id = ? and u in elements(u2.friends) and u.userType = 0",
						user.getId()));
		return list;
	}

	public boolean updateUser(User user) {
		hibernateTemplate.update(user);
		return true;
	}
}
