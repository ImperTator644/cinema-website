package com.cinema.cinemawebsite.entities;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
@Getter
@Setter
@NoArgsConstructor
@ToString
@Table(name = "movie")
public class Movie {
    @Column(name = "id_movie")
    @Id
    private int id;

    @NotNull(message = "Title is null")
    @NotBlank(message = "Title is blank")
    @Column(name = "title")
    private String title;

    @Column(name = "movie_description")
    private String movieDescription;

    @NotNull(message = "Category is null")
    @NotBlank(message = "Category is blank")
    @Column(name = "movie_category")
    private String movieCategory;

    @NotNull(message = "Age category is null")
    @Column(name = "age_category")
    private int ageCategory;

    @NotNull(message = "Length is null")
    @Column(name = "length")
    private int length;
}
