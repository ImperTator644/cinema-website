package com.cinema.cinemawebsite.helpers;

import com.cinema.cinemawebsite.entities.enums.MovieCategory;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

@RunWith(SpringRunner.class)
@SpringBootTest
class CategoryStringToEnumConverterTest {

    private CategoryStringToEnumConverter categoryStringToEnumConverter;

    @BeforeEach
    void setUp() {
        categoryStringToEnumConverter = new CategoryStringToEnumConverter();
    }

    @Test
    void shouldReturnAkcja(){
        assertEquals(categoryStringToEnumConverter.convert("akcja"), MovieCategory.AKCJA);
    }

    @Test
    void shouldReturnThrowException(){
        assertThrows(java.lang.IllegalArgumentException.class, () -> categoryStringToEnumConverter.convert("asdghj"));
    }
}