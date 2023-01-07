package com.cinema.cinemawebsite.entities;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Date;
import java.sql.Time;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "i_show")
public class IShow {
    @Column(name = "id_ishow")
    @Id
    private int idiShow;

    @Column(name = "id_show")
    private int idShow;

    @Column(name = "room_number")
    private int roomNumber;

    @Column(name = "id_cinema")
    private int idCinema;

    @Column(name = "show_date")
    private Date showDate;

    @Column(name = "show_time")
    private Time showTime;

    @Column(name = "price")
    private Double price;
}
