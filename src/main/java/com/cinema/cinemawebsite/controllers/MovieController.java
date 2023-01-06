package com.cinema.cinemawebsite.controllers;

import com.cinema.cinemawebsite.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MovieController {
    private static final String TITLE = "title";
    private static final String DESC = "movie_description";
    private static final String CATEGORY = "movie_category";
    private static final String AGE_CAT = "age_category";
    private static final String LENGTH = "length";

    @Autowired
    private MovieService movieService;

    @PostMapping(path = "addMovie")
    public void addMovie(@RequestParam(TITLE) String title,
                          @RequestParam(DESC) String description,
                          @RequestParam(CATEGORY) String category,
                          @RequestParam(AGE_CAT) Integer ageCategory,
                          @RequestParam(LENGTH) Integer length)
    {
        movieService.addMovie(title, description, category, ageCategory, length);
    }
}
