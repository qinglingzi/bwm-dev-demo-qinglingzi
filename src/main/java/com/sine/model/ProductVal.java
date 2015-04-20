package com.sine.model;

import java.util.ArrayList;
import java.util.List;

public class ProductVal {
  private List<ProductItem> items = new ArrayList<ProductItem>();
  private ProductDto productDto;
  private List<ProductSku> skuModel = new ArrayList<ProductSku>();

  public List<ProductItem> getItems() {
    return items;
  }

  public void setItems(List<ProductItem> items) {
    this.items = items;
  }

  public ProductDto getProductDto() {
    return productDto;
  }

  public void setProductDto(ProductDto productDto) {
    this.productDto = productDto;
  }

  public List<ProductSku> getSkuModel() {
    return skuModel;
  }

  public void setSkuModel(List<ProductSku> skuModel) {
    this.skuModel = skuModel;
  }

}
