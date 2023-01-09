package com.cinema.cinemawebsite.service;

import com.cinema.cinemawebsite.entities.Seat;
import com.cinema.cinemawebsite.repositories.SeatRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SeatService {
    @Autowired
    private SeatRepository seatRepository;

    public Seat getSeatById(Integer idSeat){
        return seatRepository.getSeatById(idSeat);
    }
}
