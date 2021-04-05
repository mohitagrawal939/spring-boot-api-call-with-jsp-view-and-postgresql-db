package com.teacherobservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class AppController {
	
	//It is for mapping JSP's on url
	
	@RequestMapping("/")
	public String home() {
	    return "index";
	}
	
	@RequestMapping("/login")
	public String login() {
	    return "login";
	}
	
	@RequestMapping("/dashboard")
	public String dashboard() {
	    return "dashboard";
	}
}