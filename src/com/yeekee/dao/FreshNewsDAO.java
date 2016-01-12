package com.yeekee.dao;

import java.util.List;

import com.yeekee.model.FreshNews;
import com.yeekee.model.User;

public interface FreshNewsDAO {
	boolean addFreshNews(FreshNews news);

	boolean removeFreshNewsById(FreshNews news);

	List<FreshNews> loadFriendsNews(User user, int pageNo, int pageSize);

	FreshNews loadNewsById(int id);

	long getNewsCount(User user);

	long getTaskCount(List<String> blogTypes);

	long getActionCount(List<String> blogTypes);

	List<FreshNews> loadTasks(int pageNo, int pageSize, List<String> blogTypes);

	List<FreshNews> loadActions(int pageNo, int pageSize, List<String> blogTypes);

	long getBlogCount(User user);

	List<FreshNews> getBlogByUser(User user, int pageNo, int pageSize);

	FreshNews getFreshNewsById(int id);

	List<FreshNews> loadActionBySearch(String msg, int pageNo, int pageSize);

	List<FreshNews> loadTaskBySearch(String msg, int pageNo, int pageSize);

	long getActionCountBySearch(String msg);

	long getTaskCountBySearch(String msg);

	List<FreshNews> getNewsList(int pageNo, int pageSize);
	
	long getNewsCount();
}
