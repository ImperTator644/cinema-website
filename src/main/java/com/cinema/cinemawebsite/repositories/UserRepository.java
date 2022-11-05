package com.cinema.cinemawebsite.repositories;

import com.cinema.cinemawebsite.entities.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Integer> {
}
