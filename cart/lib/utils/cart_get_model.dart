class CartModel {
  String id;
  bool isClosed;
  String userId;
  String addressId;
  String createdAt;
  String updatedAt;
  String deletedAt;
  //List<Null> vouchers;
  List<CartDetails> cartDetails;

  CartModel(
      {this.id,
      this.isClosed,
      this.userId,
      this.addressId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
    //  this.vouchers,
      this.cartDetails});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isClosed = json['isClosed'];
    userId = json['userId'];
    addressId = json['addressId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    // if (json['vouchers'] != null) {
    //   vouchers = new List<Null>();
    //   json['vouchers'].forEach((v) {
    //     vouchers.add(new Null.fromJson(v));
    //   });
    // }
    if (json['cartDetails'] != null) {
      cartDetails = new List<CartDetails>();
      json['cartDetails'].forEach((v) {
        cartDetails.add(new CartDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isClosed'] = this.isClosed;
    data['userId'] = this.userId;
    data['addressId'] = this.addressId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    // if (this.vouchers != null) {
    //   data['vouchers'] = this.vouchers.map((v) => v.toJson()).toList();
    // }
    if (this.cartDetails != null) {
      data['cartDetails'] = this.cartDetails.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartDetails {
  String cartId;
  int storeProductId;
  int quantity;
  int suppliedQuantity;
  String totalPrice;
  String shopperPrice;
  String notes;
  String outOfStock;
  String createdAt;
  String updatedAt;
  String deletedAt;
  int outOfStockStoreProductId;
  StoreProduct storeProduct;

  CartDetails(
      {this.cartId,
      this.storeProductId,
      this.quantity,
      this.suppliedQuantity,
      this.totalPrice,
      this.shopperPrice,
      this.notes,
      this.outOfStock,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.outOfStockStoreProductId,
      this.storeProduct});

  CartDetails.fromJson(Map<String, dynamic> json) {
    cartId = json['cartId'];
    storeProductId = json['storeProductId'];
    quantity = json['quantity'];
    suppliedQuantity = json['supplied_quantity'];
    totalPrice = json['total_price'];
    shopperPrice = json['shopper_price'];
    notes = json['notes'];
    outOfStock = json['outOfStock'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    outOfStockStoreProductId = json['outOfStockStoreProductId'];
    storeProduct = json['storeProduct'] != null
        ? new StoreProduct.fromJson(json['storeProduct'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartId'] = this.cartId;
    data['storeProductId'] = this.storeProductId;
    data['quantity'] = this.quantity;
    data['supplied_quantity'] = this.suppliedQuantity;
    data['total_price'] = this.totalPrice;
    data['shopper_price'] = this.shopperPrice;
    data['notes'] = this.notes;
    data['outOfStock'] = this.outOfStock;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['outOfStockStoreProductId'] = this.outOfStockStoreProductId;
    if (this.storeProduct != null) {
      data['storeProduct'] = this.storeProduct.toJson();
    }
    return data;
  }
}

class StoreProduct {
  int id;
  String productId;
  String storeId;
  String price;
  String discountType;
  String discount;
  String discountStart;
  String discountEnd;
  bool isVisible;
  bool storeFront;
  String createdAt;
  String updatedAt;
  String unitId;
  Product product;
 // String unit;
  Store store;

  StoreProduct(
      {this.id,
      this.productId,
      this.storeId,
      this.price,
      this.discountType,
      this.discount,
      this.discountStart,
      this.discountEnd,
      this.isVisible,
      this.storeFront,
      this.createdAt,
      this.updatedAt,
      this.unitId,
      this.product,
  //    this.unit,
      this.store});

  StoreProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    storeId = json['storeId'];
    price = json['price'];
    discountType = json['discountType'];
    discount = json['discount'];
    discountStart = json['discountStart'];
    discountEnd = json['discountEnd'];
    isVisible = json['isVisible'];
    storeFront = json['storeFront'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    unitId = json['unitId'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  //  unit = json['unit'];
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productId'] = this.productId;
    data['storeId'] = this.storeId;
    data['price'] = this.price;
    data['discountType'] = this.discountType;
    data['discount'] = this.discount;
    data['discountStart'] = this.discountStart;
    data['discountEnd'] = this.discountEnd;
    data['isVisible'] = this.isVisible;
    data['storeFront'] = this.storeFront;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['unitId'] = this.unitId;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
  //  data['unit'] = this.unit;
    if (this.store != null) {
      data['store'] = this.store.toJson();
    }
    return data;
  }
}

class Product {
  String id;
  String name;
  String tagline;
  String description;
  String createdAt;
  String updatedAt;
  String deletedAt;
  List<ProductImages> productImages;

  Product(
      {this.id,
      this.name,
      this.tagline,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.productImages});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tagline = json['tagline'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    if (json['productImages'] != null) {
      productImages = new List<ProductImages>();
      json['productImages'].forEach((v) {
        productImages.add(new ProductImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['tagline'] = this.tagline;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    if (this.productImages != null) {
      data['productImages'] =
          this.productImages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductImages {
  int id;
  String imgUrl;
  String createdAt;
  String updatedAt;
  String deletedAt;
  String productId;

  ProductImages(
      {this.id,
      this.imgUrl,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.productId});

  ProductImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgUrl = json['img_url'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img_url'] = this.imgUrl;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['productId'] = this.productId;
    return data;
  }
}

class Store {
  String id;
  String name;
  String description;
  Location location;
  String fullAddress;
  String suburb;
  String city;
  bool isClosed;
  String createdAt;
  String updatedAt;
  String deletedAt;
  String merchantId;
  Merchant merchant;

  Store(
      {this.id,
      this.name,
      this.description,
      this.location,
      this.fullAddress,
      this.suburb,
      this.city,
      this.isClosed,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.merchantId,
      this.merchant});

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    fullAddress = json['full_address'];
    suburb = json['suburb'];
    city = json['city'];
    isClosed = json['isClosed'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    merchantId = json['merchantId'];
    merchant = json['merchant'] != null
        ? new Merchant.fromJson(json['merchant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['full_address'] = this.fullAddress;
    data['suburb'] = this.suburb;
    data['city'] = this.city;
    data['isClosed'] = this.isClosed;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['merchantId'] = this.merchantId;
    if (this.merchant != null) {
      data['merchant'] = this.merchant.toJson();
    }
    return data;
  }
}

class Location {
  String type;
  List<double> coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Merchant {
  String id;
  String name;
  String description;
  String logo;
  bool visible;
  String createdAt;
  String updatedAt;
  String deletedAt;

  Merchant(
      {this.id,
      this.name,
      this.description,
      this.logo,
      this.visible,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Merchant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    logo = json['logo'];
    visible = json['visible'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['logo'] = this.logo;
    data['visible'] = this.visible;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    return data;
  }
}