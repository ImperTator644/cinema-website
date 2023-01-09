package com.cinema.cinemawebsite.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

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
}
