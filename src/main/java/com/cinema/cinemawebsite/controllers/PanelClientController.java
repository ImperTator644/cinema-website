package com.cinema.cinemawebsite.controllers;

import com.cinema.cinemawebsite.model.CustomUserDetails;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(path = "panelClient")
public class PanelClientController {

    @GetMapping
    public String openClientPanel(@AuthenticationPrincipal CustomUserDetails customUserDetails, Model model){
        model.addAttribute("login", customUserDetails.getUsername());
        return "client/client-panel";
    }
}
