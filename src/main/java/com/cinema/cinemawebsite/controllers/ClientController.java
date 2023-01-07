package com.cinema.cinemawebsite.controllers;

import com.cinema.cinemawebsite.model.dto.ClientDto;
import com.cinema.cinemawebsite.entities.Client;
import com.cinema.cinemawebsite.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
public class ClientController {
    private static final String EMAIL = "email";

    @Autowired
    private ClientService clientService;

    @PostMapping(path = "client")
    @ResponseBody
    public boolean addClient(@Valid @RequestBody ClientDto clientDto){
        return clientService.addClient(clientDto);
    }

    @GetMapping(path="client")
    public @ResponseBody Iterable<Client> listClients(){
        return clientService.getClients();
    }

    @DeleteMapping(path="client")
    @ResponseBody
    public Boolean deleteClient(@RequestParam(EMAIL) String email){
        return clientService.deleteClient(email);
    }
}
