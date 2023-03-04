class ShopCategories {
  ShopCategories({
      this.id, 
      this.title, 
      this.img, 
      this.sort, 
       this.vipProducts,});

  ShopCategories.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    img = json['img'];
    sort = json['sort'];
    if (json['vip_products'] != null) {
      vipProducts = [];
      json['vip_products'].forEach((v) {
        vipProducts?.add(ShopProducts.fromJson(v));
      });
    }
  }
  int? id;
  String? title;
  String? img;
  int? sort;
  List<ShopProducts>? vipProducts;


}

class ShopProducts {
  int? id;
  ShopProducts({
    this.id,
});
   ShopProducts.fromJson(dynamic json) {
     id = json['id'];
  }

}


