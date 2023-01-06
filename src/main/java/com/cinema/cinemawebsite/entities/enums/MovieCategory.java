package com.cinema.cinemawebsite.entities.enums;

public enum MovieCategory {
    AKCJA("AKCJA"),
    DOKUMENT("DOKUMENT"),
    PRZYGODA("PRZYGODA"),
    HORROR("HORROR"),
    KOMEDIA("KOMEDIA"),
    KRYMINAL("KRYMINAŁ"),
    DRAMAT("DRAMAT"),
    SCIENCE_FICTION("SCIENCE-FICTION");

    public final String category;
    MovieCategory(String category) {
        this.category = category;
    }
}
