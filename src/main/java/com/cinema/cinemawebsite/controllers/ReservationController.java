package com.cinema.cinemawebsite.controllers;

import com.cinema.cinemawebsite.model.dto.TicketDto;
import com.cinema.cinemawebsite.service.ReserveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
public class ReservationController {

    @Autowired
    private ReserveService reserveService;

    @PostMapping(path = "ticket")
    public boolean reserveTicket(@Valid @RequestBody TicketDto ticketDto){
        return reserveService.reserveTicket(ticketDto);
    }
}
