package com.cinema.cinemawebsite.service;

import com.cinema.cinemawebsite.entities.Cinema;
import com.cinema.cinemawebsite.repositories.CinemaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CinemaService {
    @Autowired
    private CinemaRepository cinemaRepository;

    public List<Cinema> getAllCinemas(){
        return cinemaRepository.findAll();
    }
}
