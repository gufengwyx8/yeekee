package com.yeekee.service.impl;

import java.util.List;

import com.yeekee.dao.PhotoDAO;
import com.yeekee.model.Album;
import com.yeekee.model.Photo;
import com.yeekee.model.User;
import com.yeekee.service.PhotoManager;

public class PhotoManagerImpl implements PhotoManager {

	private PhotoDAO photoDAO;

	public PhotoDAO getPhotoDAO() {
		return photoDAO;
	}

	public void setPhotoDAO(PhotoDAO photoDAO) {
		this.photoDAO = photoDAO;
	}

	public boolean addAlbum(Album album, User user) {
		album.setUser(user);
		if (photoDAO.getAlbumByName(album.getName(), album.getUser()) != null) {
			return false;
		}
		return photoDAO.addAlbum(album);
	}

	public boolean addPhoto(Photo photo, Album album) {
		Album tmpAlbum = photoDAO.getAlbumByName(album.getName(), album.getUser());
		photo.setAlbum(tmpAlbum);
		album.setId(tmpAlbum.getId());
		return photoDAO.addPhoto(photo);
	}

	public List<Album> getAlbumList(User user, int pageNo, int pageSize) {
		return photoDAO.getAlbumList(user, pageNo, pageSize);
	}

	public List<Photo> getPhotoList(Album album, int pageNo, int pageSize) {
		return photoDAO.getPhotoList(album, pageNo, pageSize);
	}

	public Album getAlbumById(int id) {
		return photoDAO.getAlbumById(id);
	}

	public boolean removeAlbumById(Album album) {
		return photoDAO.removeAlbumById(album);
	}

}
