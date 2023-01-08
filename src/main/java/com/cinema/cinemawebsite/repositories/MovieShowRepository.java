package com.cinema.cinemawebsite.repositories;

import com.cinema.cinemawebsite.entities.MovieShow;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;

public interface MovieShowRepository extends JpaRepository<MovieShow, Integer> {
    @Procedure
    void addMovieShow(  String title,
                        String soundtrack);

}
