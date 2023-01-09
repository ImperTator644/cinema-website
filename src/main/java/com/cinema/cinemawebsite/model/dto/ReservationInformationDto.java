package com.cinema.cinemawebsite.model.dto;

import lombok.*;

import java.sql.Date;
import java.sql.Time;

@ToString
@AllArgsConstructor
@Getter
@Setter
public class ReservationInformationDto {
    private String email;
    private String title;
    private Date date;
    private Integer hour;
    private Integer minute;
    private Time showTime;
}
