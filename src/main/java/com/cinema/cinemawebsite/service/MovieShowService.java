package com.cinema.cinemawebsite.service;

import com.cinema.cinemawebsite.entities.IShow;
import com.cinema.cinemawebsite.entities.Movie;
import com.cinema.cinemawebsite.entities.MovieShow;
import com.cinema.cinemawebsite.entities.enums.SoundtrackType;
import com.cinema.cinemawebsite.helpers.SoundtrackStringToEnumConverter;
import com.cinema.cinemawebsite.model.dto.ShowDto;
import com.cinema.cinemawebsite.repositories.IShowRepository;
import com.cinema.cinemawebsite.repositories.MovieRepository;
import com.cinema.cinemawebsite.repositories.MovieShowRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
@Slf4j
public class MovieShowService {
    @Autowired
    private MovieShowRepository movieShowRepository;
    @Autowired
    private MovieRepository movieRepository;

    @Autowired
    private SoundtrackStringToEnumConverter soundtrackStringToEnumConverter;


    public void addMovieShow(ShowDto showDto){
        SoundtrackType soundtrackType;
        try{
            soundtrackType = soundtrackStringToEnumConverter.convert(showDto.getSoundtrack());
        }
        catch (IllegalArgumentException e){
            log.error("Couldn't convert string to soundtrack type enum {}", e.getMessage());
            return;
        }
        movieShowRepository.addMovieShow(showDto.getTitle(), Objects.requireNonNull(soundtrackType).type);
    }

    public Movie getMovieFromShow(Integer movieShowID){
        Integer movieId = movieShowRepository.getMovieIdByShowId(movieShowID);
        return movieRepository.getMovieById(movieId);
    }


    public String getSoundtrackFromShow(Integer movieShowID){
        return movieRepository.getSoundtrackById(movieShowID);
    }

    public List<MovieShow> getMovieShows() {
        return movieShowRepository.getMovieShows();
    }

    public MovieShow getMovieShowByID(Integer showID){
        return movieShowRepository.getMovieShowByID(showID);
    }
}
