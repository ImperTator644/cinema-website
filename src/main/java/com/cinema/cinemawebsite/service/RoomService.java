package com.cinema.cinemawebsite.service;

import com.cinema.cinemawebsite.entities.Room;
import com.cinema.cinemawebsite.repositories.RoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

@Service
public class RoomService {
    @Autowired
    private RoomRepository roomRepository;
    @Autowired
    private ReserveService reserveService;

    public Room getRoomByIdCinemaAndRoomNumber(Integer idCinema, Integer roomNumber) {
        return roomRepository.getRoomByIdCinemaAndRoomNumber(idCinema, roomNumber);
    }

    public List<Integer> getRowsList(Room room) {
        List<Integer> list = new LinkedList<>();
        for (int i = 1; i <= room.getRowCount(); i++) {
            list.add(i);
        }
        return list;
    }

    public List<Integer> getSeatList(Room room) {
        List<Integer> list = new LinkedList<>();
        int seatsInRow = room.getSeatCount() / room.getRowCount();
        for (int i = 1; i <= seatsInRow; i++) {
            list.add(i);
        }
        return list;
    }
}
