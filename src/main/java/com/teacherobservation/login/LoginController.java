package com.teacherobservation.login;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/api/v1")
public class LoginController {
	
	@PostMapping(path="/check",produces = "application/JSON")
	public ResponseEntity<Object> home() {
		Map<String, Object> json = new HashMap<>();
	    json.put("status", true);
	    json.put("message", "My controller called");
	    return ResponseEntity.status(HttpStatus.OK).body(json);
	}
	
	@Autowired
	private LoginServiceImpl ls;
	
	@PostMapping(path="/checkUserNamePassword",produces = "application/JSON",consumes = "application/JSON")
	public ResponseEntity<Object> checkUserNamePassword(@RequestBody User user) {
		String userName = user.getUsername();
		String passWord = user.getPassword();
		Map<String, Object> json = ls.checkUsernameAndPassword(userName,passWord);
	    return ResponseEntity.status(HttpStatus.OK).body(json);
	}
	
	
	/*
	 * 1 -Access Token Service : Pass-> loginid & password -> accessTOken
	 * 2. Featured Service		: accessTOken, getMyData
	 */
}