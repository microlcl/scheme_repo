package com.eastteam.myprogram.service.account;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.eastteam.myprogram.dao.SpringTransactionalTestCase;
import com.eastteam.myprogram.entity.User;

public class AccountServiceTest extends SpringTransactionalTestCase {
	
	@Autowired
	AccountService accountService;

	@Test
	public void getAuthorizedUriList() {
		User user = accountService.getUser("userid1");
		List<String> uriList = accountService.getAuthorizedUriList(user);		
		assertNotNull(uriList);
		User user2 = accountService.getUser("userid8");
		System.out.println(user2);
		List<String> uriList2 = accountService.getAuthorizedUriList(user2);
		System.out.println(uriList2);
		assertTrue(uriList2.isEmpty());
		
	}

}
