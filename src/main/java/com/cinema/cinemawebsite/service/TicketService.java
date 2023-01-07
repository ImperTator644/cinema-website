package com.cinema.cinemawebsite.service;

import com.cinema.cinemawebsite.repositories.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;

@Service
public class TicketService {
    @Autowired
    private TicketRepository ticketRepository;

    public void reserveTicket(String email ,
                              String title ,
                              String date,
                              int hour ,
                              int minute,
                              int row,
                              int seat,
                              boolean discount){
        ticketRepository.reserveTicket(email, title, date, hour, minute, row, seat, discount);
    }
}
