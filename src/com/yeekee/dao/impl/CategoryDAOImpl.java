package com.yeekee.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.yeekee.dao.CategoryDAO;
import com.yeekee.model.Category;
import com.yeekee.model.User;
import com.yeekee.util.PagerCallBack;

public class CategoryDAOImpl implements CategoryDAO {

	private HibernateTemplate hibernateTemplate;

	public boolean addCategory(Category category) {
		hibernateTemplate.save(category);
		return true;
	}

	public Category getCategoryById(int id) {
		return hibernateTemplate.load(Category.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Category> getCategoryList(User user, int pageNo, int pageSize) {
		List<Category> list = hibernateTemplate.executeFind(new PagerCallBack(
				pageNo, pageSize, "from Category c where c.user = ?", user));
		return list;
	}

	public boolean removeCategory(Category category) {
		hibernateTemplate.delete(category);
		return true;
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

}
