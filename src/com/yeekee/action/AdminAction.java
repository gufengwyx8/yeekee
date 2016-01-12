package com.yeekee.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;

import com.yeekee.model.Album;
import com.yeekee.model.FreshNews;
import com.yeekee.model.Gift;
import com.yeekee.model.User;
import com.yeekee.model.UserType;
import com.yeekee.service.FreshNewsManager;
import com.yeekee.service.GiftManager;
import com.yeekee.service.PhotoManager;
import com.yeekee.service.UserManager;
import com.yeekee.util.BaseAction;

public class AdminAction extends BaseAction {
	public static final String PHOTO_PATH = "/photo";

	private UserManager userManager;
	private FreshNewsManager freshNewsManager;
	private PhotoManager photoManager;
	private GiftManager giftManager;

	private User user, targetUser;
	private List<User> userList;
	private UserType userType;
	private FreshNews news;
	private List<FreshNews> newsList;
	private List<Gift> giftList;
	private Gift gift;
	private long maxPage;
	private int pageNo, id;
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private String oldPass, pass1, pass2;
	private Album album;

	public void loadUserBySession() {
		user = userManager.loadAdminById((Integer) getSession().getAttribute(
				ADMIN_SESSION_KEY));
	}

	public String login() {
		this.getSession().removeAttribute(ADMIN_SESSION_KEY);
		if (user == null) {
			return INPUT;
		}
		User u = userManager.loadUserByPassword(user.getEmail(), user
				.getPassword());
		if (u == null || u.getUserType() != UserType.ADMIN) {
			return INPUT;
		}
		this.getSession().setAttribute(ADMIN_SESSION_KEY, u.getId());
		return SUCCESS;
	}

	public String execute() {
		loadUserBySession();
		return SUCCESS;
	}

	public String user() {
		loadUserBySession();
		int pageSize = 20;
		if (pageNo < 1) {
			pageNo = 1;
		}
		if (userType == UserType.NGO) {
			maxPage = (userManager.getNgoCountBySearch("") + pageSize - 1)
					/ pageSize;
			if (pageNo > maxPage) {
				pageNo = (int) maxPage;
			}
			userList = userManager.loadNgoBySearch("", pageNo, pageSize);
		} else {
			userType = UserType.USER;
			maxPage = (userManager.getUserCountBySearch("") + pageSize - 1)
					/ pageSize;
			if (pageNo > maxPage) {
				pageNo = (int) maxPage;
			}
			userList = userManager.loadUserBySearch("", pageNo, pageSize);
		}
		return SUCCESS;
	}

	public String updateUser() {
		loadUserBySession();
		targetUser = userManager.loadUserById(id);
		return SUCCESS;
	}

	public String removeFreshNews() {
		loadUserBySession();
		targetUser = userManager.loadUserById(id);
		if (news != null) {
			freshNewsManager.removeFreshNewsById(news);
		}
		if (album != null) {
			photoManager.removeAlbumById(album);
		}
		return "remove";
	}

	public String viewNews() {
		loadUserBySession();
		news = freshNewsManager.loadNewsById(id);
		return SUCCESS;
	}

	public String addNews() {
		loadUserBySession();
		if (news == null) {
			return INPUT;
		}
		String root = getServletContext().getRealPath(PHOTO_PATH);
		if (upload == null) {
			return ERROR;
		}
		long num = new Date().getTime();
		String file = user.getId() + "_" + num + "."
				+ uploadFileName.substring(uploadFileName.lastIndexOf('.') + 1);
		File dest = new File(root, file);
		try {
			FileUtils.copyFile(upload, dest);
		} catch (IOException e) {
			e.printStackTrace();
		}
		news.setFile(PHOTO_PATH + "/" + file);
		freshNewsManager.addNews(news, user);
		return SUCCESS;
	}

	public String update() {
		loadUserBySession();
		User u = userManager.loadUserById(targetUser.getId());
		u.setEmail(targetUser.getEmail());
		u.setPassword(targetUser.getPassword());
		u.setNickName(targetUser.getNickName());
		u.setAddress(targetUser.getAddress());
		u.setRealName(targetUser.getRealName());
		u.setScore(targetUser.getScore());
		u.setContactPerson(targetUser.getContactPerson());
		u.setPhone(targetUser.getPhone());
		u.setPeopleCount(targetUser.getPeopleCount());
		userManager.updateUser(u);
		targetUser = userManager.loadUserById(targetUser.getId());
		return SUCCESS;
	}

