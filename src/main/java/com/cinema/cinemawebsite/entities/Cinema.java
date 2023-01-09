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
@Table(name = "cinema")
public class Cinema {
    @Column(name = "id_cinema")
    @Id
    private int idCinema;

    @Column(name = "id_location")
    private String idLocation;
}
