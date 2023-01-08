package com.cinema.cinemawebsite.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;

import javax.persistence.*;

@Entity
@Component
@Getter
@Setter
@NoArgsConstructor
@Table(name = "client")
public class Client {

    @Column(name = "id_client")
    @Id
    private int id;

    @Column(name = "email")
    private String email;

}
