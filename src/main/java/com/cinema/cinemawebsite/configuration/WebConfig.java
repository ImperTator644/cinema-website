package com.cinema.cinemawebsite.configuration;

import com.cinema.cinemawebsite.helpers.CategoryStringToEnumConverter;
import com.cinema.cinemawebsite.helpers.SoundtrackStringToEnumConverter;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(new CategoryStringToEnumConverter());
        registry.addConverter(new SoundtrackStringToEnumConverter());
    }
}
