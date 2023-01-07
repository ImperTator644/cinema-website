package com.cinema.cinemawebsite.entities.compositeKey;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Objects;

@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class ReservedId implements Serializable {
    private int idSeat;
    private int idiShow;
}
