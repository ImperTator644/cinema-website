package com.cinema.cinemawebsite.service;

import com.cinema.cinemawebsite.model.dto.ClientDto;
import com.cinema.cinemawebsite.entities.Client;
import com.cinema.cinemawebsite.repositories.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;

@Service
public class ClientService {
    @Autowired
    private ClientRepository clientRepository;
    public boolean addClient(ClientDto clientDto) {
        Date date = Date.valueOf(clientDto.getDateOfBirth());
        if(clientRepository.getClientByEmail(clientDto.getEmail()) != null){
            return false;
        }
        clientRepository.addClient(clientDto.getName(), clientDto.getSurname(), clientDto.getPhoneNumber(), clientDto.getEmail(), date, clientDto.getPassword());
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
