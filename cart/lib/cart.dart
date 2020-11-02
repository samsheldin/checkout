import 'package:cart/utils/cart_get_model.dart';
import 'package:cart/utils/colors.dart';
import 'package:cart/utils/transparent_loading.dart';
import 'package:cart/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>( listener: (context, state) {
     /*  if (state.cartError) {
        Get.back();
        Fluttertoast.showToast(
            msg: state.error,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: RED);
      }

      sdsdfsdfsd
      if (state.cartLoading) transparentLoading();
      if (state.cartLoaded) {
        if (Get.isDialogOpen) Get.back();
        Fluttertoast.showToast(
            msg: 'Updated cart',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: GREEN_COLOR);
      } */
    }, builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
            title: Text.rich(
                TextSpan(text: 'My Cart', style: ORANGENORMAL20, children: [
              TextSpan(
                text: ' | ${state.cartDetails.length} items',
                style: BLACK16NORMAL,
              )
            ])),
            elevation: 1,
            titleSpacing: 0,
            leading: closeIcon(),
          ),
          backgroundColor: Color(0xFFFFFFFF),
          body: (state.cartLoading)
              ? Center(child: CircularProgressIndicator())
              : state.cartLoaded
                  ? Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                            
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  //    scrollDirection: Axis.horizontal,
                                  itemCount: state.cartDetails.length,
                                  itemBuilder: (BuildContext ctxt, int index) {
                                    CartDetails currentStore =
                                        state.cartDetails[index];
                                    final previousStore = (index - 1) >= 0
                                        ? state.cartDetails[index - 1]
                                        : null;
                                    final currentMerchantId =
                                        currentStore.storeProduct.store.name;
                                    final previousMerchantId = previousStore !=
                                            null
                                        ? previousStore.storeProduct.store.name
                                        : null;
                                    if (currentMerchantId != previousMerchantId)
                                      return tile(
                                          currentStore, state.cartDetails,
                                          (int productId, int count) {
                                        BlocProvider.of<CartBloc>(context).add(
                                            CartUpdation(productId, count));
                                      });
                                    return Container();
                                  }),
                            ],
                          ),
                        ),
                        if (state.cartDetails.length > 0)
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                            child: ButtonTheme(
                              minWidth: double.infinity,
                              buttonColor: ORANGE_COLOR1,
                              padding: EdgeInsets.fromLTRB(15, 12, 10, 12),
                              child: FlatButton(
                                onPressed: () {
                                  /* Get.to(BlocProvider(
                            create: (context) => Checkout1Cubit(BlocProvider.of<CartBloc>(context))..injectUserDetails(state.cartDetails,userDetails),
                            child: Checkout1Screen())); */
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Checkout',
                                      style: WHITENORMAL16,
                                    ),
                                    totalprice(state.cartDetails)
                                  ],
                                ),
                                color: ORANGE_COLOR1,
                              ),
                            ),
                          ),
                      ],
                    )
                  : state.cartError
                      ? Center(
                          child: FlatButton(
                              onPressed: () {
                                BlocProvider.of<CartBloc>(context)
                                  ..add(FetchCart());
                              },
                              child: Text('Retry')),
                        )
                      : Container());
    });
  }
}
