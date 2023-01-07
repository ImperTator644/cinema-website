package com.cinema.cinemawebsite.controllers;

import com.cinema.cinemawebsite.service.MovieShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MovieShowController {
    private static final String TITLE = "title";
    private static final String SOUNDTRACK = "soundtrack";
    @Autowired
    private MovieShowService movieShowService;

    @PostMapping(path = "movieShow")
    public void addMovieShow(@RequestParam(TITLE) String title,
                             @RequestParam(SOUNDTRACK) String soundtrack)
    {
        movieShowService.addMovieShow(title, soundtrack);
    }
}
