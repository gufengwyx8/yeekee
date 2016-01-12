package com.yeekee.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.Cookie;

import com.yeekee.model.User;
import com.yeekee.service.UserManager;
import com.yeekee.util.BaseAction;

public class UserAction extends BaseAction {

	private UserManager userManager;
	private User user;
	private String code;
	private String err_state;
	private boolean autoLogin;
	private int year, month, day;
	private List<Integer> yearArr, monthArr, dayArr;

	public String reg() {
		yearArr = new ArrayList<Integer>();
		monthArr = new ArrayList<Integer>();
		dayArr = new ArrayList<Integer>();
		for (int i = 1960; i <= new GregorianCalendar().get(Calendar.YEAR); i++) {
			yearArr.add(i);
		}
		for (int i = 1; i <= 12; i++) {
			monthArr.add(i);
		}
		for (int i = 1; i <= 31; i++) {
			dayArr.add(i);
		}
		if (user == null) {
			return INPUT;
		}
		if (!code.equals(getSession().getAttribute(CODE_SESSION_KEY))) {
			err_state = "code_err";
			return INPUT;
		}
		if (user.getEmail().trim().equals("")
				|| user.getPassword().trim().equals("")) {
			err_state = "input_err";
			return INPUT;
		}
		try {
			user.setBirthday(new SimpleDateFormat("yyyy-MM-dd").parse(year + "-"
					+ month + "-" + day));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		if (userManager.regUser(user)) {
			return SUCCESS;
		}
		err_state = "name_repeat_err";
		return INPUT;
	}

	public String autoLogin() {
		if (getCookie(USER_SESSION_KEY) != null) {
			User u = userManager.loadUserById(Integer.parseInt(this.getCookie(
					USER_SESSION_KEY).getValue()));
			this.getSession().setAttribute(USER_SESSION_KEY, u.getId());
			return SUCCESS;
		}
		return INPUT;
	}

	public String login() {
		this.getSession().removeAttribute(USER_SESSION_KEY);
		Cookie c = new Cookie(USER_SESSION_KEY, "");
		c.setMaxAge(0);
		this.addCookie(c);
		if (user == null) {
			return INPUT;
		}
		User u = userManager.loadUserByPassword(user.getEmail(), user
				.getPassword());
		if (u == null) {
			err_state = "password_err";
			return INPUT;
		}
		this.getSession().setAttribute(USER_SESSION_KEY, u.getId());
		if (autoLogin) {
			c = new Cookie(USER_SESSION_KEY, u.getId() + "");
			c.setMaxAge(Integer.MAX_VALUE);
			this.addCookie(c);
		}
		return SUCCESS;
	}

	public UserManager getUserManager() {
		return userManager;
	}

	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getErr_state() {
		return err_state;
	}

	public void setErr_state(String errState) {
		err_state = errState;
	}

	public boolean isAutoLogin() {
		return autoLogin;
	}

	public void setAutoLogin(boolean autoLogin) {
		this.autoLogin = autoLogin;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public List<Integer> getYearArr() {
		return yearArr;
	}

	public void setYearArr(List<Integer> yearArr) {
		this.yearArr = yearArr;
	}

	public List<Integer> getMonthArr() {
		return monthArr;
	}

	public void setMonthArr(List<Integer> monthArr) {
		this.monthArr = monthArr;
	}

	public List<Integer> getDayArr() {
		return dayArr;
	}

	public void setDayArr(List<Integer> dayArr) {
		this.dayArr = dayArr;
	}

}
