package com.cinema.cinemawebsite.controllers;

import com.cinema.cinemawebsite.entities.Client;
import com.cinema.cinemawebsite.entities.Movie;
import com.cinema.cinemawebsite.model.DeleteClientModel;
import com.cinema.cinemawebsite.service.ClientService;
import com.cinema.cinemawebsite.service.IShowService;
import com.cinema.cinemawebsite.service.MovieService;
import com.cinema.cinemawebsite.service.MovieShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
@RequestMapping(path = "adminPanel")
public class PanelAdminController {
    @Autowired
    private ClientService clientService;

    @Autowired
    private MovieService movieService;

    @Autowired
    private MovieShowService movieShowService;

    @Autowired
    private IShowService iShowService;

    @GetMapping(path="")
    public String openAdminPanel(){
        return "admin/admin-panel";
    }

    @GetMapping("deleteClient")
    public String getDeletePage(Model model){
        model.addAttribute("deleteClientModel", new DeleteClientModel());
        model.addAttribute("clientsList", clientService.getClients());
        return "client/delete";
    }

    @PostMapping(path="deleteClient")
    public String deleteClient(DeleteClientModel deleteClientModel){
        clientService.deleteClient(deleteClientModel.getEmail());
        return "redirect:/adminPanel/deleteClient";
    }

    @PostMapping(path = "addMovie")
    public ModelAndView addMovie(@Valid Movie movie){
        movieService.addMovie(movie);
        ModelAndView mav = new ModelAndView("redirect:/adminPanel/addMovie");
        mav.addObject("addedMovie", movie.getTitle());
        return mav;
    }

    @GetMapping(path = "addMovie")
    public String getAddMoviePage(@RequestParam(name = "addedMovie", required = false) String addedMovie, Model model){
        model.addAttribute("addedMovie", addedMovie);
        model.addAttribute("movie", new Movie());
        return "admin/movie-adding";
    }
}