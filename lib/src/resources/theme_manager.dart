import 'package:learning_go_test/src/core/extensions/numbers_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/enums/app_theme_types.dart';
import 'color_manager.dart';
import 'font_manager.dart';

class AppThemes {
  static changeCurrentTheme(AppThemeType type) {
    if (type == AppThemeType.light) {
      currentTheme = AppThemes.lightTheme;
      themeMode = ThemeMode.light;
    } else {
      currentTheme = AppThemes.darkTheme;
      themeMode = ThemeMode.dark;
    }
  }

  static ThemeData currentTheme = lightTheme;
  static ThemeMode themeMode = ThemeMode.light;
  static ThemeData customTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: LightColorsManager().primary),
  );

  static ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: LightColorsManager().background,
    brightness: Brightness.light,

    //main color
    primaryColor: LightColorsManager().primary,
    shadowColor: LightColorsManager().shadow,
    hoverColor: LightColorsManager().lightPrimary,
    primaryColorLight: LightColorsManager().primary,
    primaryColorDark: LightColorsManager().primary,
    disabledColor: LightColorsManager().grey,
    splashColor: Colors.transparent,
    unselectedWidgetColor: LightColorsManager().black,
    secondaryHeaderColor: LightColorsManager().scrim,

    // colorSchemeSeed: LightColorsManager().primary,
    colorScheme: const ColorScheme.light().copyWith(
      primary: LightColorsManager().primary,
      onPrimary: LightColorsManager().onPrimary,
      surface: LightColorsManager().surface,
      secondary: LightColorsManager().lightPrimary,
    ),
    cardColor: LightColorsManager().surface,
    datePickerTheme: DatePickerThemeData(
      dayStyle: TextStyle(color: LightColorsManager().dark, fontSize: 12.sp),
      cancelButtonStyle: ButtonStyle(
        textStyle: WidgetStateProperty.all(
          TextStyle(color: LightColorsManager().darker, fontSize: 16.sp),
        ),
      ),
      confirmButtonStyle: ButtonStyle(
        textStyle: WidgetStateProperty.all(
          TextStyle(color: LightColorsManager().primary, fontSize: 16.sp),
        ),
      ),
    ),
    // Icon Theme
    iconTheme: IconThemeData(
      size: 25.sp, // Adjust the size of icons as needed
      color: LightColorsManager().black, // Set the default color for icons
    ),

    //Slider
    sliderTheme: SliderThemeData(
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5.sp),
    ),
    //card Theme
    cardTheme: CardThemeData(
      color: LightColorsManager().surface,
      shadowColor: LightColorsManager().grey,
      elevation: 0,
    ),
    //appbar Theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      foregroundColor: LightColorsManager().scrim,

      // surfaceTintColor: LightColorsManager().scrim,
      scrolledUnderElevation: 0.0,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeightManager.medium,
        color: LightColorsManager().darkest,
      ),
    ),
    switchTheme: SwitchThemeData(
      // thumbColor: WidgetStatePropertyAll(LightColorsManager().onPrimary),
      overlayColor: WidgetStatePropertyAll(LightColorsManager().primary),
      // trackColor: WidgetStatePropertyAll(LightColorsManager().primary),
    ),

    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   backgroundColor: LightColorsManager().white,
    //   selectedItemColor: LightColorsManager().primary,
    //   unselectedItemColor: LightColorsManager().black,
    //   showSelectedLabels: true,
    //   showUnselectedLabels: true,
    //   selectedLabelStyle: TextStyle(
    //     fontSize: 8.sp,
    //     fontWeight: FontWeightManager.regular,
    //     color: LightColorsManager().primary,
    //   ),
    //   unselectedLabelStyle: TextStyle(
    //     fontSize: 8.sp,
    //     fontWeight: FontWeightManager.regular,
    //     color: LightColorsManager().black,
    //   ),
    //   elevation: AppSize.s4,
    // ),

    //button Theme
    buttonTheme: ButtonThemeData(
      shape: const RoundedRectangleBorder(),
      disabledColor: LightColorsManager().grey,
      buttonColor: LightColorsManager().primary,
      splashColor: LightColorsManager().lightPrimary,
    ),

    // IconButton Theme
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        iconSize: 25.sp, // Adjust the size of icons as needed
        foregroundColor:
            LightColorsManager().black, // Set the default color for icons
        padding: EdgeInsets.all(8.sp), // Set the padding for the IconButton
      ),
    ),
    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        minimumSize: Size(50.w, 30.h),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.center,
        textStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeightManager.light,
          color: LightColorsManager().primary,
        ),
      ),
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: LightColorsManager().white,
        disabledBackgroundColor: LightColorsManager().grey,
        // disabledForegroundColor: LightColorsManager().grey,
        textStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeightManager.light,
          color: LightColorsManager().white,
        ),
        backgroundColor: LightColorsManager().primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    ),

    //text theme
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeightManager.extraBold,
        color: LightColorsManager().scrim,
      ),
      displayLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightManager.bold,
        color: LightColorsManager().darkest,
      ),
      titleLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightManager.semiBold,
        color: LightColorsManager().darkest,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightManager.medium,
        color: LightColorsManager().darkest,
      ),
      displayMedium: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeightManager.medium,
        color: LightColorsManager().darkest,
      ),
      bodyMedium: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeightManager.medium,
        color: LightColorsManager().darkest,
      ),
      titleMedium: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeightManager.regular,
        color: LightColorsManager().darker,
      ),
      displaySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeightManager.regular,
        color: LightColorsManager().darker,
      ),
      titleSmall: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeightManager.light,
        color: LightColorsManager().darker,
      ),
    ).apply(fontFamily: AppFonts.poppins),

    //input decoration theme (Text Form Field)
    inputDecorationTheme: InputDecorationTheme(
      // constraints: BoxConstraints(maxHeight: 50.h),
      //content padding
      //hint style
      hoverColor: Colors.transparent,

      hintStyle: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeightManager.light,
        color: LightColorsManager().dark,
      ),

      //label style
      labelStyle: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeightManager.light,
        color: LightColorsManager().dark,
      ),

      //error style
      errorStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightManager.light,
        color: LightColorsManager().red,
        fontFamily: AppFonts.poppins,
      ),

      errorMaxLines: 1,
      filled: true,
      fillColor: LightColorsManager().surface.withValues(alpha: 0.5),
      suffixIconColor: LightColorsManager().grey,
      prefixIconColor: LightColorsManager().grey,
      //enabledBorder style
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: LightColorsManager().grey, width: 0.4.w),
        borderRadius: BorderRadius.all(8.0.toRadius),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: LightColorsManager().lightGrey,
          width: 0.5.w,
        ),
        borderRadius: BorderRadius.all(8.0.toRadius),
      ),

      //focusedBorder style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: LightColorsManager().primary,
          width: 0.5.w,
        ),
        borderRadius: BorderRadius.all(8.0.toRadius),
      ),

      //errorBorder style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: LightColorsManager().red, width: 0.5.w),
        borderRadius: BorderRadius.all(8.0.toRadius),
      ),

      //focusedErrorBorder style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: LightColorsManager().red, width: 0.5.w),
        borderRadius: BorderRadius.all(8.0.toRadius),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: LightColorsManager().grey, width: 0.4.w),
        borderRadius: BorderRadius.all(8.0.toRadius),
      ),
      outlineBorder: BorderSide(
        color: LightColorsManager().primary,
        width: 1.sp,
      ),
    ),

    // Tab Bar Theme
    tabBarTheme: TabBarThemeData(
      labelColor: LightColorsManager().primary,
      unselectedLabelColor: LightColorsManager().grey,
      indicatorColor: LightColorsManager().primary,
      labelStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightManager.regular,
        color: LightColorsManager().primary,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightManager.regular,
        color: LightColorsManager().grey,
      ),
      dividerHeight: 0.2.h,
      dividerColor: LightColorsManager().primary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: LightColorsManager().primary,
    ),
  );

  /*  
     primaryColorLight: LightColorsManager().primary,
    primaryColorDark: LightColorsManager().primary,
    disabledColor: LightColorsManager().grey,
    splashColor: LightColorsManager().lightPrimary,
    unselectedWidgetColor: LightColorsManager().black,
    // colorSchemeSeed: LightColorsManager().primary,
    colorScheme: ColorScheme.light().copyWith(
      primary: LightColorsManager().primary,
      onPrimary: LightColorsManager().white,
      onSurfaceVariant: LightColorsManager().primary,
    ),
    // Icon Theme
    iconTheme: IconThemeData(
      size: AppSize.iconSize.sp, // Adjust the size of icons as needed
      color: LightColorsManager().primary, // Set the default color for icons
    ),
    //Slider
    sliderTheme: SliderThemeData(
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5.sp)),
    //card Theme
    cardTheme: CardTheme(
        color: LightColorsManager().white,
        shadowColor: LightColorsManager().grey,
        elevation: AppSize.s0.sp),
    //appbar Theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: LightColorsManager().white,
      // elevation: AppSize.s4,
      // shadowColor: LightColorsManager().profileLoader1,
      titleTextStyle: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeightManager.semiBold,
        color: LightColorsManager().black,
      ),
    ),

    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   backgroundColor: LightColorsManager().white,
    //   selectedItemColor: LightColorsManager().primary,
    //   unselectedItemColor: LightColorsManager().black,
    //   showSelectedLabels: true,
    //   showUnselectedLabels: true,
    //   selectedLabelStyle: TextStyle(
    //     fontSize: 8.sp,
    //     fontWeight: FontWeightManager.regular,
    //     color: LightColorsManager().primary,
    //   ),
    //   unselectedLabelStyle: TextStyle(
    //     fontSize: 8.sp,
    //     fontWeight: FontWeightManager.regular,
    //     color: LightColorsManager().black,
    //   ),
    //   elevation: AppSize.s4,
    // ),

    //button Theme

    buttonTheme: ButtonThemeData(
      shape: const RoundedRectangleBorder(),
      disabledColor: LightColorsManager().grey,
      buttonColor: LightColorsManager().primary,
      splashColor: LightColorsManager().lightPrimary,
    ),

    // IconButton Theme
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        iconSize: AppSize.iconSize, // Adjust the size of icons as needed
        foregroundColor:
            LightColorsManager().black, // Set the default color for icons
        padding: EdgeInsets.all(
            AppPadding.p8.sp), // Set the padding for the IconButton
      ),
    ),
// Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        minimumSize: Size(50.w, 30.h),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.center,
        textStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeightManager.light,
          color: LightColorsManager().primary,
        ),
      ),
    ),
    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(AppSize.authElevatedButtonWidth.w,
                AppSize.authElevatedButtonHeight.h),
            foregroundColor: LightColorsManager().white,
            disabledBackgroundColor:
                LightColorsManager().hintText.withAlpha(100),
            // disabledForegroundColor: LightColorsManager().grey,
            textStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeightManager.light,
              color: LightColorsManager().white,
            ),
            backgroundColor: LightColorsManager().primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.radius25.sp)))),

    //text theme
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeightManager.bold,
        color: LightColorsManager().black,
      ),
      titleLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeightManager.semiBold,
        color: LightColorsManager().black,
      ),
      displayMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightManager.regular,
        color: LightColorsManager().primary,
      ),
      bodyMedium: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeightManager.regular,
        color: LightColorsManager().white,
      ),
      titleMedium: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeightManager.regular,
        color: LightColorsManager().grey,
      ),
      displaySmall: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeightManager.light,
        color: LightColorsManager().primary,
      ),
      titleSmall: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeightManager.light,
        color: LightColorsManager().black,
      ),
    ),

    //input decoration theme (Text Form Field)
    inputDecorationTheme: InputDecorationTheme(
      //content padding

      contentPadding: EdgeInsets.all(AppPadding.p12.w),
      //hint style
      hintStyle: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeightManager.light,
        color: LightColorsManager().hintText,
      ),

//label style
      labelStyle: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeightManager.light,
        color: LightColorsManager().black,
      ),

//error style
      errorStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeightManager.light,
        color: LightColorsManager().red,
      ),

      errorMaxLines: 1,
      filled: true,
      fillColor: LightColorsManager().textFieldBackground,
      suffixIconColor: LightColorsManager().black,
      prefixIconColor: LightColorsManager().black,
//enabledBorder style
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.radius25.h)),
      ),

//focusedBorder style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.radius25.h)),
      ),

      //errorBorder style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.radius25.h)),
      ),

      //focusedErrorBorder style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(AppSize.radius25.h)),
      ),
    ),

    // Tab Bar Theme
    tabBarTheme: TabBarTheme(
      labelColor: LightColorsManager().primary,
      unselectedLabelColor: LightColorsManager().grey,
      indicatorColor: LightColorsManager().primary,
      labelStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightManager.regular,
        color: LightColorsManager().primary,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightManager.regular,
        color: LightColorsManager().grey,
      ),
      dividerHeight: 0.2.h,
      dividerColor: LightColorsManager().primary,
    ),

    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //   backgroundColor: LightColorsManager().primary,
    //   splashColor: LightColorsManager().profileLoader1,
    // )
    */ //text theme

  static ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    brightness: Brightness.dark,

    //main color
    primaryColor: DarkColorsManager().primary,
    shadowColor: DarkColorsManager().shadow,
    hoverColor: DarkColorsManager().lightPrimary,
    primaryColorLight: DarkColorsManager().primary,
    primaryColorDark: DarkColorsManager().primary,
    disabledColor: DarkColorsManager().grey,
    splashColor: Colors.transparent,
    unselectedWidgetColor: DarkColorsManager().dark,
    // colorSchemeSeed: DarkColorsManager().primary,
    scaffoldBackgroundColor: DarkColorsManager().background,

    colorScheme: const ColorScheme.dark().copyWith(
      primary: DarkColorsManager().primary,
      onPrimary: DarkColorsManager().onPrimary,
      surface: DarkColorsManager().surface,
    ),
    datePickerTheme: DatePickerThemeData(
      dayStyle: TextStyle(color: DarkColorsManager().dark, fontSize: 12.sp),
      cancelButtonStyle: ButtonStyle(
        textStyle: WidgetStateProperty.all(
          TextStyle(color: DarkColorsManager().darker, fontSize: 16.sp),
        ),
      ),
      confirmButtonStyle: ButtonStyle(
        textStyle: WidgetStateProperty.all(
          TextStyle(color: DarkColorsManager().primary, fontSize: 16.sp),
        ),
      ),
    ),
    // Icon Theme
    iconTheme: IconThemeData(
      size: 25.sp, // Adjust the size of icons as needed
      color: DarkColorsManager().darker, // Set the default color for icons
    ),
    //Slider
    sliderTheme: SliderThemeData(
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5.sp),
    ),
    //card Theme
    cardTheme: CardThemeData(
      color: DarkColorsManager().surface,
      shadowColor: DarkColorsManager().grey,
      elevation: 0,
    ),

    //appbar Theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      scrolledUnderElevation: 0.0,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeightManager.medium,
        color: DarkColorsManager().darkest,
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStatePropertyAll(DarkColorsManager().onPrimary),
      overlayColor: WidgetStatePropertyAll(DarkColorsManager().primary),
      // trackColor: WidgetStatePropertyAll(DarkColorsManager().primary),
    ),

    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   backgroundColor: DarkColorsManager().white,
    //   selectedItemColor: DarkColorsManager().primary,
    //   unselectedItemColor: DarkColorsManager().black,
    //   showSelectedLabels: true,
    //   showUnselectedLabels: true,
    //   selectedLabelStyle: TextStyle(
    //     fontSize: 8.sp,
    //     fontWeight: FontWeightManager.regular,
    //     color: DarkColorsManager().primary,
    //   ),
    //   unselectedLabelStyle: TextStyle(
    //     fontSize: 8.sp,
    //     fontWeight: FontWeightManager.regular,
    //     color: DarkColorsManager().black,
    //   ),
    //   elevation: AppSize.s4,
    // ),

    //button Theme
    buttonTheme: ButtonThemeData(
      shape: const RoundedRectangleBorder(),
      disabledColor: DarkColorsManager().grey,
      buttonColor: DarkColorsManager().primary,
      splashColor: DarkColorsManager().lightPrimary,
    ),

    // IconButton Theme
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        iconSize: 25.sp, // Adjust the size of icons as needed
        foregroundColor:
            DarkColorsManager().black, // Set the default color for icons
        padding: EdgeInsets.all(8.sp), // Set the padding for the IconButton
      ),
    ),
    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        minimumSize: Size(50.w, 30.h),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.center,
        textStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeightManager.light,
          color: DarkColorsManager().primary,
        ),
      ),
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      collapsedBackgroundColor: Colors.transparent,
    ),
    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: DarkColorsManager().white,
        disabledBackgroundColor: DarkColorsManager().grey,
        // disabledForegroundColor: DarkColorsManager().grey,
        textStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeightManager.light,
          color: DarkColorsManager().white,
        ),
        backgroundColor: DarkColorsManager().primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    ),

    //text theme
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeightManager.extraBold,
        color: DarkColorsManager().scrim,
      ),
      displayLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightManager.bold,
        color: DarkColorsManager().darkest,
      ),
      titleLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightManager.semiBold,
        color: DarkColorsManager().darkest,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightManager.medium,
        color: DarkColorsManager().darkest,
      ),
      displayMedium: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeightManager.medium,
        color: DarkColorsManager().darkest,
      ),
      bodyMedium: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeightManager.medium,
        color: DarkColorsManager().darkest,
      ),
      titleMedium: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeightManager.regular,
        color: DarkColorsManager().darker,
      ),
      displaySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeightManager.regular,
        color: DarkColorsManager().darker,
      ),
      titleSmall: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeightManager.light,
        color: DarkColorsManager().darker,
      ),
    ).apply(fontFamily: AppFonts.poppins),

    //input decoration theme (Text Form Field)
    inputDecorationTheme: InputDecorationTheme(
      // constraints: BoxConstraints(maxHeight: 50.h),

      //content padding
      //hint style
      hoverColor: Colors.transparent,
      hintStyle: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeightManager.light,
        color: DarkColorsManager().grey,
      ),

      //label style
      labelStyle: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeightManager.light,
        color: DarkColorsManager().darkest,
      ),

      //error style
      errorStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeightManager.light,
        color: DarkColorsManager().red,
      ),

      errorMaxLines: 1,
      filled: true,

      fillColor: DarkColorsManager().textFieldFill.withValues(alpha: 0.5),
      suffixIconColor: DarkColorsManager().darker,
      prefixIconColor: DarkColorsManager().darker,
      //enabledBorder style
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: DarkColorsManager().dark, width: 0.5.w),
        borderRadius: BorderRadius.all(8.0.toRadius),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: DarkColorsManager().lightGrey,
          width: 0.5.w,
        ),
        borderRadius: BorderRadius.all(8.0.toRadius),
      ),

      //focusedBorder style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: DarkColorsManager().primary,
          width: 0.5.w,
        ),
        borderRadius: BorderRadius.all(8.0.toRadius),
      ),

      //errorBorder style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: DarkColorsManager().red, width: 0.5.w),
        borderRadius: BorderRadius.all(8.0.toRadius),
      ),

      //focusedErrorBorder style
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: DarkColorsManager().red, width: 0.5.w),
        borderRadius: BorderRadius.all(8.0.toRadius),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: DarkColorsManager().primary,
          width: 0.5.w,
        ),
        borderRadius: BorderRadius.all(8.0.toRadius),
      ),
      outlineBorder: BorderSide(
        color: DarkColorsManager().primary,
        width: 1.sp,
      ),
    ),

    // Tab Bar Theme
    tabBarTheme: TabBarThemeData(
      labelColor: DarkColorsManager().primary,
      unselectedLabelColor: DarkColorsManager().grey,
      indicatorColor: DarkColorsManager().primary,
      labelStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightManager.regular,
        color: DarkColorsManager().primary,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightManager.regular,
        color: DarkColorsManager().grey,
      ),
      dividerHeight: 0.2.h,
      dividerColor: DarkColorsManager().primary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: DarkColorsManager().primary,
    ),
  );
}
