package com.cinema.cinemawebsite.controllers;

import com.cinema.cinemawebsite.entities.IShow;
import com.cinema.cinemawebsite.entities.Movie;
import com.cinema.cinemawebsite.entities.MovieShow;
import com.cinema.cinemawebsite.entities.Room;
import com.cinema.cinemawebsite.model.CustomUserDetails;
import com.cinema.cinemawebsite.model.dto.ReservationInformationDto;
import com.cinema.cinemawebsite.model.dto.TicketDto;
import com.cinema.cinemawebsite.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
    @Autowired
    private RoomService roomService;

    @PostMapping(path = "reserveTicket")
    public ModelAndView reserveTicket(@AuthenticationPrincipal CustomUserDetails customUserDetails,
                                @RequestParam(name = "id", required = false) Integer idiShowToReserve,
                                @Valid TicketDto ticketDto,
                                Model model)
    {
        prepareModel(idiShowToReserve, model, customUserDetails.getUsername());
        ReservationInformationDto reservationInformationDto = (ReservationInformationDto) model.getAttribute("reservationInformation");
        ModelAndView mav = new ModelAndView("redirect:/movie/?id=" + idiShowToReserve);
        if(!reserveService.reserveTicket(ticketDto, reservationInformationDto)){
            mav.addObject("reserveSuccessful", Boolean.FALSE);
        }
        else{
            mav.addObject("reserveSuccessful", Boolean.TRUE);
        }
        return mav;
    }


    @GetMapping(path = "")
    public String openMoviesPage(@AuthenticationPrincipal CustomUserDetails customUserDetails,
                                 @RequestParam(name = "id", required = false) Integer idiShowToReserve,
                                 @RequestParam(name = "reserveSuccessful", required = false) Boolean successful,
                                 Model model) {
        if (idiShowToReserve == null) {
            return "redirect:chooseIShow";
        }
        if (customUserDetails != null) {
            model.addAttribute("userEmail", customUserDetails.getUsername());
        } else {
            return "redirect:/";
        }
        if(successful != null){
            model.addAttribute("successful", successful);
        }
        prepareModel(idiShowToReserve, model, customUserDetails.getUsername());
        return "reservation/reserve-ticket";
    }

    private void prepareModel(Integer idiShowToReserve, Model model, String userEmail) {
        IShow iShow = iShowService.getIShowByID(idiShowToReserve);
        model.addAttribute("iShow", iShow);

        MovieShow movieShow = movieShowService.getMovieShowByID(iShow.getIdShow());
        model.addAttribute("movieShow", movieShow);

        Movie movie = movieService.getMovieByID(movieShow.getIdMovie());
        model.addAttribute("movie", movie);

        String cinemaFullName = cinemaService.getLocationFullNameByCinemaId(iShow.getIdCinema());
        model.addAttribute("cinemaFullName", cinemaFullName);

        Room room = roomService.getRoomByIdCinemaAndRoomNumber(iShow.getIdCinema(), iShow.getRoomNumber());
        model.addAttribute("room", room);

        model.addAttribute("rowList", roomService.getRowsList(room));
        model.addAttribute("seatsInRowList", roomService.getSeatList(room));

        ReservationInformationDto reservationInformationDto = new ReservationInformationDto(userEmail, movie.getTitle(), iShow.getShowDate(), iShow.getShowTime().getHours(), iShow.getShowTime().getMinutes(), iShow.getShowTime());

        model.addAttribute("reservationInformation", reservationInformationDto);
        model.addAttribute("ticketDto", new TicketDto());
    }
}
