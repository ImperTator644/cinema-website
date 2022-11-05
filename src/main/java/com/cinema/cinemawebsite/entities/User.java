package com.cinema.cinemawebsite.entities;

import lombok.*;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private String email;

    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private String password;

    public User(String email, String password){
        this.email=email;
        this.password = password;
    }
}
