package com.cinema.cinemawebsite.helpers;

import com.cinema.cinemawebsite.entities.enums.MovieCategory;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class CategoryStringToEnumConverter implements Converter<String, MovieCategory> {
    @Override
    public MovieCategory convert(String source) {
        return MovieCategory.valueOf(source.toUpperCase());
    }
}
