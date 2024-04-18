package org.example.ecommerse456.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BasketProduct {
    private Integer basketId;
    private Integer productId;
    private Integer amount;
}

