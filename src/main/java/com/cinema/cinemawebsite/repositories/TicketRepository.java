package com.cinema.cinemawebsite.repositories;

import com.cinema.cinemawebsite.entities.Ticket;
import com.cinema.cinemawebsite.entities.compositeKey.TicketId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;

import java.sql.Date;
import java.util.List;

public interface TicketRepository extends JpaRepository<Ticket, TicketId> {
    @Procedure
    void reserveTicket(String email,
                       String title,
                       Date date,
                       int hour,
                       int minute,
                       int row,
                       int seat,
                       boolean discount);

    @Query(value = "SELECT isReserved(?1, ?2, ?3, ?4, ?5, ?6)", nativeQuery = true)
    boolean isReservedSeat(String title, Date date, Integer hour, Integer minute, Integer rowNumber, Integer seatNumber);

    @Query(value = "SELECT * FROM ticket t WHERE t.id_client=?1", nativeQuery = true)
    List<Ticket> getTicketsByClientID(Integer idClient);
}
