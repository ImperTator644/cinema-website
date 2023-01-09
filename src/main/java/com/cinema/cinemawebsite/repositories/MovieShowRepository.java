package com.cinema.cinemawebsite.repositories;

import com.cinema.cinemawebsite.entities.IShow;
import com.cinema.cinemawebsite.entities.Movie;
import com.cinema.cinemawebsite.entities.MovieShow;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;

import java.util.List;

public interface MovieShowRepository extends JpaRepository<MovieShow, Integer> {
    @Procedure
    void addMovieShow(  String title,
                        String soundtrack);

    @Query(value = "SELECT m.id_movie FROM Movie m NATURAL JOIN movie_show ms where ms.id_show=?1", nativeQuery = true)
    Integer getMovieIdByShowId(Integer id);

    @Query( value = "SELECT * FROM movie_show " ,nativeQuery = true)
    List<MovieShow> getMovieShows();

}
