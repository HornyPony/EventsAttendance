import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTheme {
  static ThemeData lightTheme() => ThemeData(
        fontFamily: 'Inter',
        primaryColor: primaryColor,

        scaffoldBackgroundColor: scaffoldBackgroundColor,
        canvasColor: background2,
        textTheme: TextTheme(
          displayLarge: darkBlueTextStyle400,
          displayMedium: darkBlueTextStyle500,
          displaySmall: darkBlueTextStyle600,
          headlineMedium: darkBlueTextStyle700,
          headlineSmall: greyTextStyle400,
          titleLarge: primaryColorTextStyle500,
          bodyLarge: textFieldLabelStyle,
          bodyMedium: bodyText2,
          labelLarge: buttonText,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: darkBlueSecondaryColor,
          primary: darkBlueSecondaryColor,
        ),
      );

  static const regularDark = Color(0xff000000);
  static const regularGrey = Color(0x80000000);
  static const background2 = Color(0xffF4F5F7);
  static const greyDividerTextColor = Color(0xFFECECEC);
  static const greyColor = Color(0xFF808080);
  static const filterBtnsColor = Color(0xFFE6E6E6);
  static const orangeColor = Color(0xFFFF7C33);
  static const darkBlueColor = Color(0xFF001D38);
  static const lightRedErrorColor =  Color(0xFFFFECEE);
  static const redErrorColor =  Color(0xFFFF3C53);
  static const primaryColor = Color(0xFF0666EB);
  static const darkBlueSecondaryColor = Color(0xFF121B2F);
  static const scaffoldBackgroundColor = Color(0xFFF3F4F5);
  static const greyDividerColor = Color(0xFFE8EDF3);
  static const greyTextColor = Color(0xFFA6A9B6);
  static const greyBorderColor = Color(0xFFD7D7E7);
  static const redColor = Color(0xFFE93147);
  static const greenColor = Color(0xFF07B021);
  static const unselectedBottomNavigationBarItemColor = Color(0xFF8695A7);
  static const searchTextFieldColor = Color(0xFFE4E7EC);
  static const searchTextFieldIconTextColor = Color(0xFF9BABBC);
  static const disabledActionBtnColor =  Color(0xFF83B3F5);

  static final darkBlueTextStyle400 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: darkBlueSecondaryColor,

  );

  static final darkBlueTextStyle500 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: darkBlueSecondaryColor,
  );

  static final darkBlueTextStyle600 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: darkBlueSecondaryColor,

  );

  static final darkBlueTextStyle700 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: darkBlueSecondaryColor,

  );

  static final greyTextStyle400 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: greyColor,
  );

  static final primaryColorTextStyle500 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: primaryColor,
  );

  static final blackTextStyle = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static final textFieldLabelStyle = TextStyle(
    color: AppTheme.greyTextColor,
    fontSize: 14.sp,
    height: 1,
    fontWeight: FontWeight.w400,
  );


  static const bodyText2 = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: regularGrey,
  );
  static final buttonText = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: greyColor,
  );
}
