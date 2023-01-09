package com.cinema.cinemawebsite.repositories;

import com.cinema.cinemawebsite.entities.Movie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;

public interface MovieRepository extends JpaRepository<Movie, Integer> {

    @Procedure
    void addMovie(String title,
                  String movie_description,
                  String movie_category,
                  int age_category,
                  int length);

    @Query(value = "SELECT * FROM Movie m WHERE m.id_movie=?1", nativeQuery = true)
    Movie getMovieById(Integer id);
    @Query(value = "SELECT m.soundtrack FROM movie_show m WHERE m.id_show=?1", nativeQuery = true)
    String getSoundtrackById(Integer movieShowID);
}
