package com.cinema.cinemawebsite.repositories;

import com.cinema.cinemawebsite.entities.Client;
import com.cinema.cinemawebsite.entities.Ticket;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;

import java.sql.Date;

public interface TicketRepository extends JpaRepository <Ticket, Integer> {
    @Procedure
    void reserveTicket(String email ,
                       String title ,
                       String date,
                       int hour ,
                       int minute,
                       int row,
                       int seat,
                       boolean discount);
}
