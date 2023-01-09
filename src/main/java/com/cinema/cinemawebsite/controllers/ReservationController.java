package com.cinema.cinemawebsite.controllers;

import com.cinema.cinemawebsite.entities.Cinema;
import com.cinema.cinemawebsite.entities.IShow;
import com.cinema.cinemawebsite.entities.Movie;
import com.cinema.cinemawebsite.entities.MovieShow;
import com.cinema.cinemawebsite.model.dto.TicketDto;
import com.cinema.cinemawebsite.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping(path = "movie")
public class ReservationController {

    @Autowired
    private ReserveService reserveService;
    @Autowired
    private IShowService iShowService;
    @Autowired
    private MovieService movieService;
    @Autowired
    private MovieShowService movieShowService;
    @Autowired
    private CinemaService cinemaService;


    @GetMapping(path = "")
    public String openMoviesPage(@RequestParam(name = "id", required = false) Integer idiShowToReserve, Model model) {
        if(idiShowToReserve == null){
            return "redirect:chooseIShow";
        }
        prepareModel(idiShowToReserve, model);

        return "reservation/reserve-ticket";
    }

    private void prepareModel(Integer idiShowToReserve, Model model) {
        IShow iShow = iShowService.getIShowByID(idiShowToReserve);
        model.addAttribute("iShow", iShow);

        MovieShow movieShow = movieShowService.getMovieShowByID(iShow.getIdShow());
        model.addAttribute("movieShow", movieShow);

        Movie movie = movieService.getMovieByID(movieShow.getIdMovie());
        model.addAttribute("movie", movie);

        String cinemaFullName = cinemaService.getLocationFullNameByCinemaId(iShow.getIdCinema());
        model.addAttribute("cinemaFullName", cinemaFullName);
    }
}
