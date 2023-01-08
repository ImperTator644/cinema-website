package com.cinema.cinemawebsite.repositories;

import com.cinema.cinemawebsite.entities.Cinema;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CinemaRepository extends JpaRepository<Cinema, Integer> {

    @Query(value = "SELECT CONCAT(l.city, ', ', l.street) FROM Cinema c NATURAL JOIN Location l WHERE c.id_cinema = ?1", nativeQuery = true)
    String getLocationByCinemaId(Integer id);
}