	public String message() {
		loadUserBySession();
		int pageSize = 20;
		if (pageNo < 1) {
			pageNo = 1;
		}
		maxPage = (freshNewsManager.getNewsCount() + pageSize - 1) / pageSize;
		if (pageNo > maxPage) {
			pageNo = (int) maxPage;
		}
		newsList = freshNewsManager.getNewsList(pageNo, pageSize);
		return SUCCESS;
	}

	public String removeNews() {
		loadUserBySession();
		freshNewsManager.removeFreshNewsById(news);
		return SUCCESS;
	}

	public String score() {
		loadUserBySession();
		giftList = giftManager.loadGiftList();
		return SUCCESS;
	}

	public String updateGift() {
		loadUserBySession();
		user.setNickName("π‹¿Ì‘±");
		if (gift == null) {
			gift = giftManager.loadGiftList().get(id);
			return INPUT;
		}
		if (upload == null) {
			gift.setLogo(news.getTitle());
		} else {
			String root = getServletContext().getRealPath(PHOTO_PATH);
			long num = new Date().getTime();
			File dest = new File(root, user.getId() + "_" + num + ".jpg");
			try {
				FileUtils.copyFile(upload, dest);
			} catch (IOException e) {
				e.printStackTrace();
			}
			gift.setLogo(PHOTO_PATH + "/" + user.getId() + "_" + num + ".jpg");
		}
		giftManager.updateGift(gift);
		return SUCCESS;
	}

	public String changePassword() {
		loadUserBySession();
		if (oldPass == null) {
			return INPUT;
		}
		if (oldPass.equals(user.getPassword()) && pass1.equals(pass2)) {
			user.setPassword(pass1);
			userManager.updateUser(user);
		}
		return SUCCESS;
	}

	public UserManager getUserManager() {
		return userManager;
	}

	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}

	public FreshNewsManager getFreshNewsManager() {
		return freshNewsManager;
	}

	public void setFreshNewsManager(FreshNewsManager freshNewsManager) {
		this.freshNewsManager = freshNewsManager;
	}

	public PhotoManager getPhotoManager() {
		return photoManager;
	}

	public void setPhotoManager(PhotoManager photoManager) {
		this.photoManager = photoManager;
	}

	public GiftManager getGiftManager() {
		return giftManager;
	}

	public void setGiftManager(GiftManager giftManager) {
		this.giftManager = giftManager;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public UserType getUserType() {
		return userType;
	}

	public void setUserType(UserType userType) {
		this.userType = userType;
	}

	public long getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(long maxPage) {
		this.maxPage = maxPage;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageNo() {
		return pageNo;
	}

	public User getTargetUser() {
		return targetUser;
	}

	public void setTargetUser(User targetUser) {
		this.targetUser = targetUser;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<FreshNews> getNewsList() {
		return newsList;
	}

	public void setNewsList(List<FreshNews> newsList) {
		this.newsList = newsList;
	}

	public FreshNews getNews() {
		return news;
	}

	public void setNews(FreshNews news) {
		this.news = news;
	}

	public List<Gift> getGiftList() {
		return giftList;
	}

	public void setGiftList(List<Gift> giftList) {
		this.giftList = giftList;
	}

	public Gift getGift() {
		return gift;
	}

	public void setGift(Gift gift) {
		this.gift = gift;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getOldPass() {
		return oldPass;
	}

	public void setOldPass(String oldPass) {
		this.oldPass = oldPass;
	}

	public String getPass1() {
		return pass1;
	}

	public void setPass1(String pass1) {
		this.pass1 = pass1;
	}

	public String getPass2() {
		return pass2;
	}

	public void setPass2(String pass2) {
		this.pass2 = pass2;
	}

	public Album getAlbum() {
		return album;
	}

	public void setAlbum(Album album) {
		this.album = album;
	}

}
