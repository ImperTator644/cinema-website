package com.cinema.cinemawebsite.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@NoArgsConstructor
public class TicketDto {

    @NotNull(message = "email is null")
    @NotBlank(message = "email is blank")
    @Email
    private String email;

    @NotNull(message = "title is null")
    @NotBlank(message = "title is blank")
    private String title;

    @NotNull(message = "date is null")
    @NotBlank(message = "date is blank")
    private String date;

    @NotNull(message = "hour is null")
    private Integer hour;

    @NotNull(message = "minute is null")
    private Integer minute;

    @NotNull(message = "row is null")
    private Integer row;

    @NotNull(message = "seat is null")
    private Integer seat;

    @NotNull(message = "discount is null")
    private boolean discount;
}
