package com.cinema.cinemawebsite.controllers;

import com.cinema.cinemawebsite.entities.Cinema;
import com.cinema.cinemawebsite.entities.IShow;
import com.cinema.cinemawebsite.model.dto.IShowDto;
import com.cinema.cinemawebsite.service.CinemaService;
import com.cinema.cinemawebsite.service.IShowService;
import com.cinema.cinemawebsite.service.MovieShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping(path = "/chooseIShow")
public class IShowController {

    @Autowired
    private IShowService iShowService;

    @Autowired
    private MovieShowService movieShowService;

    @Autowired
    private CinemaService cinemaService;

    @GetMapping(path = "")
    public ModelAndView openChooseIShowPage(){
        ModelAndView mav = new ModelAndView("reservation/choose-ishow");
        mav.addObject("listCinemas", cinemaService.getAllCinemas());
        mav.addObject("cinemaService", cinemaService);
        mav.addObject("iShowsFromCinema", iShowService);
        mav.addObject("movieShowService", movieShowService);
        return mav;
    }
}
