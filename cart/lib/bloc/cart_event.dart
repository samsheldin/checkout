import 'package:cart/utils/cart_get_model.dart';
import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchCart extends CartEvent {
  FetchCart();
  @override
  List<Object> get props => [];
}

class InjectCartItems extends CartEvent {
  final List<CartDetails> cartDetails;
  InjectCartItems(this.cartDetails);
  @override
  List<Object> get props => [cartDetails];
}

class CartUpdation extends CartEvent {
  final int productId;
  final int quantity;
  CartUpdation(this.productId,this.quantity);
  @override
  List<Object> get props => [productId,quantity];
}