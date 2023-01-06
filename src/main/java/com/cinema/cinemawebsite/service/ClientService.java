package com.cinema.cinemawebsite.service;

import com.cinema.cinemawebsite.entities.Client;
import com.cinema.cinemawebsite.repositories.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;

@Service
public class ClientService {
    @Autowired
    private ClientRepository clientRepository;
    public boolean addClient(String name,
                          String surname,
                          String phoneNumber,
                          String email,
                          String dateOfBirth,
                          String password)
    {
        Date date = Date.valueOf(dateOfBirth);
        if(clientRepository.getClientByEmail(email) != null){
            return false;
        }
        clientRepository.addClient(name, surname, phoneNumber, email, date, password);
        return true;
    }
    public Iterable<Client> getClients(){
        return clientRepository.findAll();
    }

    public boolean deleteClient(String email){
        if(clientRepository.getClientByEmail(email) == null){
            return false;
        }
        clientRepository.deleteClient(email);
        return true;
    }
}
