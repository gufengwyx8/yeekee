package com.yeekee.model;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

@Entity
public class User {

	public static final String LOGO_PATH = "image/denglulogo.jpg";

	// 普通用户信息
	private int id;
	private String email;
	private String password;
	private String nickName; // 组织
	private String address;
	private String concern;
	private String skill;
	private String realName;
	private String sex;
	private Date birthday;
	private String phone;

	// NGO信息
	private String contactPerson; // 联系人
	private int peopleCount; // 工作人员数
	private String domain; // 关注领域
	private String activityArea; // 活动地区

	private UserType userType;

	private Set<User> friends;
	private List<FreshNews> freshNewes; // 发布的新鲜事
	private String logo;
	private List<FreshNews> executeTask; // 正在执行的任务
	private List<FreshNews> finishedTask;
	private long score;
	private List<Album> albums;
	private List<Reply> replys;
	private List<Category> categorys;

	public String toString() {
		return "" + id;
	}

	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getConcern() {
		return concern;
	}

	public void setConcern(String concern) {
		this.concern = concern;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	public Set<User> getFriends() {
		return friends;
	}

	public void setFriends(Set<User> friends) {
		this.friends = friends;
	}

	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	@OrderBy("id desc")
	public List<FreshNews> getFreshNewes() {
		return freshNewes;
	}

	public void setFreshNewes(List<FreshNews> freshNewes) {
		this.freshNewes = freshNewes;
	}

	public boolean equals(Object o) {
		if (o == null) {
			return false;
		}
		return this.getId() == ((User) o).getId();
	}

	public String getLogo() {
		if (logo == null || logo.equals("")) {
			return LOGO_PATH;
		}
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "task_id")
	public List<FreshNews> getExecuteTask() {
		return executeTask;
	}

	public void setExecuteTask(List<FreshNews> executeTask) {
		this.executeTask = executeTask;
	}

	public long getScore() {
		return score;
	}

	public void setScore(long score) {
		this.score = score;
	}

	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	public List<Album> getAlbums() {
		return albums;
	}

	public void setAlbums(List<Album> albums) {
		this.albums = albums;
	}

	public String getContactPerson() {
		return contactPerson;
	}

	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}

	public int getPeopleCount() {
		return peopleCount;
	}

	public void setPeopleCount(int peopleCount) {
		this.peopleCount = peopleCount;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getActivityArea() {
		return activityArea;
	}

	public void setActivityArea(String activityArea) {
		this.activityArea = activityArea;
	}

	@Enumerated(EnumType.ORDINAL)
	public UserType getUserType() {
		return userType;
	}

	public void setUserType(UserType userType) {
		this.userType = userType;
	}

	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "finish_task_id")
	public List<FreshNews> getFinishedTask() {
		return finishedTask;
	}

	public void setFinishedTask(List<FreshNews> finishedTask) {
		this.finishedTask = finishedTask;
	}

	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "p_user_id")
	@OrderBy("date desc")
	public List<Reply> getReplys() {
		return replys;
	}

	public void setReplys(List<Reply> replys) {
		this.replys = replys;
	}

	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	public List<Category> getCategorys() {
		return categorys;
	}

	public void setCategorys(List<Category> categorys) {
		this.categorys = categorys;
	}
}
