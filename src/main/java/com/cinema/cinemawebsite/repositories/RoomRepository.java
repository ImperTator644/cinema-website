package com.cinema.cinemawebsite.repositories;

import com.cinema.cinemawebsite.entities.Room;
import com.cinema.cinemawebsite.entities.compositeKey.RoomId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RoomRepository extends JpaRepository<Room, RoomId> {

    @Query(nativeQuery = true, value = "SELECT * FROM room r WHERE r.id_cinema=?1 AND r.room_number=?2")
    Room getRoomByIdCinemaAndRoomNumber(Integer idCinema, Integer roomNumber);
}
