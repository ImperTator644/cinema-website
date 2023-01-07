package com.cinema.cinemawebsite.entities.compositeKey;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Objects;

@NoArgsConstructor
@AllArgsConstructor
public class TicketId implements Serializable {
    private int idClient;
    private int idiShow;
    private int idSeat;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TicketId ticketId = (TicketId) o;
        return idClient == ticketId.idClient &&
                idiShow == ticketId.idiShow &&
                idSeat == ticketId.idSeat;
    }

    @Override
    public int hashCode() {
        return Objects.hash(idClient, idiShow,idSeat);
    }
}
