package com.yeekee.action;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.yeekee.model.Album;
import com.yeekee.model.Category;
import com.yeekee.model.FreshNews;
import com.yeekee.model.FreshNewsType;
import com.yeekee.model.Gift;
import com.yeekee.model.Photo;
import com.yeekee.model.Reply;
import com.yeekee.model.TaskType;
import com.yeekee.model.User;
import com.yeekee.model.UserType;
import com.yeekee.service.FreshNewsManager;
import com.yeekee.service.GiftManager;
import com.yeekee.service.PhotoManager;
import com.yeekee.service.UserManager;
import com.yeekee.util.BaseAction;

public class HomeAction extends BaseAction {

    public static final int PAGE_SIZE = 7;

    public static final String PHOTO_PATH = "/photo";

    public static final String FILE_PATH = "/file";

    private UserManager userManager;

    private FreshNewsManager freshNewsManager;

    private PhotoManager photoManager;

    private GiftManager giftManager;

    private User user;

    private List<FreshNews> newsList;

    private FreshNews news;

    private int pageNo = 1, year, month, day, year2, month2, day2;

    private long maxPage, startPage, endPage;

    private int id;

    private Reply reply;

    private List<Reply> replyList;

    private User targetUser;

    private Album album;

    private File[] upload;

    private String[] uploadFileName;

    private String[] uploadContentType;

    private List<Album> albumList;

    private List<Photo> photoList;

    private String[] photoNames;

    private Photo photo;

    private String msg, type;

    private List<User> userList;

    private List<Gift> giftList;

    private String errorMsg;

    private List<FreshNews> myNewsList;

    private List<Integer> yearArr, monthArr, dayArr;

    private Category category;

    private List<Category> categoryList;

