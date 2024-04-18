package org.example.ecommerse456.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.ecommerse456.repo.CategoryRepo;
import org.example.ecommerse456.repo.ProductRepo;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    private Integer id;
    private String name;
    private Integer price;
    private Integer categoryId;
    private String photo;


    public String getCategoryName(){
        Category byId = CategoryRepo.findById(categoryId);
        return byId.getName();
    }



}
