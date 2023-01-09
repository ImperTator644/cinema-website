package com.cinema.cinemawebsite.entities;

import lombok.*;
import org.springframework.stereotype.Component;

import javax.persistence.*;

@Entity
@Component
@Getter
@Setter
@NoArgsConstructor
@ToString
@Table(name = "client")
public class Client {

    @Column(name = "id_client")
    @Id
    private int id;

    @Column(name = "email")
    private String email;
}
