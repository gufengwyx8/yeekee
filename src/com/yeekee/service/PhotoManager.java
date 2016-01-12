package com.yeekee.service;

import java.util.List;

import com.yeekee.model.Album;
import com.yeekee.model.Photo;
import com.yeekee.model.User;

public interface PhotoManager {
	boolean addPhoto(Photo photo, Album album);

	boolean addAlbum(Album album, User user);

	List<Album> getAlbumList(User user, int pageNo, int pageSize);

	List<Photo> getPhotoList(Album album, int pageNo, int pageSize);

	Album getAlbumById(int id);
	
	boolean removeAlbumById(Album album);
}
