package com.cinema.cinemawebsite.repositories;

import com.cinema.cinemawebsite.entities.Movie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;

public interface MovieRepository extends JpaRepository<Movie, Integer> {

    @Procedure
    void addMovie(String title,
                  String movie_description,
                  String movie_category,
                  int age_category,
                  int length);
}
