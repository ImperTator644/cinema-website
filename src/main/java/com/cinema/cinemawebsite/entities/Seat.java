package com.cinema.cinemawebsite.entities;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Getter
@Setter
@NoArgsConstructor
@ToString
@Table(name = "seat")
public class Seat {
    @Id
    @Column(name = "id_seat")
    private int idSeat;

    @Column(name = "room_number")
    private int roomNumber;

    @Column(name = "id_cinema")
    private int idCinema;

    @Column(name = "seat_row")
    private int seatRow;

    @Column(name = "seat_number")
    private int seatNumber;
}
