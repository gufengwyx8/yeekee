package com.yeekee.dao;

import java.util.List;

import com.yeekee.model.Album;
import com.yeekee.model.Photo;
import com.yeekee.model.User;

public interface PhotoDAO {
	boolean addPhoto(Photo photo);

	boolean addAlbum(Album album);

	Album getAlbumByName(String name, User user);

	List<Album> getAlbumList(User user, int pageNo, int pageSize);

	List<Photo> getPhotoList(Album album, int pageNo, int pageSize);
	
	Album getAlbumById(int id);
	
	boolean removeAlbumById(Album album);
}
