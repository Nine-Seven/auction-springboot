package com.Test;

import com.service.AuctionService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {
    public static void main(String[] args) {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");

      //  UserService userService = (UserService) applicationContext.getBean("userServiceImpl");

        //	userService.register(new User(1, "123", "123", "123", "123", "123", "123", (short) 1, "123", "123"));

        AuctionService auctionService = applicationContext.getBean(AuctionService.class);

        auctionService.selectAll(null, 1, 3, null);

    }
}
