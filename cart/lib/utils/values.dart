import 'package:cart/utils/colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

const TextStyle ORANGENORMAL20 = TextStyle(
    color: ORANGE_COLOR2, fontSize: 20, fontWeight: FontWeight.normal);

const TextStyle BLACK16NORMAL =
    TextStyle(color: BLACK, fontSize: 16, fontWeight: FontWeight.normal);
const TextStyle BLACK16BOLD =
    TextStyle(color: BLACK, fontSize: 16, fontWeight: FontWeight.bold);
const TextStyle WHITENORMAL16 =
    TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal);
const TextStyle WHITE16BOLD =
    TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
const TextStyle ORANGE16BOLD =
    TextStyle(color: ORANGE_COLOR2, fontSize: 16, fontWeight: FontWeight.bold);

const TextStyle BLACK14NORMAL = TextStyle(color: BLACK,fontSize: 14,fontWeight: FontWeight.normal);
const TextStyle BLACK14BOLD =    TextStyle(color: BLACK,fontSize: 14,fontWeight: FontWeight.bold);
const TextStyle BLACK14BOLD15 =   TextStyle( color: BLACK,fontSize: 14,fontWeight: FontWeight.normal, height: 1.5);

const TextStyle BLACK14SEMIBOLD = TextStyle(color: BLACK, fontSize: 14, fontWeight: FontWeight.w600);
const TextStyle ORANGE14NORMAL = TextStyle( color: ORANGE_COLOR2, fontSize: 14, fontWeight: FontWeight.normal);
const TextStyle ORANGE14MEDIUM = TextStyle(color: ORANGE_COLOR2, fontSize: 14, fontWeight: FontWeight.w500);
const TextStyle ORANGE14BOLD =    TextStyle(color: ORANGE_COLOR2, fontSize: 14, fontWeight: FontWeight.bold);
const TextStyle ORANGE14BOLD15 =    TextStyle(color: ORANGE_COLOR2, fontSize: 14, fontWeight: FontWeight.bold,height: 1.5);
const TextStyle ORANGE14SEMIBOLD = TextStyle(color: ORANGE_COLOR2, fontSize: 14, fontWeight: FontWeight.w600);
const TextStyle WHITE14NORMAL = TextStyle( color: Color(0xffFFFFFF), fontSize: 14, fontWeight: FontWeight.normal);
const TextStyle WHITE14MEDIUM = TextStyle(color: Color(0xffFFFFFF), fontSize: 14, fontWeight: FontWeight.w500);
const TextStyle WHITE14BOLD = TextStyle(color: Color(0xffFFFFFF), fontSize: 14, fontWeight: FontWeight.bold);
const TextStyle WHITE14SEMIBOLD = TextStyle(color: Color(0xffFFFFFF), fontSize: 14, fontWeight: FontWeight.w600);
const TextStyle GREY14MEDIUM =TextStyle(color: GREY_COLOR, fontSize: 14, fontWeight: FontWeight.w500);
const TextStyle GREY14NORMAL = TextStyle(color: GREY_COLOR, fontSize: 14, fontWeight: FontWeight.normal);
const TextStyle GREY14BOLD =    TextStyle(color: GREY_COLOR, fontSize: 14, fontWeight: FontWeight.bold);
const TextStyle GREY14BOLD15 =    TextStyle(color: GREY_COLOR, fontSize: 14, fontWeight: FontWeight.bold,height: 1.5);
const TextStyle GREY14SEMIBOLD =
    TextStyle(color: GREY_COLOR, fontSize: 14, fontWeight: FontWeight.w600);
const TextStyle GREEN14BOLD =
    TextStyle(color: GREEN_COLOR, fontSize: 14, fontWeight: FontWeight.bold);
const TextStyle GREEN14MEDIUM =
    TextStyle(color: GREEN_COLOR, fontSize: 14, fontWeight: FontWeight.w500);
const TextStyle RED14MEDIUM =
    TextStyle(color: RED, fontSize: 14, fontWeight: FontWeight.w500);
const TextStyle YELLOW14BOLD =
    TextStyle(color: YELLOW, fontSize: 14, fontWeight: FontWeight.bold);
const TextStyle BLUE14BOLD =
    TextStyle(color: BLUE, fontSize: 14, fontWeight: FontWeight.bold);

const TextStyle BLACK12BOLD =
    TextStyle(color: BLACK, fontSize: 12, fontWeight: FontWeight.bold);
const TextStyle BLACK12NORMAL =
    TextStyle(color: BLACK, fontSize: 12, fontWeight: FontWeight.normal);
const TextStyle BLACK12MEDIUMSLASH = TextStyle(
    color: BLACK,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    decorationColor: ORANGE_COLOR2,
    decorationThickness: 2,
    decoration: TextDecoration.lineThrough);
const TextStyle BLACK12MEDIUMHEIGHT = TextStyle(
    color: BLACK, fontSize: 12, fontWeight: FontWeight.w500, height: 2);
const TextStyle BLACK12MEDIUM = TextStyle(
  color: BLACK,
  fontSize: 12,
  fontWeight: FontWeight.w500,
);
const TextStyle ORANGE12MEDIUM =
    TextStyle(color: ORANGE_COLOR2, fontSize: 12, fontWeight: FontWeight.w500);
const TextStyle ORANGE12REGULAR =
    TextStyle(color: ORANGE_COLOR2, fontSize: 12, fontWeight: FontWeight.w400);
const TextStyle ORANGE12SEMIBOLD =
    TextStyle(color: ORANGE_COLOR2, fontSize: 12, fontWeight: FontWeight.w600);
const TextStyle ORANGE12BOLD =
    TextStyle(color: ORANGE_COLOR2, fontSize: 12, fontWeight: FontWeight.bold);
const TextStyle WHITE12NORMAL = TextStyle(
    color: Color(0xffFFFFFF), fontSize: 12, fontWeight: FontWeight.normal);
const TextStyle WHITE12SEMIBOLD = TextStyle(
    color: Color(0xffFFFFFF), fontSize: 12, fontWeight: FontWeight.w600);
const TextStyle GREEN12SEMIBOLD =
    TextStyle(color: GREEN_COLOR, fontSize: 12, fontWeight: FontWeight.w600);
const TextStyle GREY12NORMAL =
    TextStyle(color: GREY_COLOR, fontSize: 12, fontWeight: FontWeight.normal);
const TextStyle GREY12MEDIUM =
    TextStyle(color: GREY_COLOR, fontSize: 12, fontWeight: FontWeight.w500);

const TextStyle GREY11NORMAL =
    TextStyle(color: GREY_COLOR, fontSize: 11, fontWeight: FontWeight.normal);
const TextStyle GREY11NORMALCUT = TextStyle(
    color: GREY_COLOR,
    fontSize: 11,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.lineThrough,
    decorationColor: ORANGE_COLOR2,
    decorationThickness: 5);


String cartDetails;
String categoriesList = 'categories_list';
String categoryItem = 'category_item';
String productsListBloc = 'products_list_bloc';
const String USERID = 'uid';
const String FIREBASEUSERID = 'firebase_uid';
const String REFFERALCODE = 'refferal_code';
BaseOptions options = BaseOptions(
  headers: {
  'Cache-Control': 'no cache',
},
);


final dioInstance = Dio(options);