package com.cinema.cinemawebsite.controllers;

import com.cinema.cinemawebsite.entities.Client;
import com.cinema.cinemawebsite.model.dto.ClientDto;
import com.cinema.cinemawebsite.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
@RequestMapping(path = "register")
public class RegisterController {

    @Autowired
    private ClientService clientService;

    @PostMapping(path = "add")
    public ModelAndView addClient(@Valid ClientDto clientDto){
        if(clientService.addClient(clientDto)){
            ModelAndView mav = new ModelAndView("redirect:/");
            mav.addObject("isOK", Boolean.TRUE);
            mav.addObject("addedEmail", clientDto.getEmail());
            return mav;
        }
        return new ModelAndView("redirect:/client/register");
    }

    @GetMapping("add")
    public String getRegisterPage(Model model) {
        model.addAttribute("clientDto", new ClientDto());
        model.addAttribute("isOK", Boolean.FALSE);
        return "client/register";
    }
}
