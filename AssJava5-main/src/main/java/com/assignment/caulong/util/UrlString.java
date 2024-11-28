package com.assignment.caulong.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

public class UrlString {
	
	public static String param(Model model, Map<String, Object> params) {
		List<String> urlString = new ArrayList<>();
		params.forEach((k, v) -> {
			if(v != null) {
				if(v instanceof String vString) {
					if(!vString.isBlank())
						model.addAttribute(k, vString);
				} else
					model.addAttribute(k, v);
				urlString.add(k + "=" + String.valueOf(v));
			}
		});
		return !urlString.isEmpty() ? "?" + String.join("&", urlString) : "";
	}

}
