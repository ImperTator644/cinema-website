package com.cinema.cinemawebsite.service;

import com.cinema.cinemawebsite.entities.Movie;
import com.cinema.cinemawebsite.entities.enums.MovieCategory;
import com.cinema.cinemawebsite.helpers.CategoryStringToEnumConverter;
import com.cinema.cinemawebsite.repositories.MovieRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
@Slf4j
public class MovieService {
    @Autowired
    private MovieRepository movieRepository;

    @Autowired
    private CategoryStringToEnumConverter categoryStringToEnumConverter;

    public void addMovie(Movie movie)
    {
        MovieCategory movieCategory;
        try {
            movieCategory = categoryStringToEnumConverter.convert(movie.getMovieCategory());
        } catch (IllegalArgumentException e) {
            log.error("Couldn't convert string to movie category enum {}", e.getMessage());
            return;
        }
        movieRepository.addMovie(movie.getTitle(), (movie.getMovieDescription() != null ? movie.getMovieDescription() : ""), Objects.requireNonNull(movieCategory).category, movie.getAgeCategory(), movie.getLength());
    }
}
