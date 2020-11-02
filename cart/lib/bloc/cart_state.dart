import 'package:cart/utils/cart_get_model.dart';
import 'package:flutter/material.dart';

@immutable
class CartState {
  final bool isLoading;
  final bool isError;
  final bool isLoaded;
  final bool cartError;
  final bool cartLoaded;
  final bool cartLoading;
  final String error;
  final List<CartDetails> cartDetails;

  CartState({
    @required this.isLoading,
    @required this.isError,
    @required this.isLoaded,
    @required this.cartError,
    @required this.cartLoaded,
    @required this.cartLoading,
    this.error,
    @required this.cartDetails,
  });

  factory CartState.uninitialized() {
    return CartState(
      isError: false,
      isLoading: false,
      isLoaded: false,
      cartError: false,
      cartLoaded: false,
      cartLoading: false,
      error: '',
      cartDetails: [],
    );
  }

  CartState update(
      {bool isError,
      bool isLoading,
      bool isLoaded,
      bool cartError,
      bool cartLoaded,
      bool cartLoading,
      String error,
      List<CartDetails> cartDetails}) {
    return copyWith(
      isError: isError,
      isLoading: isLoading,
      isLoaded: isLoaded,
      cartError: cartError,
      cartLoaded: cartLoaded,
      cartLoading: cartLoading,
      error: error,
      cartDetails: cartDetails,
    );
  }

  CartState copyWith({
    bool isError,
    bool isLoading,
    bool isLoaded,
    bool cartError,
    bool cartLoaded,
    bool cartLoading,
    String error,
    List<CartDetails> cartDetails,
  }) {
    return CartState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      cartError: cartError ?? this.cartError,
      cartLoaded: cartLoaded ?? this.cartLoaded,
      cartLoading: cartLoading ?? this.cartLoading,
      error: error ?? this.error,
      cartDetails: cartDetails ?? this.cartDetails,
    );
  }
}
