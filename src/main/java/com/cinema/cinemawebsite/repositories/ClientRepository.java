package com.cinema.cinemawebsite.repositories;

import com.cinema.cinemawebsite.entities.Client;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.stereotype.Repository;

import java.sql.Date;

@Repository
public interface ClientRepository extends JpaRepository<Client, Integer> {
    @Procedure
    void addClient(String name,
                   String surname,
                   String phoneNumber,
                   String email,
                   Date dateOfBirth,
                   String password);

    @Procedure
    void deleteClient(String email);

    @Query( value = "SELECT * FROM cinema.client c WHERE c.email = ?1", nativeQuery = true)
    Client getClientByEmail(String email);

    @Query(value = "SELECT pd.password FROM personal_data pd NATURAL JOIN client c WHERE c.email = ?1", nativeQuery = true)
    String getPasswordByEmail(String email);

    @Query(value = "SELECT CONCAT(pd.name,' ',pd.surname) FROM personal_data pd NATURAL JOIN client c WHERE c.email = ?1", nativeQuery = true)
    String getFullNameByEmail(String email);
}
