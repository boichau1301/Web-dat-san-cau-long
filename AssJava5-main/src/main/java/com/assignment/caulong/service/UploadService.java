package com.assignment.caulong.service;

import java.io.File;
import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

@Service
public class UploadService {

	@Autowired
	Cloudinary cloudinary;

	public String uploadFileToCloudinary(File file) {
		try {
			String fileName = file.getName();
	        int lastIndex = fileName.lastIndexOf('.');
	        fileName = lastIndex == -1 ? fileName : fileName.substring(0, lastIndex);
	        
			Map uploadResult = cloudinary.uploader().upload(file, ObjectUtils.asMap("resource_type", "image", "public_id", fileName));
			return (String) uploadResult.get("url");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String uploadMultipartFileToCloudinary(MultipartFile file) {
		try {
			if(file.isEmpty())
				return null;
			
			File imageFile = new File(System.getProperty("java.io.tmpdir") + "/" + file.getOriginalFilename());
			imageFile.createNewFile();
			file.transferTo(imageFile);
			
			String imageUrl = uploadFileToCloudinary(imageFile);
			imageFile.delete();
			
			return imageUrl;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * Lấy url file từ cloud
	 * 
	 * @param publicId tên file
	 * @return url ảnh, null nếu không tìm thấy
	 */
	public String getImage(String publicId) {
		try {
			return (String) cloudinary.api().resource(publicId, ObjectUtils.emptyMap()).get("url");
		} catch (Exception e) {
			return null;
		}
	}
	
	
	public void delete(String... publicId) {
		try {
			cloudinary.api().deleteResources(Arrays.asList(publicId), ObjectUtils.emptyMap());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
