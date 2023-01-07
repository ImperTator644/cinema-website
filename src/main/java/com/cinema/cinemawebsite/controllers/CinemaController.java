package com.cinema.cinemawebsite.controllers;

import com.cinema.cinemawebsite.entities.Cinema;
import com.cinema.cinemawebsite.service.CinemaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "cinema")
public class CinemaController {
    @Autowired
    private CinemaService cinemaService;

    @GetMapping(path = "getAll")
    @ResponseBody
    public List<Cinema> getAllCinemas(){
        return cinemaService.getAllCinemas();
    }
}
