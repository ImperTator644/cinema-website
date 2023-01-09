package com.cinema.cinemawebsite.entities.compositeKey;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class TicketId implements Serializable {
    private int idClient;
    private int idiShow;
    private int idSeat;
}
