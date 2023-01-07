package com.cinema.cinemawebsite.service;

import com.cinema.cinemawebsite.entities.IShow;
import com.cinema.cinemawebsite.model.dto.IShowDto;
import com.cinema.cinemawebsite.repositories.IShowRepository;
import org.apache.commons.math3.util.Precision;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

@Service
public class IShowService {
    @Autowired
    private IShowRepository iShowRepository;

    public boolean addiShow(IShowDto iShowDto){
        Date date = Date.valueOf(iShowDto.getShowDate());
        Time time = Time.valueOf(iShowDto.getShowTime());
        if(!iShowRepository.checkIfishowCanBeAdded(iShowDto.getStreet(), iShowDto.getCity(), iShowDto.getRoomNumber(), date, time).isEmpty()){
            return false;
        }

        iShowRepository.addiShow(iShowDto.getTitle(), iShowDto.getRoomNumber(), iShowDto.getCity(), iShowDto.getStreet(), date, time, Precision.round(iShowDto.getPrice(), 2));
        return true;
    }

    public List<IShow> getIShowsFromCinema(String street, String city){
        return iShowRepository.getiShowsFromCinema(street, city);
    }
}
