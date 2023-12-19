package com.tjoeun.ilsan.common.file.service;

import java.io.File;
import java.util.Random;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.tjoeun.ilsan.common.file.dao.CommonFileDao;

@Service
@EnableTransactionManagement
public class CommonFileServiceImpl implements CommonFileService {

	@Autowired
	CommonFileDao commonFileDao;
	
	@Value("${file.upload.path}")
	private String fileUploadPath;
	
	@Override
	@Transactional(
			readOnly = false
			,propagation = Propagation.MANDATORY
			,rollbackFor = {Exception.class}
			)
	public void upload(MultipartFile mFile) throws Exception {
		String o_filename = mFile.getOriginalFilename();
		String n_filename = UUID.randomUUID().toString();
		File newFile = new File(fileUploadPath + n_filename);
		try {
		mFile.transferTo(newFile);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
;
