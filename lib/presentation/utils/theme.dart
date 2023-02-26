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
  static const background2 = Color(0xffF4F5F7); //Color(0xffF2F3F5);

  //static const blackTextColor = Color(0xFF380000);
  static const greyDividerTextColor = Color(0xFFECECEC);
  static const greyColor = Color(0xFF808080);
  static const filterBtnsColor = Color(0xFFE6E6E6);
  static const orangeColor = Color(0xFFFF7C33);
  static const lightGreyColor = Color(0xffF4F3F3);
  static const lightPink = Color(0xffFDC9A6);
  static const errorFieldColor = Color(0xFFF2BFBF);

  static const darkBlueColor = Color(0xFF001D38);
  static const appBarDarkBlueColor = Color(0xFF001959);
  static const screenerRanksDarkBlueColor = Color(0xFF1A3A57);
  static const brightBlueColor = Color(0xFF2885DB);
  static const gradientGreenColor = Color(0xFF22D804);
  static const gradientWhiteColor = Color(0xFFFFFFFF);
  static const gradientRedColor = Color(0xFFEC2A41);
  static const scoreActiveBuyColor = gradientGreenColor;
  static const scoreBuyColor = Color(0xff5EE349);
  static const scoreHoldColor = Color(0xFFFFA568);
  static const scoreSellColor = Color(0xffF58996);
  static const scoreActiveSellColor = gradientRedColor;
  static const screenerGreenColor = Color(0xFF94E78D);
  static const screenerRedColor = Color(0xFFFF8A91);
  static const checkboxColor = Color(0xFF84CAFF);
  static const promocodeScreenColor =  Color(0xFFE5F7FF);
  static const acceptingAgreementsColor =  Color(0xFF3C9EE7);
  static const lightRedErrorColor =  Color(0xFFFFECEE);
  static const redErrorColor =  Color(0xFFFF3C53);

  static const primaryColor = Color(0xFF0666EB);
  static const darkBlueSecondaryColor = Color(0xFF121B2F);
  static const scaffoldBackgroundColor = Color(0xFFF3F4F5);
  static const greyDividerColor = Color(0xFFE8EDF3);
  static const greyTextColor = Color(0xFFA6A9B6);
  static const greyBorderColor = Color(0xFFD7D7E7);
  static const aboutUsShortGreyTextColor = Color(0xFF6E778D);
  static const chatBubbleDateTextColor = Color(0xFF949494);
  static const chatSupportBubbleColor = Color(0xFFE9E9EB);
  static const chatOnlineColor = Color(0xFF00F418);
  static const chatStatusTextColor = Color(0xFF080C42);
  static const chatFocusedTextFieldColor = Color(0xFF4F4F62);
  static const scaffoldAuthedBackgroundColor = Color(0xFF0048AB);
  static const selectedTariffColor = Color(0xFFCBE1FF);
  static const basicSubStarColor = Color(0xFFE93147);
  static const deleteAccountColor = Color(0xFFD60000);
  static const advancedSubStarColor = Color(0xFFF99500);
  static const allInclusiveSubStarColor = Color(0xFF07B021);
  static const screenerGreyTextColor = Color(0xFF656D77);
  static const unFavoriteCompanyColor = Color(0xFFC7CDD4);
  static const unselectedBottomNavigationBarItemColor = Color(0xFF8695A7);
  static const searchTextFieldColor = Color(0xFFE4E7EC);
  static const searchTextFieldIconTextColor = Color(0xFF9BABBC);
  static const chatDateHeaderColor = Color(0xFFBBD5FA);
  static const chatDateHeaderTextColor = Color(0xFF8A8F96);
  static const checkboxUnselectedColor = Color(0xFFDFDFE5);
  static const filtersResetAddBtnDividerColor = Color(0xFFC0D4F0);
  static const unavailableFilterColor = Color(0xFF8486A1);
  static const expandedFilterDividerColor = Color(0xFFE9E9EA);
  static final analyzeCompanyInfoIconColor = const Color(0xFF9FADBD).withOpacity(0.58);
  static const companyPlaceContainerColor =  Color(0xFFCFD9E6);
  static const companyPlaceTextTitleColor =  Color(0xFF6F86A3);
  static const chartSelectedDateColor =  Color(0xFFB6D5FF);
  static const noFavoriteCompaniesTextColor =  Color(0xFF8196AC);
  static const tapAgainToCloseAppSnackBarColor =  Color(0xFF2F507E);
  static const companyInResearchGradientEndColor =  Color(0xFF0547A1);
  static const signUpOfferColor =  Color(0xFF0246AB);
  static const ranksComponentUnselectedIconColor =  Color(0xFFB7C3D3);
  static const ranksComponentTextColor =  Color(0xFF7E8C9C);
  static const changeDisplayingScreenersBtnBackground =  Color(0xFFE3E3E3);
  static const disabledActionBtnColor =  Color(0xFF83B3F5);
  static const notShowingOnboardingStatus =  Color(0xFF6C7683);
  static final closeOnboardingBtnColor =  const Color(0xFFD9D9D9).withOpacity(0.5);
  static const unselectedSubOfferColor =   Color(0xFF4076C0);
  static const cancelSubTextColor =   Color(0xFFC4D5EC);
  static const closeSubOfferScreenIconColor =   Color(0xFF8CACD9);
  static const oldReportingContainerColor =   Color(0xFFFFC83C);
  static const showcaseBarrierColor = Colors.black45;
  static const onboardingBackgroundStartColor = Color(0xFF001431);
  static const onboardingBackgroundEndColor = Color(0xFF000915);
  static const onboardingBottomShadowGradientColor =  Color(0xFF000915);
  static const chatHelloTextColor =  Color(0xFF868686);
  static const inactiveSwitchColor =  Color(0xFFD7DEEB);




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
