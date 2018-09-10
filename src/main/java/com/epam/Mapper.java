package com.epam;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;

public class Mapper {
    static final RowMapper<Dish> DISH_ROW_MAPPER = (ResultSet resultSet, int rowNum) -> {
        String id = resultSet.getString("Id");
        String name = resultSet.getString("Name");
        Dish dish = new Dish(id, name);

        return dish;
    };
}
