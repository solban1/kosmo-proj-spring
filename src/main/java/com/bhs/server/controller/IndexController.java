package com.bhs.server.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
    @GetMapping({"", "/"})
    public String index() {
        return "redirect:index.do";
    }

    @GetMapping("index.do")
    public String indexDo() {
        return "index";
    }
}
