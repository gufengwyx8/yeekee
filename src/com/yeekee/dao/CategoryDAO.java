package com.yeekee.dao;

import java.util.List;

import com.yeekee.model.Category;
import com.yeekee.model.User;

public interface CategoryDAO {
	boolean addCategory(Category category);

	boolean removeCategory(Category category);

	Category getCategoryById(int id);

	List<Category> getCategoryList(User user, int pageNo, int pageSize);
}
