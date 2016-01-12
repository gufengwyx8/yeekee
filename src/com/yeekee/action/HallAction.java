package com.yeekee.action;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import com.yeekee.model.FreshNews;
import com.yeekee.model.User;
import com.yeekee.service.FreshNewsManager;
import com.yeekee.service.UserManager;
import com.yeekee.util.BaseAction;

public class HallAction extends BaseAction {
	public static final int PAGE_SIZE = 4;

	private FreshNewsManager freshNewsManager;
	private UserManager userManager;
	private List<FreshNews> newsList;
	private List<String> blogTypes;
	private List<User> ngoList;
	private int pageNo = 1;
	private long maxPage, startPage, endPage;
	private User user;
	private String domain;
	private String errorMsg;
	private List<FreshNews> myNewsList;
	private Date nowDate;

	public void loadUserBySession() {
		user = userManager.loadUserById((Integer) getSession().getAttribute(
				USER_SESSION_KEY));
		myNewsList = freshNewsManager.getNewsList(1, 5);
		nowDate = new Date();
		if (errorMsg != null) {
			try {
				errorMsg = new String(new String(
						errorMsg.getBytes("iso8859-1"), "gbk").getBytes("gbk"),
						"gbk");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
	}

	public String taskHall() {
		loadUserBySession();
		if (pageNo < 1) {
			pageNo = 1;
		}
		maxPage = (freshNewsManager.getTaskCount(blogTypes) + PAGE_SIZE - 1)
				/ PAGE_SIZE;
		if (pageNo > maxPage) {
			pageNo = (int) maxPage;
		}
		newsList = freshNewsManager.loadTasks(pageNo, PAGE_SIZE, blogTypes);
		for (FreshNews news : newsList) {
			if (news.getContent().length() > 50) {
				news.setContent(news.getContent().substring(0, 47) + "...");
			}
		}
		return SUCCESS;
	}

	public String actionHall() {
		loadUserBySession();
		if (pageNo < 1) {
			pageNo = 1;
		}
		maxPage = (freshNewsManager.getActionCount(blogTypes) + PAGE_SIZE - 1)
				/ PAGE_SIZE;
		if (pageNo > maxPage) {
			pageNo = (int) maxPage;
		}
		newsList = freshNewsManager.loadActions(pageNo, PAGE_SIZE, blogTypes);
		for (FreshNews news : newsList) {
			if (news.getContent().length() > 50) {
				news.setContent(news.getContent().substring(0, 47) + "...");
			}
		}
		return SUCCESS;
	}

	public String ngoHall() {
		loadUserBySession();
		if (pageNo < 1) {
			pageNo = 1;
		}
		maxPage = (userManager.getNgoCount(domain) + PAGE_SIZE - 1) / PAGE_SIZE;
		if (pageNo > maxPage) {
			pageNo = (int) maxPage;
		}
		ngoList = userManager.getNgoList(domain, pageNo, PAGE_SIZE);
		getPager();
		System.out.println(userManager.getNgoCount(domain));
		return SUCCESS;
	}

	public FreshNewsManager getFreshNewsManager() {
		return freshNewsManager;
	}

	public void setFreshNewsManager(FreshNewsManager freshNewsManager) {
		this.freshNewsManager = freshNewsManager;
	}

	public List<FreshNews> getNewsList() {
		return newsList;
	}

	public void setNewsList(List<FreshNews> newsList) {
		this.newsList = newsList;
	}

	public List<String> getBlogTypes() {
		return blogTypes;
	}

	public void setBlogTypes(List<String> blogTypes) {
		this.blogTypes = blogTypes;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public long getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(long maxPage) {
		this.maxPage = maxPage;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserManager getUserManager() {
		return userManager;
	}

	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}

	public List<User> getNgoList() {
		return ngoList;
	}

	public void setNgoList(List<User> ngoList) {
		this.ngoList = ngoList;
	}

	public void getPager() {
		if (pageNo < 3) {
			startPage = 1;
		} else if (pageNo > maxPage - 2) {
			startPage = maxPage - 4;
		} else {
			startPage = pageNo - 2;
		}
		if (startPage < 1) {
			startPage = 1;
		}
		if (startPage + 4 > maxPage) {
			endPage = maxPage;
		} else {
			endPage = startPage + 4;
		}
	}

	public long getStartPage() {
		return startPage;
	}

	public void setStartPage(long startPage) {
		this.startPage = startPage;
	}

	public long getEndPage() {
		return endPage;
	}

	public void setEndPage(long endPage) {
		this.endPage = endPage;
	}

	public String getNgoType() {
		return domain;
	}

	public void setNgoType(String ngoType) {
		this.domain = ngoType;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public List<FreshNews> getMyNewsList() {
		return myNewsList;
	}

	public void setMyNewsList(List<FreshNews> myNewsList) {
		this.myNewsList = myNewsList;
	}

	public Date getNowDate() {
		return nowDate;
	}

	public void setNowDate(Date nowDate) {
		this.nowDate = nowDate;
	}
}
