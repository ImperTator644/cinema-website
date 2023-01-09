package com.cinema.cinemawebsite.repositories;

import com.cinema.cinemawebsite.entities.Seat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface SeatRepository extends JpaRepository<Seat, Integer> {
    @Query(nativeQuery = true, value = "SELECT * FROM seat s WHERE s.id_seat=?1")
    Seat getSeatById(Integer idSeat);
}
