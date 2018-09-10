package com.epam;

import java.io.Serializable;
import java.util.Objects;

public class Dish implements Serializable {
    private String id;
    private String name;

    public Dish() {
    }

    public Dish(String id, String name) {
        this.id = id;
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Dish dish = (Dish) o;
        return Objects.equals(id, dish.id) &&
                Objects.equals(name, dish.name);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name);
    }
}
