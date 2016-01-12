package com.yeekee.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.yeekee.dao.PhotoDAO;
import com.yeekee.model.Album;
import com.yeekee.model.Photo;
import com.yeekee.model.User;
import com.yeekee.util.PagerCallBack;

public class PhotoDAOImpl implements PhotoDAO {

	private HibernateTemplate hibernateTemplate;

	public boolean addAlbum(Album album) {
		hibernateTemplate.save(album);
		return true;
	}

	public boolean addPhoto(Photo photo) {
		hibernateTemplate.save(photo);
		return true;
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@SuppressWarnings("unchecked")
	public Album getAlbumByName(String name, User user) {
		List list = hibernateTemplate.find(
				"select a from Album a where a.name = ? and a.user = ?", name,
				user);
		if (list.size() > 0) {
			return (Album) list.get(0);
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<Album> getAlbumList(User user, int pageNo, int pageSize) {
		List<Album> list = hibernateTemplate.executeFind(new PagerCallBack(
				pageNo, pageSize, "from Album a where a.user = ?", user));
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Photo> getPhotoList(Album album, int pageNo, int pageSize) {
		List<Photo> list = hibernateTemplate.executeFind(new PagerCallBack(
				pageNo, pageSize, "from Photo a where a.album = ?", album));
		return list;
	}

	public Album getAlbumById(int id) {
		return hibernateTemplate.load(Album.class, id);
	}

	public boolean removeAlbumById(Album album) {
		hibernateTemplate.delete(album);
		return true;
	}

}
