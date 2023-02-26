import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDimensions {
  static double get screenVerticalPadding => 20.h;
  static double get screenHorizontalPadding => 16.w;

  static double getSmallerValueSize(double size){
    return size.w < size.h ? size.w : size.h;
  }
}
