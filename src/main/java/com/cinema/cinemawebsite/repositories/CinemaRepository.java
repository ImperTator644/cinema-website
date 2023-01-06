package com.cinema.cinemawebsite.repositories;

import com.cinema.cinemawebsite.entities.Cinema;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CinemaRepository extends JpaRepository<Cinema, Integer> {
}
