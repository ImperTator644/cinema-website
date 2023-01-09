package com.cinema.cinemawebsite.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@NoArgsConstructor
public class ClientDto {
    @NotNull(message = "Name is null")
    @NotBlank(message = "Name is blank")
    private String name;
    @NotNull(message = "Surname filed is null")
    @NotBlank(message = "Surname is blank")
    private String surname;
    private String phoneNumber;
    @NotNull
    @Email
    private String email;
    @NotNull(message = "Date is null")
    @NotBlank(message = "Date is blank")
    private String dateOfBirth;
    @NotNull(message = "Password is null")
    @NotBlank(message = "Password is blank")
    private String password;
}
