package com.cinema.cinemawebsite.helpers;

import com.cinema.cinemawebsite.entities.enums.MovieCategory;
import com.cinema.cinemawebsite.entities.enums.SoundtrackType;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class SoundtrackStringToEnumConverter implements Converter<String, SoundtrackType> {
    @Override
    public SoundtrackType convert(String source) {
        return SoundtrackType.valueOf(source.toUpperCase());
    }
}
