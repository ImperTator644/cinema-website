package com.cinema.cinemawebsite.service;

import com.cinema.cinemawebsite.model.dto.TicketDto;
import com.cinema.cinemawebsite.repositories.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;

@Service
public class ReserveService {
    @Autowired
    private TicketRepository ticketRepository;

    public boolean reserveTicket(TicketDto ticketDto){
        Date date = Date.valueOf(ticketDto.getDate());
        if(isTicketReserved(ticketDto)){
            return false;
        }
        ticketRepository.reserveTicket(ticketDto.getEmail(), ticketDto.getTitle(), date, ticketDto.getHour(), ticketDto.getMinute(), ticketDto.getRow(), ticketDto.getSeat(), ticketDto.isDiscount());
        return true;
    }

    public boolean isTicketReserved(TicketDto ticketDto){
        Date date = Date.valueOf(ticketDto.getDate());
        return ticketRepository.isReserved(ticketDto.getTitle(), date, ticketDto.getHour(), ticketDto.getMinute(), ticketDto.getRow(), ticketDto.getSeat());
    }
}
