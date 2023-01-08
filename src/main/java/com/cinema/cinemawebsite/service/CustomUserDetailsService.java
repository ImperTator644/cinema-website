package com.cinema.cinemawebsite.service;

import com.cinema.cinemawebsite.entities.Client;
import com.cinema.cinemawebsite.model.CustomUserDetails;
import com.cinema.cinemawebsite.repositories.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private CustomUserDetails customUserDetails;

    public CustomUserDetailsService(){}

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Client user = clientRepository.getClientByEmail(email);
        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }
        customUserDetails.setClient(user);
        return customUserDetails;
    }
}
