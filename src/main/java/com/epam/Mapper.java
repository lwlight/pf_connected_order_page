package com.epam;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;

public class Mapper {
    private static final String SFID_COLUMN = "SFID";
    private static final String NAME_COLUMN = "Name";
    
    static final RowMapper<Dish> DISH_ROW_MAPPER = (ResultSet resultSet, int rowNum) -> {
        String id = resultSet.getString(SFID_COLUMN);
        String name = resultSet.getString(NAME_COLUMN);
        Dish dish = new Dish(id, name);

        return dish;
    };
}
