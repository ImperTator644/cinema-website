package com.cinema.cinemawebsite.service;

import com.cinema.cinemawebsite.entities.IShow;
import com.cinema.cinemawebsite.entities.enums.SoundtrackType;
import com.cinema.cinemawebsite.helpers.SoundtrackStringToEnumConverter;
import com.cinema.cinemawebsite.model.dto.IShowDto;
import com.cinema.cinemawebsite.repositories.IShowRepository;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.math3.util.Precision;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Time;
import java.util.List;

@Service
@Slf4j
public class IShowService {
    @Autowired
    private IShowRepository iShowRepository;

    @Autowired
    private SoundtrackStringToEnumConverter soundtrackStringToEnumConverter;

    public boolean addiShow(IShowDto iShowDto){
        Time time = Time.valueOf(iShowDto.getShowTime()+":00");
        if(!iShowRepository.checkIfishowCanBeAdded(iShowDto.getStreet(), iShowDto.getCity(), iShowDto.getRoomNumber(), iShowDto.getShowDate(), time).isEmpty()){
            return false;
        }

        SoundtrackType soundtrackType;
        try{
            soundtrackType = soundtrackStringToEnumConverter.convert(iShowDto.getSoundtrack());
        }
        catch (IllegalArgumentException e){
            log.error("Couldn't convert string to soundtrack type enum {}", e.getMessage());
            return false;
        }

        iShowRepository.addiShow(iShowDto.getTitle(), iShowDto.getRoomNumber(), iShowDto.getCity(), iShowDto.getStreet(), iShowDto.getShowDate(), time, Precision.round(iShowDto.getPrice(), 2), iShowDto.getSoundtrack());
        return true;
    }

    public List<IShow> getIShowsFromCinema(String street, String city){
        return iShowRepository.getiShowsFromCinema(street, city);
    }
}
