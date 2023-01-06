package com.cinema.cinemawebsite.controllers;

import com.cinema.cinemawebsite.entities.Client;
import com.cinema.cinemawebsite.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class ClientController {

    private static final String NAME = "name";
    private static final String SURNAME = "surname";
    private static final String EMAIL = "email";
    private static final String BIRTH_DATE = "date_of_birth";
    private static final String PHONE = "phone_number";
    private static final String PASSWORD = "password";

    @Autowired
    private ClientService clientService;

    @PostMapping(path="addClient")
    @ResponseBody
    public Boolean addClient(@RequestParam(NAME) String name,
                          @RequestParam(SURNAME) String surname,
                          @RequestParam(PHONE) String phone,
                          @RequestParam(EMAIL) String email,
                          @RequestParam(BIRTH_DATE) String birthDate,
                          @RequestParam(PASSWORD) String password){
        return clientService.addClient(name, surname, phone, email, birthDate, password);
    }

    @GetMapping(path="listClients")
    public @ResponseBody Iterable<Client> listClients(){
        return clientService.getClients();
    }

    @PostMapping(path="deleteClient")
    @ResponseBody
    public Boolean deleteClient(@RequestParam(EMAIL) String email){
        return clientService.deleteClient(email);
    }
}
