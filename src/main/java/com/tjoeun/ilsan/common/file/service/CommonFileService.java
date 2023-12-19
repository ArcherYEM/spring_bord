package com.tjoeun.ilsan.common.file.service;

import org.springframework.web.multipart.MultipartFile;

public interface CommonFileService {
	
	public void upload(MultipartFile mFile) throws Exception;

}
