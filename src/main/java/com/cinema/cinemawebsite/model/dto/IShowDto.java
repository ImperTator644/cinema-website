package com.cinema.cinemawebsite.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
public class IShowDto {

    @NotNull(message = "Title is null")
    @NotBlank(message = "Title is blank")
    private String title;

    @NotNull(message = "Soundtrack is null")
    @NotBlank(message = "Soundtrack is blank")
    private String soundtrack;

    @NotNull(message = "Room number is null")
    private Integer roomNumber;

    @NotNull(message = "City number is null")
    @NotBlank(message = "City is blank")
    private String city;

    @NotNull(message = "Street number is null")
    @NotBlank(message = "Street is blank")
    private String street;

    @NotNull(message = "Show date is null")
    private Date showDate;

    @NotNull(message = "Show time is null")
    private String showTime;

    @NotNull(message = "Price is null")
    private Double price;
}
