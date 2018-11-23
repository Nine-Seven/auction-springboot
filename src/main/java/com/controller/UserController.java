package com.controller;

import com.entity.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(HttpSession session, User user, String code) {
        String sessionCode = (String) session.getAttribute("code");
        if (!sessionCode.equalsIgnoreCase(code)) {
          //  return "login";
        }
        User success = userService.login(user);
        if (success != null) {
            session.setAttribute("login", success);
            return "redirect:/private/selectAll";
        }

        return "login";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("login");
        return "login";
    }

    @RequestMapping("/register")
    public String register(HttpSession session, String code, User user) {
        String sessionCode = (String) session.getAttribute("code");
        if (!sessionCode.equalsIgnoreCase(code)) {
            return "register";
        }
        userService.register(user);
        return "login";
    }


}
