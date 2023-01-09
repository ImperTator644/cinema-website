package com.cinema.cinemawebsite.service;

import com.cinema.cinemawebsite.entities.IShow;
import com.cinema.cinemawebsite.entities.Ticket;
import com.cinema.cinemawebsite.model.dto.ReservationInformationDto;
import com.cinema.cinemawebsite.model.dto.TicketDto;
import com.cinema.cinemawebsite.repositories.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReserveService {
    @Autowired
    private TicketRepository ticketRepository;

    public boolean reserveTicket(TicketDto ticketDto, ReservationInformationDto reservationInformationDto){
        if(reservedSeats(ticketDto, reservationInformationDto)){
            return false;
        }
        ticketRepository.reserveTicket(reservationInformationDto.getEmail(), reservationInformationDto.getTitle(), reservationInformationDto.getDate(), reservationInformationDto.getHour(), reservationInformationDto.getMinute(), ticketDto.getRow(), ticketDto.getSeat(), ticketDto.isDiscount());
        return true;
    }

    public boolean reservedSeats(TicketDto ticketDto, ReservationInformationDto reservationInformationDto) {
        return ticketRepository.isReservedSeat(reservationInformationDto.getTitle(),
                reservationInformationDto.getDate(),
                reservationInformationDto.getHour(),
                reservationInformationDto.getMinute(),
                ticketDto.getRow(),
                ticketDto.getSeat());
    }
}
