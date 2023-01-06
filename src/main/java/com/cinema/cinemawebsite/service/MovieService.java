package com.cinema.cinemawebsite.service;

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

    public void addMovie(String title,
                         String movie_description,
                         String movie_category,
                         int age_category,
                         int length)
    {
        MovieCategory movieCategory;
        try{
            movieCategory = categoryStringToEnumConverter.convert(movie_category);
        }
        catch (IllegalArgumentException e){
            log.error("Couldn't convert string to movie category enum {}", e.getMessage());
            return;
        }
        movieRepository.addMovie(title, movie_description, Objects.requireNonNull(movieCategory).category, age_category, length);
    }
}
