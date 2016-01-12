package com.yeekee.dao;

import java.util.List;

import com.yeekee.model.User;

public interface UserDAO {
	boolean addUser(User user);

	boolean containsName(String email);

	User loadUserByPassword(String email, String password);

	User loadUserById(int id);
	
	boolean updateUser(User user);
	
	boolean addFriend(int userid1, int userid2);

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
}
