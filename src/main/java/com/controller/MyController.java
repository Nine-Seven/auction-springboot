package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@Controller
public class MyController {

    @RequestMapping(value="/get",produces = "text/html;charset=utf-8")
    public @ResponseBody
    String get(Date date){

        return date==null?null: date.toString();
    }


}
