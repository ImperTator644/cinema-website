package com.cinema.cinemawebsite.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@AllArgsConstructor
@ToString
public class TicketMap {
    @Getter
    private TicketDto ticketDtos;
    @Getter
    private ReservationInformationDto reservationInfo;
    @Getter
    private String locationFullName;
    @Getter
    private Integer roomNumber;
}
