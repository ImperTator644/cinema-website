package com.cinema.cinemawebsite.entities.enums;

public enum SoundtrackType {
    NAPISY("NAPISY"),
    DUBBING("DUBBING"),
    LEKTOR_PL("LEKTOR_PL");

    public final String type;
    SoundtrackType(String type) {
        this.type = type;
    }
}
