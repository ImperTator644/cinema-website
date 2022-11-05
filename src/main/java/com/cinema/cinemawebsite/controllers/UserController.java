package com.cinema.cinemawebsite.controllers;

import com.cinema.cinemawebsite.entities.User;
import com.cinema.cinemawebsite.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(path="/demo")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @PostMapping(path="/add")
    public @ResponseBody String addNewUser(@RequestParam String email, @RequestParam String password){
        User user = new User(email, password);
        userRepository.save(user);
        return user + " saved";
    }

    @GetMapping(path="all")
    public @ResponseBody Iterable<User> getUsers(){
        return userRepository.findAll();
    }
}
