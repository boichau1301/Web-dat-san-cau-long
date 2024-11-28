package com.assignment.caulong.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

@Configuration
public class CloudinaryConfiguration {
	
    private static final String CLOUD_NAME = "dybrajdvb";
    private static final String API_KEY = "693626457265418";
    private static final String API_SECRET = "st8ddemOAineOooG8dZOasszQlc";
    //CLOUDINARY_URL=cloudinary://693626457265418:st8ddemOAineOooG8dZOasszQlc@dybrajdvb

    @Bean
    Cloudinary cloudinary() {
    	return new Cloudinary(ObjectUtils.asMap(
    			"cloud_name", CLOUD_NAME,
                "api_key", API_KEY,
                "api_secret", API_SECRET));
    }
}
