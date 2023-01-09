package com.cinema.cinemawebsite.entities.compositeKey;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class RoomId implements Serializable {
    private Integer roomNumber;
    private Integer idCinema;
}
