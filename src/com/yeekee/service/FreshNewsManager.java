package com.yeekee.service;

import java.util.List;

import com.yeekee.model.Category;
import com.yeekee.model.FreshNews;
import com.yeekee.model.Reply;
import com.yeekee.model.User;

public interface FreshNewsManager {
	boolean addFreshNews(FreshNews news, User user);

	boolean removeFreshNewsById(FreshNews news);

	List<FreshNews> loadFriendsNews(User user, int pageNo, int pageSize);

	FreshNews loadNewsById(int id);

	long getNewsCount(User user);

	boolean addStatus(FreshNews news, User user);

	boolean addPhoto(FreshNews news, User user);

	boolean addBlog(FreshNews news, User user, int categoryId);

	boolean addTask(FreshNews news, User user);

	boolean addAction(FreshNews news, User user);

	List<FreshNews> loadTasks(int pageNo, int pageSize, List<String> blogTypes);

	List<FreshNews> loadActions(int pageNo, int pageSize, List<String> blogTypes);

	long getTaskCount(List<String> blogTypes);

	long getActionCount(List<String> blogTypes);

	boolean addReply(FreshNews news, Reply reply, User user);

	long getBlogCount(User user);

	List<FreshNews> getBlogByUser(User user, int pageNo, int pageSize);

	boolean addExecuteTask(User user, int taskId);

	boolean removeExecuteTask(User user, int taskId);

	List<FreshNews> loadActionBySearch(String msg, int pageNo, int pageSize);

	List<FreshNews> loadTaskBySearch(String msg, int pageNo, int pageSize);

	long getActionCountBySearch(String msg);

	long getTaskCountBySearch(String msg);

	boolean finishTask(User user, int id);

	List<FreshNews> getNewsList(int pageNo, int pageSize);

	long getNewsCount();

	boolean addNews(FreshNews news, User user);

	boolean addFile(FreshNews news, String file);

	List<Category> getCategoryList(User user, int pageNo, int pageSize);

	boolean addCategory(Category category, User user);
}
