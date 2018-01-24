package com.galaxy.base.common.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix="myself")
public class BootdoConfig {
	//上传路径
	private String uploadPath;



	private String  downFile;



	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}




	public String getDownFile() {
		return downFile;
	}

	public void setDownFile(String downFile) {
		this.downFile = downFile;
	}
}
