package com.cinema.cinemawebsite.service;

import com.cinema.cinemawebsite.entities.IShow;
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

    public boolean addiShow(String title,
                            int room_number,
                            String city,
                            String street,
                            String show_date,
                            String show_time,
                            double price){
        Date date = Date.valueOf(show_date);
        Time time = Time.valueOf(show_time);
        if(!iShowRepository.checkIfishowCanBeAdded(street, city, room_number, date, time).isEmpty()){
            return false;
        }

        iShowRepository.addiShow(title, room_number, city, street, date, time, Precision.round(price, 2));
        return true;
    }

    public List<IShow> getIShowsFromCinema(String street, String city){
        return iShowRepository.getiShowsFromCinema(street, city);
    }
}
