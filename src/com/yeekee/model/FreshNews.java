package com.yeekee.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class FreshNews {
	private int id;
	private FreshNewsType type;
	private String title;
	private String content;
	private User user;
	private Date date;
	private String blogType;
	private int peopleCount;
	private Date startDate, endDate;
	private List<Reply> reply;
	private User executeUser; // 如果是任务或活动，正在执行的用户
	private int score;
	private TaskType taskType;
	private User finishedUser;
	private String file;
	private String ngoFile;
	private Category category;
	
	public String getBlogType() {
		return blogType;
	}

	public void setBlogType(String blogType) {
		this.blogType = blogType;
	}

	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Enumerated(EnumType.ORDINAL)
	public FreshNewsType getType() {
		return type;
	}

	public void setType(FreshNewsType type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(columnDefinition = "text")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getPeopleCount() {
		return peopleCount;
	}

	public void setPeopleCount(int peopleCount) {
		this.peopleCount = peopleCount;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "p_news_id")
	public List<Reply> getReply() {
		return reply;
	}

	public void setReply(List<Reply> reply) {
		this.reply = reply;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "task_id")
	public User getExecuteUser() {
		return executeUser;
	}

	public void setExecuteUser(User executeUser) {
		this.executeUser = executeUser;
	}

	public boolean equals(Object o) {
		if (!(o instanceof FreshNews)) {
			return false;
		}
		FreshNews news = (FreshNews) o;
		return this.getId() == news.getId();
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	@Enumerated(EnumType.ORDINAL)
	public TaskType getTaskType() {
		return taskType;
	}

	public void setTaskType(TaskType taskType) {
		this.taskType = taskType;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "finish_task_id")
	public User getFinishedUser() {
		return finishedUser;
	}

	public void setFinishedUser(User finishedUser) {
		this.finishedUser = finishedUser;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getNgoFile() {
		return ngoFile;
	}

	public void setNgoFile(String ngoFile) {
		this.ngoFile = ngoFile;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id")
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
}
