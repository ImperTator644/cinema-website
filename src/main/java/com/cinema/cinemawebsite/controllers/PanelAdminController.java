package com.cinema.cinemawebsite.controllers;

import com.cinema.cinemawebsite.entities.Client;
import com.cinema.cinemawebsite.entities.Movie;
import com.cinema.cinemawebsite.model.CustomUserDetails;
import com.cinema.cinemawebsite.model.DeleteClientModel;
import com.cinema.cinemawebsite.model.dto.IShowDto;
import com.cinema.cinemawebsite.model.dto.ShowDto;
import com.cinema.cinemawebsite.service.ClientService;
import com.cinema.cinemawebsite.service.IShowService;
import com.cinema.cinemawebsite.service.MovieService;
import com.cinema.cinemawebsite.service.MovieShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
@RequestMapping(path = "adminPanel")
public class PanelAdminController {
    private static String ADMIN = "admin@admin";
    @Autowired
    private ClientService clientService;

    @Autowired
    private MovieService movieService;

    @Autowired
    private MovieShowService movieShowService;

    @Autowired
    private IShowService iShowService;

    @GetMapping(path="")
    public String openAdminPanel(@AuthenticationPrincipal CustomUserDetails customUserDetails){
        if(ADMIN.equals(customUserDetails.getUsername())){
            return "admin/admin-panel";
        }
        return "access-denied";
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

    @GetMapping(path = "addShow")
    public String openAddShowPage(@RequestParam(name="addedShow",required = false)String addedShow, Model model){
        model.addAttribute("addedShow",addedShow);
        model.addAttribute("show",new ShowDto());
        model.addAttribute("movieList", movieService.getMovies());
        return "admin/show-adding";
    }

    @PostMapping(path = "addShow")
    public ModelAndView addShow(@Valid ShowDto showDto){
        movieShowService.addMovieShow(showDto);
        ModelAndView mav = new ModelAndView("redirect:/adminPanel/addShow");
        mav.addObject("addedShow",showDto.getTitle());
        return mav;
    }

    @GetMapping(path = "addIShow")
    public String openAddIShowPage(@RequestParam(name="addedIShow",required = false)String addedIShow, Model model){
        model.addAttribute("addedIShow",addedIShow);
        model.addAttribute("ishow",new IShowDto());
        model.addAttribute("movieShowService", movieShowService);
        return "admin/ishow-adding";
    }

    @PostMapping(path = "addIShow")
    public ModelAndView addIShow(@Valid IShowDto iShowDto){
        iShowService.addiShow(iShowDto);
        ModelAndView mav = new ModelAndView("redirect:/adminPanel/addIShow");
        mav.addObject("addedIShow",iShowDto.getTitle());
        return mav;
    }
}
