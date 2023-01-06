package com.cinema.cinemawebsite.repositories;

import com.cinema.cinemawebsite.entities.IShow;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

public interface IShowRepository extends JpaRepository<IShow, Integer> {
    @Procedure
    void addiShow(String title,
                  int room_number,
                  String city,
                  String street,
                  Date show_date,
                  Time show_time,
                  double price);

    @Query( value = "SELECT * FROM iShow s " +
            "WHERE s.id_cinema = (SELECT c.id_cinema FROM cinema c NATURAL JOIN location l WHERE l.street=?1 AND l.city=?2) " +
            "AND s.room_number = ?3 " +
            "AND s.show_date = ?4 " +
            "AND s.show_time BETWEEN SUBTIME(?5, '4:0:0') AND ADDTIME(?5, '4:0:0')", nativeQuery = true)
    List<IShow> checkIfishowCanBeAdded(String street,
                                       String city,
                                       int room_number,
                                       Date show_date,
                                       Time show_time);

    @Query( value = "SELECT * FROM iShow s " +
            "WHERE s.id_cinema = (SELECT c.id_cinema FROM cinema c NATURAL JOIN location l WHERE l.street=?1 AND l.city=?2)", nativeQuery = true)
    List<IShow> getiShowsFromCinema(String street,
                                       String city);
}
