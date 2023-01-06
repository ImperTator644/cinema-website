package com.cinema.cinemawebsite.controllers;

import com.cinema.cinemawebsite.entities.Cinema;
import com.cinema.cinemawebsite.service.CinemaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CinemaController {
    @Autowired
    private CinemaService cinemaService;

    @GetMapping(path = "getAllCinemas")
    @ResponseBody
    public List<Cinema> getAllCinemas(){
        return cinemaService.getAllCinemas();
    }
}
