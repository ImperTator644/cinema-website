package com.cinema.cinemawebsite.controllers;

import com.cinema.cinemawebsite.entities.Movie;
import com.cinema.cinemawebsite.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
public class MovieController {

    @Autowired
    private MovieService movieService;

    @PostMapping(path = "movie")
    public void addMovie(@Valid @RequestBody Movie movie)
    {
        movieService.addMovie(movie);
    }
}
