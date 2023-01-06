package com.cinema.cinemawebsite.service;

import com.cinema.cinemawebsite.entities.enums.SoundtrackType;
import com.cinema.cinemawebsite.helpers.SoundtrackStringToEnumConverter;
import com.cinema.cinemawebsite.repositories.MovieShowRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
@Slf4j
public class MovieShowService {
    @Autowired
    private MovieShowRepository movieShowRepository;

    @Autowired
    private SoundtrackStringToEnumConverter soundtrackStringToEnumConverter;

    public void addMovieShow(String title, String soundtrack){
        SoundtrackType soundtrackType;
        try{
            soundtrackType = soundtrackStringToEnumConverter.convert(soundtrack);
        }
        catch (IllegalArgumentException e){
            log.error("Couldn't convert string to soundtrack type enum {}", e.getMessage());
            return;
        }
        movieShowRepository.addMovieShow(title, Objects.requireNonNull(soundtrackType).type);
    }
}
