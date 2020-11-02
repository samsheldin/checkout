import 'package:cached_network_image/cached_network_image.dart';
import 'package:cart/utils/cart_get_model.dart';
import 'package:cart/utils/colors.dart';
import 'package:cart/utils/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

transparentLoading() {
  Get.dialog(
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(GREEN_COLOR),
            )),
      ],
    ),
    barrierDismissible: true,
  );
}

Widget closeLoading() {
  return Padding(
    padding: const EdgeInsets.only(top: 25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(height: 40, width: 40, child: closeIcon(color: Colors.white)),
      ],
    ),
  );
}

Widget closeIcon({Color color, Function onTap}) {
  return IconButton(
      icon: Icon(Icons.close, color: color ?? ORANGE_COLOR1),
      onPressed: onTap ??
          () {
            Get.close(1);
          });
}

Widget cartTile(Widget child) {
  return Theme(
      data: ThemeData(
        accentColor: Colors.white,
        unselectedWidgetColor: Colors.white,
      ),
      child: Container(color: GREEN_COLOR, child: child));
}

Widget expansionTileInfo(String logo, String title, {String price}) {
  return Row(
    children: [
      if (logo != null && logo.isNotEmpty)
        ClipOval(
            child: CachedNetworkImage(
          imageUrl: logo,
          errorWidget: (context, url, error) => Icon(
            Icons.error,
            size: 30,
          ),
          placeholder: (context, url) => Icon(Icons.ac_unit_outlined),
          height: 40,
          width: 40,
        )),
      const SizedBox(width: 10),
      Flexible(
        child: Text(
          title,
          style: WHITENORMAL16,
        ),
      ),
      if (price != null) Text(price, style: WHITE16BOLD)
    ],
  );
}

Widget productPlaceholderSmall() {
  return Icon(
    Icons.ac_unit,
    size: 100,
  );
 
}

Widget totalprice(List<CartDetails> cartDetails) {
  double price = 0.0;
  for (var i in cartDetails) {
    price = price + double.parse(i.totalPrice ?? 0.0);
  }

  return Text(
    'R' + price.toStringAsFixed(2),
    style: WHITE16BOLD,
  );
}

Widget tile(CartDetails currentStore, List<CartDetails> cartDetails,
    Function callBack) {
  double price = 0.0;
  for (var i in cartDetails) {
    if (i.storeProduct.storeId == currentStore.storeProduct.storeId)
      price = price + double.parse(i.totalPrice ?? 0.0);
  }

  /*  cartDetails.reduce((curr, next) {
    if (curr.storeProduct.storeId == next.storeProduct.storeId)
     return     (double.parse(curr.totalPrice) + double.parse(next.totalPrice));
  }).toString(); */
  /*  cartDetails.fold(0.0, (previousValue, element) {
    return previousValue ?? 0 + (double.parse(currentStore.totalPrice));
  }).toString(); */
  return cartTile(ExpansionTile(
    title: expansionTileInfo(currentStore.storeProduct.store.merchant.logo,
        currentStore.storeProduct.store.name,
        price: 'R' + price.toStringAsFixed(2)),
    children: cartDetails
        .map((e) => e.storeProduct.storeId == currentStore.storeProduct.storeId
            ? TileItem(e, callBack)
            : Container())
        .toList(),
  ));
}

class TileItem extends StatefulWidget {
  final CartDetails item;
  final Function callBack;
  TileItem(this.item, this.callBack);
  @override
  _TileItemState createState() => _TileItemState();
}

class _TileItemState extends State<TileItem> {
  CartDetails item;
  String price;
  String discountPrice;

  @override
  void initState() {
    item = widget.item;
    price = '';
    discountPrice = item.storeProduct.price;
    if (item.storeProduct.discount != null) {
      price = item.storeProduct.price;
      if (item.storeProduct.discountType == '%') {
        discountPrice = (double.parse(item.storeProduct.price) -
                (double.parse(item.storeProduct.price) *
                    (double.parse(item.storeProduct.discount) / 100)))
            .toStringAsFixed(2);
      } else {
        discountPrice = (double.parse(item.storeProduct.price) -
                double.parse(item.storeProduct.discount))
            .toStringAsFixed(2);
      }
    }
    super.initState();
  }

  int flag = 0;
  int value;
  @override
  Widget build(BuildContext context) {
    if (flag == 0) {
      //  setState(() {
      flag = 1;
      //  });
      value = widget.item.quantity;
    }
    return Container(
      key: ValueKey(item.storeProductId.toString() + 'cart'),
      color: white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    height: 43,
                    width: 43,
                    color: Colors.black,
                    child: (item.storeProduct.product.productImages != null &&
                            item.storeProduct.product.productImages.isNotEmpty)
                        ? CachedNetworkImage(
                            //   height: 100,
                            progressIndicatorBuilder:
                                (context, url, progress) =>
                                    productPlaceholderSmall(),
                            fit: BoxFit.cover,
                            imageUrl: item.storeProduct.product
                                    ?.productImages[0].imgUrl ??
                                'https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',
                          )
                        : productPlaceholderSmall(),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.item.storeProduct.product.name ?? '',
                      style: BLACK14BOLD,
                    ),
                    Text(
                      widget.item.storeProduct.product.description,
                      style: GREY14MEDIUM,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        if (price != null && price.isNotEmpty)
                          Text(
                            'R' + price,
                            style: BLACK12MEDIUMSLASH,
                          ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'R' + discountPrice,
                          style: ORANGE12MEDIUM,
                        ),
                        Spacer(),
                        cartButtons(
                            Icon(
                              Icons.delete_forever,
                              color: ORANGE_COLOR1,
                            ), () {
                          widget.callBack(item.storeProductId,
                              widget.item.quantity - widget.item.quantity);
                        }),
                        cartButtons(
                            Icon(Icons.remove_circle_outline,
                                color: GREEN_COLOR), () {
                          setState(() {
                            value--;
                          });
                          widget.callBack(item.storeProductId, value);
                        }),
                        Text(widget.item.quantity.toString()),
                        SizedBox(
                          width: 10,
                        ),
                        cartButtons(
                            Icon(
                              Icons.add_circle_outline,
                              color: GREEN_COLOR,
                            ), () {
                          setState(() {
                            value++;
                          });
                          widget.callBack(item.storeProductId, value);
                        }),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 20),
                  FaIcon(
                    FontAwesomeIcons.edit,
                    size: 18,
                    color:
                        widget.item.notes.isEmpty ? ORANGE_COLOR1 : GREY_COLOR,
                  ),
                  SizedBox(width: 15),
                  Flexible(
                      child: Text('Add notes & preference if item out of stock',
                          style: widget.item.notes.isEmpty
                              ? ORANGE14SEMIBOLD
                              : GREY14SEMIBOLD))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

Widget cartButtons(Widget child, Function callBack) {
  return MaterialButton(
    onPressed: callBack,
    child: child,
    minWidth: 15,
    padding: const EdgeInsets.only(right: 10),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}
