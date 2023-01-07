package com.cinema.cinemawebsite.entities;

import com.cinema.cinemawebsite.entities.compositeKey.TicketId;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "ticket")
@IdClass(TicketId.class)
public class Ticket {
    @Id
    @Column(name = "id_client")
    private int idClient;

    @Id
    @Column(name = "id_ishow")
    private int idiShow;

    @Id
    @Column(name = "id_seat")
    private int idSeat;

    @Column(name = "discount")
    private boolean discount;
}
