package com.test;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.creditease.sgds.user.model.UserCoupon;
import com.creditease.sgds.user.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring.xml", "classpath:spring-mybatis.xml" })
public class MyTest {

	private final static Logger logger = LoggerFactory.getLogger(MyTest.class);

	@Resource(name="userService")
	private UserService userService;

	@Test
	public void test1() {
		List<UserCoupon> coupons = userService.selectCouponsByUserId("100001",0,BigDecimal.valueOf(10.5));
		logger.info(String.valueOf(coupons.size()));
	}
	

}
