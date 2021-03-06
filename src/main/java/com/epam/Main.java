package com.epam;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.List;

@Controller
@SpringBootApplication
public class Main {

  private static final String MESSAGE_ATTRIBUTE_NAME = "message";
  private static final String MESSAGE = "Your order was successfully sent";

  @Value("${spring.datasource.url}")
  private String dbUrl;

  private static final String READ_ALL_DISHES = "SELECT SFID, Name FROM salesforce.Dish__c";

  public static void main(String[] args) throws Exception {
    SpringApplication.run(Main.class, args);
  }

  @RequestMapping("/")
  String index(@ModelAttribute("model") ModelMap model) throws SQLException {
    JdbcTemplate template = jdbcTemplate(hikariDataSource());
    List<Dish> dishes = template.query(READ_ALL_DISHES, Mapper.DISH_ROW_MAPPER);
    model.addAttribute("dishes", dishes);
    return "index";
  }

  @RequestMapping("/thanks")
  String thanks(@ModelAttribute("model") ModelMap model) throws SQLException {
    removeMessage(model);
    model.addAttribute(MESSAGE_ATTRIBUTE_NAME, MESSAGE);
    return index(model);
  }

  private void removeMessage(@ModelAttribute("model") ModelMap model) {
    if(model.containsAttribute(MESSAGE_ATTRIBUTE_NAME)){
      model.remove(MESSAGE_ATTRIBUTE_NAME);
    }
  }

  @Bean
  public DataSource hikariDataSource() throws SQLException {
    if (dbUrl == null || dbUrl.isEmpty()) {
      return new HikariDataSource();
    } else {
      HikariConfig config = new HikariConfig();
      config.setJdbcUrl(dbUrl);
      return new HikariDataSource(config);
    }
  }

  @Bean
  public JdbcTemplate jdbcTemplate(DataSource hikariDataSource){
    return new JdbcTemplate(hikariDataSource);
  }

}
