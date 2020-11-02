import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:cart/utils/json.dart';

import '../utils/cart_get_model.dart';
import 'bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState.uninitialized());
  /*  @override
  Stream<Transition<CartEvent, CartState>> transformEvents(
    Stream<CartEvent> events,
    TransitionFunction<CartEvent, CartState> transitionFn,
  ) {
    final debounced = events
        .where((event) => event is CartUpdation)
        .debounceTime(const Duration(milliseconds: 300));
    return events
        .where((event) => event is! CartUpdation)
        .mergeWith([debounced]).switchMap(transitionFn);
  }
 */
  @override
  Stream<CartState> mapEventToState(event) async* {
    if (event is FetchCart) {
      try {
        yield state.update(
            cartError: false, cartLoaded: false, cartLoading: true);
        List<CartDetails> cartDetails = await _fetchCart();
        yield state.update(
            cartDetails: cartDetails,
            cartLoading: false,
            cartLoaded: true,
            isLoaded: true);
      } catch (e) {
        yield state.update(
            cartLoading: false,
            cartError: true,
            cartLoaded: false,
            error: e.toString());
      }
    }
    if (event is InjectCartItems) {
      yield state.update(cartDetails: event.cartDetails, isLoaded: true);
    }
    if (event is CartUpdation) {
      try {
        /*   yield state.update(
            cartError: false, cartLoaded: false, cartLoading: true);
        print(event.quantity.toString());
        List<CartDetails> cartDetails = event.quantity > 0
            ? await postCart(event.productId, event.quantity)
            : await removeFromCart(
                event.productId, state.cartDetails[0].cartId);
        cartDetails.sort((a, b) {
          return a.storeProduct.store.id.compareTo(b.storeProduct.store.id);
        });

        yield state.update(
            cartDetails: cartDetails,
            cartLoading: false,
            cartLoaded: true,
            isLoaded: true);
        yield state.update(cartLoaded: false, isLoaded: false); */
      } catch (e) {
        yield state.update(
            cartLoading: false,
            cartError: true,
            cartLoaded: false,
            error: e.toString());
        yield state.update(cartError: false);
      }
    }
  }

/* Future<List<CartDetails>> postCart(int productId, int count,
    {String notes, String outOfStock, int outOfStockStoreProductId}) async {
  

  
      await dioInstance.post('/user/cart', queryParameters: {
    'addressId': prefs.getString('addressid'),
    'userId': prefs.getString(USERID) ?? prefs.getString(FIREBASEUSERID),
    //   'cartId': prefs.getString('cartid') ?? tempUid
  }, data: [
    CartPost(
            notes: notes ?? '',
            outOfStock: outOfStock ?? 'r',
            outOfStockStoreProductId: outOfStockStoreProductId,
            quantity: count,
            storeProductId: productId)
        .toJson()
  ]);
  if (response.statusCode == 200) {
    if (prefs.getString('cartid') == null) {
      prefs.setString('cartid', tempUid);
    }
    final cart = json.decode(response.data);
    List<CartDetails> cartDetails =
        List<CartDetails>.from(cart['cartDetails'].map((rawPost) {
      return CartDetails.fromJson(rawPost);
    }));
    return cartDetails;
  } else {
    throw Exception('error fetching posts');
  }
}Future<List<CartDetails>> postCartDuringLogin(List<CartDetails> cartDetails,String userId) async {

  
  final Response<String> response =
      await dioInstance.post('/user/cart', queryParameters: {
    'addressId': prefs.getString('addressid'),
    'userId':userId,
    //   'cartId': prefs.getString('cartid') ?? tempUid
  }, data: 
    cartDetails.map((e) => e.toJson()).toList()
 
  );
  if (response.statusCode == 200) {
    final cart = json.decode(response.data);
    List<CartDetails> cartDetails =
        List<CartDetails>.from(cart['cartDetails'].map((rawPost) {
      return CartDetails.fromJson(rawPost);
    }));
    return cartDetails;
  } else {
    throw Exception('error fetching posts');
  }
} */

/*   Future<List<CartDetails>> _fetchProducts() async {
    final Response<String> response = await dioInstance.get(
      '/user/cart',
      queryParameters: {
        "userId": 'TsWUIMtnClMVGxQ1vjaU4VnW5nT2',
        'addressId': '58732bc1-117f-4295-8faf-29a16d8fba39',
      },
    );
    if (response.statusCode == 200) {
      final cart = json.decode(response.data);
      List<CartDetails> cartDetails =
          List<CartDetails>.from(cart['cartDetails'].map((rawPost) {
        return CartDetails.fromJson(rawPost);
      }));
      return cartDetails;
    } else {
      throw Exception('error fetching posts');
    }
  } */

  Future<List<CartDetails>> _fetchCart() async {
    final cart = json.decode(jsonS);
    List<CartDetails> cartDetails =
        List<CartDetails>.from(cart['cartDetails'].map((rawPost) {
      return CartDetails.fromJson(rawPost);
    }));
    return cartDetails;
  }
}
