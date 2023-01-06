package com.cinema.cinemawebsite.controllers;

import com.cinema.cinemawebsite.entities.IShow;
import com.cinema.cinemawebsite.service.IShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class IShowController {
    private static final String TITLE = "title";
    private static final String ROOM = "room_number";
    private static final String CITY = "city";
    private static final String STREET = "street";
    private static final String DATE = "show_date";
    private static final String TIME = "show_time";
    private static final String PRICE = "price";

    @Autowired
    private IShowService iShowService;

    @PostMapping(path = "addIShow")
    @ResponseBody
    public boolean addIShow(@RequestParam(TITLE) String title,
                            @RequestParam(ROOM) Integer room_number,
                            @RequestParam(CITY) String city,
                            @RequestParam(STREET) String street,
                            @RequestParam(DATE) String show_date,
                            @RequestParam(TIME) String show_time,
                            @RequestParam(PRICE) Double price)
    {
        return iShowService.addiShow(title, room_number, city, street, show_date, show_time, price);
    }

    @GetMapping(path = "listIShows")
    @ResponseBody
    public List<IShow> listIShowsFromCinema(@RequestParam(STREET) String street,
                                            @RequestParam(CITY) String city)
    {
        return iShowService.getIShowsFromCinema(street, city);
    }
}
