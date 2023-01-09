package com.cinema.cinemawebsite.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.sql.Date;

@Getter
@Setter
@NoArgsConstructor
public class TicketDto {

    @NotNull(message = "row is null")
    private Integer row;

    @NotNull(message = "seat is null")
    private Integer seat;

    @NotNull(message = "discount is null")
    private boolean discount;
}
