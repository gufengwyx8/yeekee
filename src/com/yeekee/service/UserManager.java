package com.yeekee.service;

import java.util.List;

import com.yeekee.model.Reply;
import com.yeekee.model.User;

public interface UserManager {
	boolean regUser(User user);

	boolean updateUser(User user);

	boolean containsName(String email);

	User loadUserByPassword(String email, String password);

	User loadUserById(int id);

	User loadAdminById(int id);

	boolean addFriend(int userid1, int userid2);

	boolean setLogo(User user, String logo);

	List<User> getNgoList(String domain, int pageNo, int pageSize);

	long getNgoCount(String domain);

	List<User> loadUserBySearch(String msg, int pageNo, int pageSize);

	List<User> loadNgoBySearch(String msg, int pageNo, int pageSize);

	long getUserCountBySearch(String msg);

	long getNgoCountBySearch(String msg);

	long getFriendUserCount(User user);

	long getFriendNgoCount(User user);

	long getFriendCount(User user);

	List<User> getFriendUserList(User user, int pageNo, int pageSize);

	List<User> getFriendNgoList(User user, int pageNo, int pageSize);

	List<User> getFriendList(User user, int pageNo, int pageSize);

	boolean addReply(User parentUser, Reply reply, User user);
}
