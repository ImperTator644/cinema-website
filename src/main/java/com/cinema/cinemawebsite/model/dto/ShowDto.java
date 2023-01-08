package com.cinema.cinemawebsite.model.dto;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@NoArgsConstructor
public class ShowDto {

    @NotNull(message = "Title is null")
    @NotBlank(message = "Title is blank")
    private String title;

    @NotNull(message = "Soundtrack is null")
    @NotBlank(message = "Soundtrack is blank")
    private String soundtrack;
}
