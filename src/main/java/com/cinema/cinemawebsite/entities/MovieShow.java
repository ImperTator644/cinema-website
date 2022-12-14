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
@Table(name = "movie_show")
public class MovieShow {
    @Column(name = "id_show")
    @Id
    private int idShow;

    @Column(name = "id_movie")
    private int idMovie;

    @Column(name = "soundtrack")
    private String soundtrack;
}
