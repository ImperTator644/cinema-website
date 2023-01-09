package com.cinema.cinemawebsite.controllers;

import com.cinema.cinemawebsite.model.CustomUserDetails;
import com.cinema.cinemawebsite.model.dto.ReservationInformationDto;
import com.cinema.cinemawebsite.model.dto.TicketDto;
import com.cinema.cinemawebsite.model.dto.TicketMap;
import com.cinema.cinemawebsite.service.CinemaService;
import com.cinema.cinemawebsite.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping(path = "panelClient")
public class PanelClientController {
    @Autowired
    private ClientService clientService;


    @GetMapping
    public String openClientPanel(@AuthenticationPrincipal CustomUserDetails customUserDetails, Model model){
        if(customUserDetails == null) {
            return "redirect:/";
        }
        String login = customUserDetails.getUsername();
        model.addAttribute("login", login);
        Integer idClient = clientService.getClientByEmail(login).getId();
        List<TicketMap> reservationsInfo = clientService.getTicketMap(idClient, login);
        model.addAttribute("reservationsInfo", reservationsInfo);
        return "client/client-panel";
    }

    @GetMapping(path = "delete")
    public String openDeleteMyselfPage(@AuthenticationPrincipal CustomUserDetails customUserDetails,
                                       @RequestParam(value = "email", required = false) String email,
                                       Model model){
        if(customUserDetails == null) {
            return "redirect:/";
        }
        String login = customUserDetails.getUsername();
        model.addAttribute("login", login);
        if(email != null){
            clientService.deleteClient(email);
            return "redirect:/?logout";
        }
        return "client/delete-myself";
    }
}
