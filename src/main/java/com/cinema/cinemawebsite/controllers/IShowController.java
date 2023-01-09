package com.cinema.cinemawebsite.controllers;

import com.cinema.cinemawebsite.service.CinemaService;
import com.cinema.cinemawebsite.service.IShowService;
import com.cinema.cinemawebsite.service.MovieShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
