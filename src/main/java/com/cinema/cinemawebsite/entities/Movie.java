package com.cinema.cinemawebsite.entities;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "movie")
public class Movie {
    @Column(name = "id_movie")
    @Id
    private int id;

    @Column(name = "title")
    private String title;

    @Column(name = "movie_description")
    private String movieDescription;

    @Column(name = "movie_category")
    private String movieCategory;

    @Column(name = "age_category")
    private int ageCategory;

    @Column(name = "length")
    private int length;
}
