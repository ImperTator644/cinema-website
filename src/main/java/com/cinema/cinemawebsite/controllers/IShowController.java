package com.cinema.cinemawebsite.controllers;

import com.cinema.cinemawebsite.entities.IShow;
import com.cinema.cinemawebsite.model.dto.IShowDto;
import com.cinema.cinemawebsite.service.IShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
public class IShowController {
    private static final String CITY = "city";
    private static final String STREET = "street";

    @Autowired
    private IShowService iShowService;

    @PostMapping(path = "ishow")
    @ResponseBody
    public boolean addIShow(@Valid @RequestBody IShowDto iShowDto)
    {
        return iShowService.addiShow(iShowDto);
    }

    @GetMapping(path = "ishow")
    @ResponseBody
    public List<IShow> listIShowsFromCinema(@RequestParam(STREET) String street,
                                            @RequestParam(CITY) String city)
    {
        return iShowService.getIShowsFromCinema(street, city);
    }
}
