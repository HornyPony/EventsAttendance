
import 'package:auto_route/auto_route.dart';
import 'package:events_attendance/presentation/global_widgets/custom_button.dart';
import 'package:events_attendance/presentation/utils/app_icons.dart';
import 'package:events_attendance/presentation/utils/dimensions.dart';
import 'package:events_attendance/presentation/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PseudoAppBarTextOnly extends StatelessWidget {
  final String title;
  final Widget screenBody;

  const PseudoAppBarTextOnly(
      {Key? key, required this.title, required this.screenBody})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _OneRowAppBar(
              child: _PseudoAppBarTitleTextOneRow(
                title: title,
              ),
            ),
            Expanded(
              child: screenBody,
            ),
          ],

      ),
    );
  }
}

class PseudoAppBarBackIconOnly extends StatelessWidget {
  final Widget screenBody;

  const PseudoAppBarBackIconOnly({Key? key, required this.screenBody})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _OneRowAppBar(
            heightUnderText: 0,
            heightAboveText: 0,
            child: _NavigateBackIcon(
              bottomPadding: CustomDimensions.screenVerticalPadding,
            ),
          ),
          Expanded(
            child: screenBody,
          ),
        ],
      ),
    );
  }
}

class PseudoAppBarBackIconWithTitle extends StatelessWidget {
  final String title;
  final Widget screenBody;
  final bool isBlueScaffold;

  const PseudoAppBarBackIconWithTitle(
      {Key? key,
      required this.title,
      required this.screenBody,
      this.isBlueScaffold = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _TwoRowAppBar(
            heightBetweenBackIconAndText: _heightBetweenBackIconAndText,
            heightUnderText: 15.h,
            secondRowChild: _PseudoAppBarTitleTextOneRow(
              isBlueScaffold: isBlueScaffold,
              title: title,
            ),
            isBlueScaffold: isBlueScaffold,
          ),
          Expanded(child: screenBody),
        ],
      ),
    );
  }
}

class _OneRowAppBar extends StatelessWidget {
  final Widget child;
  final double? heightUnderText;
  final double? heightAboveText;

  const _OneRowAppBar({
    Key? key,
    required this.child,
     this.heightUnderText,
    this.heightAboveText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: heightAboveText ?? _heightAboveRow,
        bottom: heightUnderText ?? _heightUnderRow,
        left: CustomDimensions.screenHorizontalPadding,
        right: CustomDimensions.screenHorizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          child,
        ],
      ),
    );
  }
}

class _TwoRowAppBar extends StatelessWidget {
  final bool isBlueScaffold;
  final Widget secondRowChild;
  final double heightBetweenBackIconAndText;
  final double heightUnderText;

  const _TwoRowAppBar({
    Key? key,
    this.isBlueScaffold = false,
    required this.secondRowChild,
    required this.heightBetweenBackIconAndText,
    required this.heightUnderText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: CustomDimensions.screenHorizontalPadding,
        right: CustomDimensions.screenHorizontalPadding,
        bottom: heightUnderText,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _NavigateBackIcon(
            isBlueScaffold: isBlueScaffold,
            bottomPadding: heightBetweenBackIconAndText,
          ),
          secondRowChild,
        ],
      ),
    );
  }
}

class _NavigateBackIcon extends StatelessWidget {
  final bool isBlueScaffold;
  final double bottomPadding;
  final double? topPadding;

  const _NavigateBackIcon({
    Key? key,
    this.isBlueScaffold = false,
    required this.bottomPadding,
    this.topPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CustomButton(
        padding: EdgeInsets.only(
            top: topPadding ?? _heightAboveRow, bottom: bottomPadding),
        onTap: () {
          AutoRouter.of(context).pop();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                AppIcons.arrowBack,
                color: isBlueScaffold ? Colors.white : Colors.black,
                width: 12.w,
                height: 12.h,
              ),
            ),
          ],
        ),

    );
  }
}

class _PseudoAppBarTitleTextOneRow extends StatelessWidget {
  final String title;
  final bool isBlueScaffold;
  final int flex;

  const _PseudoAppBarTitleTextOneRow({
    Key? key,
    required this.title,
    this.isBlueScaffold = false,
    this.flex = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Text(
        title,
        textAlign: TextAlign.start,
        overflow: TextOverflow.fade,
        //softWrap: false,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: 24.sp,
              color: isBlueScaffold
                  ? Colors.white
                  : AppTheme.darkBlueSecondaryColor,
            ),
      ),
    );
  }
}



get _heightBetweenBackIconAndText => 11.h;

get _heightAboveRow => 0.h;

get _heightUnderRow => 8.h;
