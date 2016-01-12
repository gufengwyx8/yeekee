package com.yeekee.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.yeekee.dao.FreshNewsDAO;
import com.yeekee.model.FreshNews;
import com.yeekee.model.User;
import com.yeekee.util.PagerCallBack;

public class FreshNewsDAOImpl implements FreshNewsDAO {

	private HibernateTemplate hibernateTemplate;

	public boolean addFreshNews(FreshNews news) {
		hibernateTemplate.save(news);
		return true;
	}

	@SuppressWarnings("unchecked")
	public List<FreshNews> loadFriendsNews(User user, int pageNo, int pageSize) {
		/*
		 * List<FreshNews> list = hibernateTemplate .find(
		 * "from FreshNews f where (select count(*) from f.user.friends u where u.id = ?)>0 order by f.date desc"
		 * , user.getId());
		 */
		List<FreshNews> list = hibernateTemplate
				.executeFind(new PagerCallBack(
						pageNo,
						pageSize,
						"select f from FreshNews f,User u where u.id = ? and (f.user in elements(u.friends) or f.user.id = ?) and f.type <> 5 order by f.date desc",
						user.getId(), user.getId()));
		return list;
	}

	public boolean removeFreshNewsById(FreshNews news) {
		hibernateTemplate.delete(news);
		return true;
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public FreshNews loadNewsById(int id) {
		FreshNews news = (FreshNews) hibernateTemplate
				.load(FreshNews.class, id);
		return news;
	}

	public long getNewsCount(User user) {
		return (Long) hibernateTemplate
				.find(
						"select count(f) from FreshNews f,User u where u.id = ? and f.type <> 5 and (f.user in elements(u.friends) or f.user.id = ?)",
						user.getId(), user.getId()).get(0);
	}

	@SuppressWarnings("unchecked")
	public List<FreshNews> loadTasks(int pageNo, int pageSize,
			List<String> blogTypes) {
		if (blogTypes != null && blogTypes.size() != 0) {
			String hql = "from FreshNews f where f.executeUser is null and (f.endDate > now() or f.endDate is null) and f.taskType = 0 and f.type = 3 and f.blogType in (?";
			for (int i = 1; i < blogTypes.size(); i++) {
				hql += ",?";
			}
			hql += ") order by f.date desc";
			List<FreshNews> list = hibernateTemplate
					.executeFind(new PagerCallBack(pageNo, pageSize, hql,
							blogTypes.toArray()));
			return list;
		}
		List<FreshNews> list = hibernateTemplate
				.executeFind(new PagerCallBack(
						pageNo,
						pageSize,
						"from FreshNews f where f.executeUser is null and (f.endDate > now() or f.endDate is null) and f.taskType = 0 and f.type = 3 order by f.date desc"));
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<FreshNews> loadActions(int pageNo, int pageSize,
			List<String> blogTypes) {
		if (blogTypes != null && blogTypes.size() != 0) {
			List<FreshNews> list = hibernateTemplate
					.executeFind(new PagerCallBack(
							pageNo,
							pageSize,
							"from FreshNews f where f.taskType = 0 and f.type = 4 and f.blogType in (?) order by f.date desc",
							blogTypes.toString()));
			return list;
		}
		List<FreshNews> list = hibernateTemplate
				.executeFind(new PagerCallBack(pageNo, pageSize,
						"from FreshNews f where f.taskType = 0 and f.type = 4 order by f.date desc"));
		return list;
	}

	public long getActionCount(List<String> blogTypes) {
		if (blogTypes != null && blogTypes.size() != 0) {
			return (Long) hibernateTemplate
					.find(
							"select count(*) from FreshNews f where f.taskType = 0 and f.type = 4 and f.blogType in (?)",
							blogTypes.toString()).get(0);
		}
		return (Long) hibernateTemplate
				.find(
						"select count(*) from FreshNews f where f.taskType = 0 and f.type = 4")
				.get(0);
	}

	public long getTaskCount(List<String> blogTypes) {
		if (blogTypes != null && blogTypes.size() != 0) {
			String hql = "select count(*) from FreshNews f where f.executeUser is null and (f.endDate > now() or f.endDate is null) and f.taskType = 0 and f.type = 3 and f.blogType in (?";
			for (int i = 1; i < blogTypes.size(); i++) {
				hql += ",?";
			}
			hql += ")";
			return (Long) hibernateTemplate.find(hql, blogTypes.toArray()).get(
					0);
		}
		return (Long) hibernateTemplate
				.find(
						"select count(*) from FreshNews f  where f.executeUser is null and f.taskType = 0 and f.type = 3")
				.get(0);
	}

	@SuppressWarnings("unchecked")
	public List<FreshNews> getBlogByUser(User user, int pageNo, int pageSize) {
		List<FreshNews> list = hibernateTemplate
				.executeFind(new PagerCallBack(
						pageNo,
						pageSize,
						"from FreshNews f where f.type = 1 and f.user.id = ? order by f.date desc",
						user.getId()));
		return list;
	}

	public long getBlogCount(User user) {
		return (Long) hibernateTemplate
				.find(
						"select count(*) from FreshNews f where f.type = 1 and f.user.id = ?",
						user.getId()).get(0);
	}

	public FreshNews getFreshNewsById(int id) {
		FreshNews news = (FreshNews) hibernateTemplate
				.load(FreshNews.class, id);
		return news;
	}

	@SuppressWarnings("unchecked")
	public List<FreshNews> loadActionBySearch(String msg, int pageNo,
			int pageSize) {
		msg = "%" + msg + "%";
		List<FreshNews> list = hibernateTemplate
				.executeFind(new PagerCallBack(
						pageNo,
						pageSize,
						"from FreshNews f where (f.title like ? or f.content like ? or f.blogType like ?) and f.type = 4  and f.taskType = 0 order by f.date desc",
						msg, msg, msg));
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<FreshNews> loadTaskBySearch(String msg, int pageNo, int pageSize) {
		msg = "%" + msg + "%";
		List<FreshNews> list = hibernateTemplate
				.executeFind(new PagerCallBack(
						pageNo,
						pageSize,
						"from FreshNews f where (f.title like ? or f.content like ? or f.blogType like ?) and f.type = 3 and f.taskType = 0 order by f.date desc",
						msg, msg, msg));
		return list;
	}

	public long getActionCountBySearch(String msg) {
		msg = "%" + msg + "%";
		return (Long) hibernateTemplate
				.find(
						"select count(*) from FreshNews f where (f.title like ? or f.content like ? or f.blogType like ?) and f.type = 4 and f.taskType = 0",
						msg, msg, msg).get(0);
	}

	public long getTaskCountBySearch(String msg) {
		msg = "%" + msg + "%";
		return (Long) hibernateTemplate
				.find(
						"select count(*) from FreshNews f where (f.title like ? or f.content like ? or f.blogType like ?) and f.type = 3 and f.taskType = 0",
						msg, msg, msg).get(0);
	}

	public long getNewsCount() {
		return (Long) hibernateTemplate.find(
				"select count(*) from FreshNews f where f.type = 5").get(0);
	}

	@SuppressWarnings("unchecked")
	public List<FreshNews> getNewsList(int pageNo, int pageSize) {
		return (List<FreshNews>) hibernateTemplate
				.executeFind(new PagerCallBack(pageNo, pageSize,
						"from FreshNews f where f.type = 5 order by f.id desc"));
	}
}
