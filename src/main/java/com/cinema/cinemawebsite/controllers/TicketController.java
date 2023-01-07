package com.cinema.cinemawebsite.controllers;

import com.cinema.cinemawebsite.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TicketController {
    private static final String EMAIL = "email";
    private static final String TITLE = "tytul";
    private static final String DATE = "data_seansu";
    private static final String HOUR = "godzina";
    private static final String MINUTE = "minuta";
    private static final String ROW = "rzad";
    private static final String SEAT = "miejsce";
    private static final String DISCOUNT = "znizka";

    @Autowired
    private TicketService ticketService;

    @PostMapping(path = "reserveTicket")
    public void reserveTicket(@RequestParam(EMAIL) String email,
                              @RequestParam(TITLE) String title,
                              @RequestParam(DATE) String date,
                              @RequestParam(HOUR) Integer hour,
                              @RequestParam(MINUTE) Integer minute,
                              @RequestParam(ROW) Integer row,
                              @RequestParam(SEAT) Integer seat,
                              @RequestParam(DISCOUNT) boolean discount)
    {
        ticketService.reserveTicket(email, title, date, hour, minute, row, seat, discount);
    }
}
