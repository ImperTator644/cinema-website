package com.cinema.cinemawebsite.entities;

import com.cinema.cinemawebsite.entities.compositeKey.RoomId;
import com.cinema.cinemawebsite.entities.compositeKey.TicketId;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@ToString
@Table(name = "room")
@IdClass(RoomId.class)
public class Room {
    @Id
    @Column(name = "id_cinema")
    private int idCinema;

    @Id
    @Column(name = "room_number")
    private int roomNumber;

    @Column(name = "seat_count")
    private int seatCount;

    @Column(name = "row_count")
    private int rowCount;
}