    public void loadUserBySession() {
        user = userManager.loadUserById((Integer) getSession().getAttribute(
            USER_SESSION_KEY));
        myNewsList = freshNewsManager.getNewsList(1, 5);
        if (errorMsg != null) {
            try {
                errorMsg = new String(errorMsg.getBytes("iso8859-1"), "gbk");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
    }

    public String execute() throws NullPointerException {
        loadUserBySession();
        int pageSize = PAGE_SIZE;
        if (pageNo < 1) {
            pageNo = 1;
        }
        maxPage = (freshNewsManager.getNewsCount(user) + pageSize - 1)
                / pageSize;
        if (pageNo > maxPage) {
            pageNo = (int) maxPage;
        }
        newsList = freshNewsManager.loadFriendsNews(user, pageNo, pageSize);
        for (FreshNews news : newsList) {
            if (news.getType() == FreshNewsType.BLOG) {
                news.setContent(news.getContent().replaceAll("<([^>]*)>", "")
                        .trim());
            }
            if (news.getContent().length() > 120) {
                news.setContent(news.getContent().substring(0, 117) + "...");
            }
        }
        return SUCCESS;
    }

    public String friendUser() {
        loadUserBySession();
        int pageSize = PAGE_SIZE;
        if (pageNo < 1) {
            pageNo = 1;
        }
        maxPage = (userManager.getFriendUserCount(user) + pageSize - 1)
                / pageSize;
        if (pageNo > maxPage) {
            pageNo = (int) maxPage;
        }
        userList = userManager.getFriendUserList(user, pageNo, pageSize);
        msg = "friendUser";
        return SUCCESS;
    }

    public String friendNgo() {
        loadUserBySession();
        int pageSize = PAGE_SIZE;
        if (pageNo < 1) {
            pageNo = 1;
        }
        maxPage = (userManager.getFriendNgoCount(user) + pageSize - 1)
                / pageSize;
        if (pageNo > maxPage) {
            pageNo = (int) maxPage;
        }
        userList = userManager.getFriendNgoList(user, pageNo, pageSize);
        msg = "friendNgo";
        return SUCCESS;
    }

    public String friendAll() {
        loadUserBySession();
        int pageSize = PAGE_SIZE;
        if (pageNo < 1) {
            pageNo = 1;
        }
        maxPage = (userManager.getFriendCount(user) + pageSize - 1) / pageSize;
        if (pageNo > maxPage) {
            pageNo = (int) maxPage;
        }
        userList = userManager.getFriendList(user, pageNo, pageSize);
        msg = "friendAll";
        return SUCCESS;
    }

    public String addStatus() {
        loadUserBySession();
        freshNewsManager.addStatus(news, user);
        return SUCCESS;
    }

    public String addCategory() {
        loadUserBySession();
        freshNewsManager.addCategory(category, user);
        return SUCCESS;
    }

    public String addBlog() {
        loadUserBySession();
        if (news == null) {
            return INPUT;
        }
        if (news.getTitle().length() <= 0 || news.getTitle().length() > 15) {
            return INPUT;
        }
        freshNewsManager.addBlog(news, user, id);
        return SUCCESS;
    }

    public String addAttention() {
        loadUserBySession();
        userManager.addFriend(user.getId(), id);
        return SUCCESS;
    }

    public String addTask() {
        loadUserBySession();
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
        if (user.getUserType() != UserType.NGO) {
            return ERROR;
        }
        if (news == null) {
            return INPUT;
        }
        if (news.getTitle().length() < 0 || news.getTitle().length() > 15) {
            return INPUT;
        }
        String root = getServletContext().getRealPath(FILE_PATH);
        if (upload != null) {
            long num = new Date().getTime();
            String file = user.getId()
                    + "_"
                    + num
                    + "."
                    + uploadFileName[0].substring(uploadFileName[0]
                            .lastIndexOf('.') + 1);
            File dest = new File(root, file);
            try {
                FileUtils.copyFile(upload[0], dest);
            } catch (IOException e) {
                e.printStackTrace();
            }
            news.setNgoFile(FILE_PATH + "/" + file);
        }
        try {
            news.setStartDate(new SimpleDateFormat("yyyy-MM-dd").parse(year
                    + "-" + month + "-" + day));
            news.setEndDate(new SimpleDateFormat("yyyy-MM-dd").parse(year2
                    + "-" + month2 + "-" + day2));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        freshNewsManager.addTask(news, user);
        return SUCCESS;
    }

    public String addAction() {
        loadUserBySession();
        if (user.getUserType() != UserType.NGO) {
            return ERROR;
        }
        if (news == null) {
            return INPUT;
        }
        if (news.getTitle().length() < 0 || news.getTitle().length() > 15) {
            return INPUT;
        }
        freshNewsManager.addAction(news, user);
        return SUCCESS;
    }

    public String removeBlog() {
        loadUserBySession();
        freshNewsManager.removeFreshNewsById(news);
        return SUCCESS;
    }

    public String removeAlbum() {
        loadUserBySession();
        photoManager.removeAlbumById(album);
        return SUCCESS;
    }

    public String downloadFile() {
        loadUserBySession();
        news = freshNewsManager.loadNewsById(id);
        if (!user.getFreshNewes().contains(news)) {
            return ERROR;
        }
        msg = news.getFile();
        return SUCCESS;
    }

    public String downloadNgoFile() {
        loadUserBySession();
        news = freshNewsManager.loadNewsById(id);
        msg = news.getNgoFile();
        return SUCCESS;
    }

    public String uploadImage() {
        loadUserBySession();
        String root = getServletContext().getRealPath(PHOTO_PATH);
        if (upload == null) {
            return INPUT;
        }
        long num = new Date().getTime();
        String file = user.getId()
                + "_"
                + num
                + "."
                + uploadFileName[0].substring(uploadFileName[0]
                        .lastIndexOf('.') + 1);
        File dest = new File(root, file);
        try {
            FileUtils.copyFile(upload[0], dest);
        } catch (IOException e) {
            e.printStackTrace();
        }
        String path = getHttpRequest().getContextPath();
        String basePath = getHttpRequest().getScheme() + "://"
                + getHttpRequest().getServerName() + ":"
                + getHttpRequest().getServerPort() + path + "/";
        msg = basePath + "photo/" + file;
        return SUCCESS;
    }

    public String viewBlog() {
        loadUserBySession();
        int pageSize = 2;
        news = freshNewsManager.loadNewsById(id);
        System.out.println(news.getCategory().getName());
        if (news.getType() != FreshNewsType.BLOG
                && news.getType() != FreshNewsType.TASK
                && news.getType() != FreshNewsType.ACTION) {
            return ERROR;
        }
        if (pageNo < 1) {
            pageNo = 1;
        }
        maxPage = (news.getReply().size() + pageSize - 1) / pageSize;
        if (pageNo > maxPage) {
            pageNo = (int) maxPage;
        }
        return SUCCESS;
    }

    public String viewNews() {
        loadUserBySession();
        news = freshNewsManager.loadNewsById(id);
        return SUCCESS;
    }

    public String viewPhoto() {
        loadUserBySession();
        album = photoManager.getAlbumById(id);
        int pageSize = 5;
        if (pageNo < 1) {
            pageNo = 1;
        }
        maxPage = (album.getPhotos().size() + pageSize - 1) / pageSize;
        if (pageNo > maxPage) {
            pageNo = (int) maxPage;
        }
        getPager();
        photoList = photoManager.getPhotoList(album, pageNo, pageSize);
        return SUCCESS;
    }

    public String setLogo() {
        loadUserBySession();
        userManager.setLogo(user, photo.getPath());
        return SUCCESS;
    }

    public String addBlogReply() {
        loadUserBySession();
        int pageSize = 2;
        news = freshNewsManager.loadNewsById(id);
        if (news.getType() != FreshNewsType.BLOG
                && news.getType() != FreshNewsType.TASK
                && news.getType() != FreshNewsType.ACTION) {
            return ERROR;
        }
        freshNewsManager.addReply(news, reply, user);
        maxPage = (news.getReply().size() + pageSize - 1) / pageSize;
        return SUCCESS;
    }

    public String addUserReply() {
        loadUserBySession();
        targetUser = userManager.loadUserById(id);
        userManager.addReply(targetUser, reply, user);
        return SUCCESS;
    }

    public String personalInfoBlog() {
        loadUserBySession();
        int pageSize = 3;
        targetUser = userManager.loadUserById(id);
        if (pageNo < 1) {
            pageNo = 1;
        }
        maxPage = (freshNewsManager.getBlogCount(targetUser) + pageSize - 1)
                / pageSize;
        if (pageNo > maxPage) {
            pageNo = (int) maxPage;
        }
        newsList = freshNewsManager.getBlogByUser(targetUser, pageNo, pageSize);
        for (FreshNews news : newsList) {
            news.setContent(news.getContent().replaceAll("<([^>]*)>", "")
                    .trim());
            if (news.getContent().length() > 250) {
                news.setContent(news.getContent().substring(0, 247) + "...");
            }
        }
        getPager();
        return SUCCESS;
    }

    public String personalInfoAlbum() {
        loadUserBySession();
        int pageSize = 9;
        targetUser = userManager.loadUserById(id);
        if (pageNo < 1) {
            pageNo = 1;
        }
        maxPage = (targetUser.getAlbums().size() + pageSize - 1) / pageSize;
        if (pageNo > maxPage) {
            pageNo = (int) maxPage;
        }
        getPager();
        albumList = photoManager.getAlbumList(targetUser, pageNo, pageSize);
        return SUCCESS;
    }

    public String personalInfoReply() {
        loadUserBySession();
        targetUser = userManager.loadUserById(id);
        int pageSize = 5;
        if (pageNo < 1) {
            pageNo = 1;
        }
        maxPage = (targetUser.getReplys().size() + pageSize - 1) / pageSize;
        if (pageNo > maxPage && maxPage > 0) {
            pageNo = (int) maxPage;
        }
        replyList = targetUser.getReplys().subList((pageNo - 1) * pageSize,
            Math.min(pageNo * pageSize, targetUser.getReplys().size()));
        getPager();
        return SUCCESS;
    }

    public String addExecute() {
        loadUserBySession();
        freshNewsManager.addExecuteTask(user, id);
        return SUCCESS;
    }

    public String removeExecute() {
        loadUserBySession();
        freshNewsManager.removeExecuteTask(user, id);
        return SUCCESS;
    }

    public String executingTask() {
        loadUserBySession();
        int pageSize = 5;
        if (pageNo < 1) {
            pageNo = 1;
        }
        newsList = new ArrayList<FreshNews>();
        for (FreshNews news : user.getExecuteTask()) {
            if (news.getType() == FreshNewsType.TASK
                    && news.getTaskType() == TaskType.UNFINISH) {
                newsList.add(news);
            }
        }
        maxPage = (newsList.size() + pageSize - 1) / pageSize;
        if (pageNo > maxPage && maxPage > 0) {
            pageNo = (int) maxPage;
        }
        newsList = newsList.subList((pageNo - 1) * pageSize, Math.min(pageNo
                * pageSize, newsList.size()));
        getPager();
        return SUCCESS;
    }

    public String finishedTask() {
        loadUserBySession();
        int pageSize = 5;
        if (pageNo < 1) {
            pageNo = 1;
        }
        newsList = new ArrayList<FreshNews>();
        for (FreshNews news : user.getFinishedTask()) {
            if (news.getType() == FreshNewsType.TASK
                    && news.getTaskType() == TaskType.FINISH) {
                newsList.add(news);
            }
        }
        maxPage = (newsList.size() + pageSize - 1) / pageSize;
        if (pageNo > maxPage && maxPage > 0) {
            pageNo = (int) maxPage;
        }
        newsList = newsList.subList((pageNo - 1) * pageSize, Math.min(pageNo
                * pageSize, newsList.size()));
        getPager();
        return SUCCESS;
    }

    public String myTask() {
        loadUserBySession();
        if (user.getUserType() != UserType.NGO) {
            return ERROR;
        }
        int pageSize = 5;
        if (pageNo < 1) {
            pageNo = 1;
        }
        newsList = new ArrayList<FreshNews>();
        for (FreshNews news : user.getFreshNewes()) {
            if (news.getType() == FreshNewsType.TASK
                    && news.getTaskType() == TaskType.UNFINISH) {
                newsList.add(news);
            }
        }
        maxPage = (newsList.size() + pageSize - 1) / pageSize;
        if (pageNo > maxPage && maxPage > 0) {
            pageNo = (int) maxPage;
        }
        newsList = newsList.subList((pageNo - 1) * pageSize, Math.min(pageNo
                * pageSize, newsList.size()));
        getPager();
        return SUCCESS;
    }

    public String finishTask() {
        loadUserBySession();
        if (!freshNewsManager.finishTask(user, id)) {
            return ERROR;
        }
        return SUCCESS;
    }

    public String addFile() {
        loadUserBySession();
        if (news == null) {
            return INPUT;
        }
        String root = getServletContext().getRealPath(FILE_PATH);
        if (upload == null) {
            return ERROR;
        }
        long num = new Date().getTime();
        String file = user.getId()
                + "_"
                + num
                + "."
                + uploadFileName[0].substring(uploadFileName[0]
                        .lastIndexOf('.') + 1);
        File dest = new File(root, file);
        try {
            FileUtils.copyFile(upload[0], dest);
        } catch (IOException e) {
            e.printStackTrace();
        }
        freshNewsManager.addFile(news, FILE_PATH + "/" + file);
        return SUCCESS;
    }

    public String gift() {
        loadUserBySession();
        giftList = giftManager.loadGiftList();
        return SUCCESS;
    }

    public String addPhoto() {
        loadUserBySession();
        if (upload == null) {
            return INPUT;
        }
        String root = getServletContext().getRealPath(PHOTO_PATH);
        int count = 0;
        for (int i = 0; i < upload.length; i++) {
            if (upload[i] == null) {
                break;
            }
            long num = new Date().getTime();
            File dest = new File(root, user.getId() + "_" + num + ".jpg");
            try {
                FileUtils.copyFile(upload[i], dest);
            } catch (IOException e) {
                e.printStackTrace();
            }
            Photo p = new Photo();
            p.setPath(PHOTO_PATH + "/" + user.getId() + "_" + num + ".jpg");
            album.setUser(user);
            p.setName(photoNames[i]);
            photoManager.addPhoto(p, album);
            count++;
        }
        news = new FreshNews();
        news.setTitle(album.getId() + "");
        news.setContent(album.getName());
        freshNewsManager.addPhoto(news, user);
        return SUCCESS;
    }

    public String addAlbum() {
        loadUserBySession();
        if (album == null || album.getName().equals("")) {
            return SUCCESS;
        }
        photoManager.addAlbum(album, user);
        return SUCCESS;
    }

    public String search() {
        loadUserBySession();
        int pageSize = 5;
        if (pageNo < 1) {
            pageNo = 1;
        }
        System.out.println(type);
        if (type.equals("任务")) {
            maxPage = (freshNewsManager.getTaskCountBySearch(msg) + pageSize - 1)
                    / pageSize;
            if (pageNo > maxPage && maxPage > 0) {
                pageNo = (int) maxPage;
            }
            newsList = freshNewsManager.loadTaskBySearch(msg, pageNo, pageSize);
        } else if (type.equals("活动")) {
            maxPage = (freshNewsManager.getActionCountBySearch(msg) + pageSize - 1)
                    / pageSize;
            if (pageNo > maxPage && maxPage > 0) {
                pageNo = (int) maxPage;
            }
            newsList = freshNewsManager.loadActionBySearch(msg, pageNo,
                pageSize);
        } else if (type.equals("用户")) {
            maxPage = (userManager.getUserCountBySearch(msg) + pageSize - 1)
                    / pageSize;
            if (pageNo > maxPage && maxPage > 0) {
                pageNo = (int) maxPage;
            }
            userList = userManager.loadUserBySearch(msg, pageNo, pageSize);
        } else if (type.equals("组织")) {
            maxPage = (userManager.getNgoCountBySearch(msg) + pageSize - 1)
                    / pageSize;
            if (pageNo > maxPage && maxPage > 0) {
                pageNo = (int) maxPage;
            }
            userList = userManager.loadNgoBySearch(msg, pageNo, pageSize);
        }
        if (newsList != null) {
            for (FreshNews news : newsList) {
                news.setContent(news.getContent().replaceAll("<([^>]*)>", "")
                        .trim());
                if (news.getContent().length() > 20) {
                    news.setContent(news.getContent().substring(0, 20) + "...");
                }
            }
        }
        getPager();
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<FreshNews> getNewsList() {
        return newsList;
    }

    public void setNewsList(List<FreshNews> newsList) {
        this.newsList = newsList;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public void setNews(FreshNews news) {
        this.news = news;
    }

    public FreshNews getNews() {
        return news;
    }

    public long getMaxPage() {
        return maxPage;
    }

    public void setMaxPage(long maxPage) {
        this.maxPage = maxPage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Reply getReply() {
        return reply;
    }

    public void setReply(Reply reply) {
        this.reply = reply;
    }

    public User getTargetUser() {
        return targetUser;
    }

    public void setTargetUser(User targetUser) {
        this.targetUser = targetUser;
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

    public PhotoManager getPhotoManager() {
        return photoManager;
    }

    public void setPhotoManager(PhotoManager photoManager) {
        this.photoManager = photoManager;
    }

    public Album getAlbum() {
        return album;
    }

    public void setAlbum(Album album) {
        this.album = album;
    }

    public File[] getUpload() {
        return upload;
    }

    public void setUpload(File[] upload) {
        this.upload = upload;
    }

    public String[] getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String[] uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String[] getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String[] uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public List<Album> getAlbumList() {
        return albumList;
    }

    public void setAlbumList(List<Album> albumList) {
        this.albumList = albumList;
    }

    public List<Photo> getPhotoList() {
        return photoList;
    }

    public void setPhotoList(List<Photo> photoList) {
        this.photoList = photoList;
    }

    public String[] getPhotoNames() {
        return photoNames;
    }

    public void setPhotoNames(String[] photoNames) {
        this.photoNames = photoNames;
    }

    public Photo getPhoto() {
        return photo;
    }

    public void setPhoto(Photo photo) {
        this.photo = photo;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    public GiftManager getGiftManager() {
        return giftManager;
    }

    public void setGiftManager(GiftManager giftManager) {
        this.giftManager = giftManager;
    }

    public List<Gift> getGiftList() {
        return giftList;
    }

    public void setGiftList(List<Gift> giftList) {
        this.giftList = giftList;
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

    public InputStream getInputStream() {
        return ServletActionContext.getServletContext()
                .getResourceAsStream(msg);
    }

    public List<Reply> getReplyList() {
        return replyList;
    }

    public void setReplyList(List<Reply> replyList) {
        this.replyList = replyList;
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

    public int getYear2() {
        return year2;
    }

    public void setYear2(int year2) {
        this.year2 = year2;
    }

    public int getMonth2() {
        return month2;
    }

    public void setMonth2(int month2) {
        this.month2 = month2;
    }

    public int getDay2() {
        return day2;
    }

    public void setDay2(int day2) {
        this.day2 = day2;
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

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<Category> getCategoryList() {
        return categoryList;
    }

    public void setCategoryList(List<Category> categoryList) {
        this.categoryList = categoryList;
    }

}
