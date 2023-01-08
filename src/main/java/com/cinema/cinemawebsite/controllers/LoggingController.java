package com.cinema.cinemawebsite.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(path="")
public class LoggingController {

    @GetMapping
    public String openLogging(@RequestParam(name = "isOK", required = false) Boolean isOK,
                              @RequestParam(name = "addedEmail", required = false) String addedEmail,
                              Model model){
        model.addAttribute("isOK", isOK);
        model.addAttribute("addedEmail", addedEmail);
        return "index";
    }
}
