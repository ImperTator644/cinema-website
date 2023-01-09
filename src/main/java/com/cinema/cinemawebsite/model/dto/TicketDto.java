package com.cinema.cinemawebsite.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotNull;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TicketDto {

    @NotNull(message = "row is null")
    private Integer row;

    @NotNull(message = "seat is null")
    private Integer seat;

    @NotNull(message = "discount is null")
    private boolean discount;
}
