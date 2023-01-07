package com.cinema.cinemawebsite.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@NoArgsConstructor
public class IShowDto {

    @NotNull(message = "Title is null")
    @NotBlank(message = "Title is blank")
    private String title;

    @NotNull(message = "Room number is null")
    private Integer roomNumber;

    @NotNull(message = "City number is null")
    @NotBlank(message = "City is blank")
    private String city;

    @NotNull(message = "Street number is null")
    @NotBlank(message = "Street is blank")
    private String street;

    @NotNull(message = "Show date is null")
    @NotBlank(message = "Show date is blank")
    private String showDate;

    @NotNull(message = "Show time is null")
    @NotBlank(message = "Show time is blank")
    private String showTime;

    @NotNull(message = "Price is null")
    private Double price;
}
