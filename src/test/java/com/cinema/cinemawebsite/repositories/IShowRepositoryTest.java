package com.cinema.cinemawebsite.repositories;

import com.cinema.cinemawebsite.entities.IShow;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@RunWith(SpringRunner.class)
@SpringBootTest
class IShowRepositoryTest {
    @Autowired
    private IShowRepository iShowRepository;

    @Test
    void shouldReturnNull(){
        assertEquals(Collections.EMPTY_LIST, iShowRepository.checkIfishowCanBeAdded("Sunnyvale", "Trailer park", 1, Date.valueOf("2022-12-10"), Time.valueOf("23:06:00")));
    }

    @Test
    void shouldReturnList(){
        assertNotEquals(Collections.EMPTY_LIST, iShowRepository.checkIfishowCanBeAdded("Trailer park", "Sunnyvale", 1, Date.valueOf("2022-12-10"), Time.valueOf("13:00:00")));
    }

    @Test
    void shouldiShowsList(){
        assertNotEquals(Collections.EMPTY_LIST, iShowRepository.getiShowsFromCinema("Trailer park", "Sunnyvale"));
    }
}