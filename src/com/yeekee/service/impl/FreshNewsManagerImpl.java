package com.yeekee.service.impl;

import java.util.Date;
import java.util.List;

import com.yeekee.dao.CategoryDAO;
import com.yeekee.dao.FreshNewsDAO;
import com.yeekee.dao.ReplyDAO;
import com.yeekee.model.Category;
import com.yeekee.model.FreshNews;
import com.yeekee.model.FreshNewsType;
import com.yeekee.model.Reply;
import com.yeekee.model.TaskType;
import com.yeekee.model.User;
import com.yeekee.model.UserType;
import com.yeekee.service.FreshNewsManager;

public class FreshNewsManagerImpl implements FreshNewsManager {
	private FreshNewsDAO freshNewsDAO;
	private ReplyDAO replyDAO;
	private CategoryDAO categoryDAO;

	public FreshNewsDAO getFreshNewsDAO() {
		return freshNewsDAO;
	}

	public void setFreshNewsDAO(FreshNewsDAO freshNewsDAO) {
		this.freshNewsDAO = freshNewsDAO;
	}

	public boolean addFreshNews(FreshNews news) {
		String str = news.getContent();
		int count = 0;
		int num = 0;
		for (int i = 0; i < str.length(); i++) {
			if (str.charAt(i) == '<') {
				num++;
			} else if (str.charAt(i) == '>') {
				num--;
			}
			if (num != 0) {
				continue;
			}
			if (count++ >= 50) {
				str = str.substring(0, i + 1) + "</p><p>"
						+ str.substring(i + 1);
				count = 0;
			}
			if (str.substring(i).startsWith("</p>")) {
				count = 0;
				i += 2;
			}
		}
		news.setContent(str);
		return freshNewsDAO.addFreshNews(news);
	}

	public List<FreshNews> loadFriendsNews(User user, int pageNo, int pageSize) {
		List<FreshNews> list = freshNewsDAO.loadFriendsNews(user, pageNo,
				pageSize);
		return list;
	}

	public FreshNews loadNewsById(int id) {
		return freshNewsDAO.loadNewsById(id);
	}

	public boolean removeFreshNewsById(FreshNews news) {
		return freshNewsDAO.removeFreshNewsById(news);
	}

	public long getNewsCount(User user) {
		return freshNewsDAO.getNewsCount(user);
	}

	public boolean addBlog(FreshNews news, User user, int categoryId) {
		news.setType(FreshNewsType.BLOG);
		news.setCategory(categoryDAO.getCategoryById(categoryId));
		return addFreshNews(news, user);
	}

	public boolean addFreshNews(FreshNews news, User user) {
		news.setUser(user);
		news.setDate(new Date());
		return addFreshNews(news);
	}

	public boolean addPhoto(FreshNews news, User user) {
		news.setType(FreshNewsType.PHOTO);
		return addFreshNews(news, user);
	}

	public boolean addStatus(FreshNews news, User user) {
		news.setType(FreshNewsType.STATUS);
		return addFreshNews(news, user);
	}

	public boolean addTask(FreshNews news, User user) {
		news.setType(FreshNewsType.TASK);
		return addFreshNews(news, user);
	}

	public boolean addAction(FreshNews news, User user) {
		news.setType(FreshNewsType.ACTION);
		return addFreshNews(news, user);
	}

	public List<FreshNews> loadActions(int pageNo, int pageSize,
			List<String> blogTypes) {
		return freshNewsDAO.loadActions(pageNo, pageSize, blogTypes);
	}

	public List<FreshNews> loadTasks(int pageNo, int pageSize,
			List<String> blogTypes) {
		return freshNewsDAO.loadTasks(pageNo, pageSize, blogTypes);
	}

	public long getActionCount(List<String> blogTypes) {
		return freshNewsDAO.getActionCount(blogTypes);
	}

	public long getTaskCount(List<String> blogTypes) {
		return freshNewsDAO.getTaskCount(blogTypes);
	}

	public boolean addReply(FreshNews news, Reply reply, User user) {
		reply.setUser(user);
		reply.setDate(new Date());
		replyDAO.addReply(reply);
		news.getReply().add(reply);
		return true;
	}

	public ReplyDAO getReplyDAO() {
		return replyDAO;
	}

	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}

	public List<FreshNews> getBlogByUser(User user, int pageNo, int pageSize) {
		return freshNewsDAO.getBlogByUser(user, pageNo, pageSize);
	}

	public long getBlogCount(User user) {
		return this.freshNewsDAO.getBlogCount(user);
	}

	public boolean addExecuteTask(User user, int taskId) {
		FreshNews news = freshNewsDAO.getFreshNewsById(taskId);
		user.getExecuteTask().add(news);
		return true;
	}

	public boolean removeExecuteTask(User user, int taskId) {
		FreshNews news = freshNewsDAO.getFreshNewsById(taskId);
		user.getExecuteTask().remove(news);
		news.setFile(null);
		return true;
	}

	public List<FreshNews> loadActionBySearch(String msg, int pageNo,
			int pageSize) {
		return freshNewsDAO.loadActionBySearch(msg, pageNo, pageSize);
	}

	public List<FreshNews> loadTaskBySearch(String msg, int pageNo, int pageSize) {
		return freshNewsDAO.loadTaskBySearch(msg, pageNo, pageSize);
	}

	public long getActionCountBySearch(String msg) {
		return freshNewsDAO.getActionCountBySearch(msg);
	}

	public long getTaskCountBySearch(String msg) {
		return freshNewsDAO.getTaskCountBySearch(msg);
	}

	public boolean finishTask(User user, int id) {
		FreshNews news = loadNewsById(id);
		if (user.getUserType() != UserType.NGO) {
			return false;
		}
		if (!user.equals(news.getUser())) {
			return false;
		}
		if (news.getExecuteUser() == null) {
			return false;
		}
		if ((news.getType() == FreshNewsType.TASK || news.getType() == FreshNewsType.ACTION)
				&& news.getTaskType() == TaskType.UNFINISH) {
			news.getExecuteUser().setScore(
					news.getExecuteUser().getScore() + news.getScore());
			news.setTaskType(TaskType.FINISH);
			news.setFinishedUser(news.getExecuteUser());
			news.setExecuteUser(null);
		}
		return true;
	}

	public boolean addNews(FreshNews news, User user) {
		news.setType(FreshNewsType.NEWS);
		return addFreshNews(news, user);
	}

	public long getNewsCount() {
		return freshNewsDAO.getNewsCount();
	}

	public List<FreshNews> getNewsList(int pageNo, int pageSize) {
		return freshNewsDAO.getNewsList(pageNo, pageSize);
	}

	public boolean addFile(FreshNews news, String file) {
		news = freshNewsDAO.loadNewsById(news.getId());
		if (news.getType() != FreshNewsType.TASK) {
			return false;
		}
		news.setFile(file);
		return true;
	}

	public CategoryDAO getCategoryDAO() {
		return categoryDAO;
	}

	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}

	public List<Category> getCategoryList(User user, int pageNo, int pageSize) {
		return categoryDAO.getCategoryList(user, pageNo, pageSize);
	}

	public boolean addCategory(Category category, User user) {
		category.setUser(user);
		return categoryDAO.addCategory(category);
	}
}
