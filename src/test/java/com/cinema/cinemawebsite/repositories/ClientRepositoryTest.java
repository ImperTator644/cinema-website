package com.cinema.cinemawebsite.repositories;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.jupiter.api.Assertions.*;

@RunWith(SpringRunner.class)
@SpringBootTest
class ClientRepositoryTest {

    @Autowired
    private ClientRepository clientRepository;

    @Test
    public void shouldReturnCorrectClient(){
        assertEquals(clientRepository.getClientByEmail("lukasz.blicharz@student.pk.edu.pl").getId(), 6);
        assertEquals(clientRepository.getClientByEmail("konrad.kczynski@student.pk.edu.pl").getId(), 7);
    }

    @Test
    public void shouldReturnNothing(){
        assertNull(clientRepository.getClientByEmail("nothing@email.com"));
    }
}