
import 'package:events_attendance/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final Color? color;
  final Color textColor;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final GestureTapCallback onTap;
  final GestureTapCallback? onLongPress;
  final Widget child;
  final BoxBorder? border;
  final bool disabled;
  final double? borderRadius;
  final BoxConstraints? boxConstraints;

  const CustomButton(
      {required this.onTap,
        this.onLongPress,

        this.width,
        this.borderRadius,
        this.height,
        this.text = Constants.nullStringValue,
        this.color,
        this.textColor = Colors.white,
        this.textStyle,
        this.margin,
        this.padding,
        this.border,
        this.disabled = false,
        this.boxConstraints,
        Key? key,
        required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) => _WScaleAnimation(
    onTap: () {
      if(!disabled){
        onTap();
      }
    },
    onLongPress: onLongPress,
    child: Container(
      width: width,
      height: height,
      margin: margin,
      constraints: boxConstraints,
      padding: padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: color ?? Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        border: border,
      ),
      child: child,
    ),
  );
}


class _WScaleAnimation extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final bool disabled;
  final bool isIcon;

  const _WScaleAnimation({
    Key? key,
    required this.child,
    required this.onTap,
    this.onLongPress,
    this.disabled = false,
    this.isIcon = false,
  }) : super(key: key);

  @override
  _WScaleAnimationState createState() => _WScaleAnimationState();
}

class _WScaleAnimationState extends State<_WScaleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 80),
    );

    _scaleAnimation = Tween<double>(
      begin: 1,
      end: widget.isIcon ? 0.8 : 0.99,
    ).animate(
      CurvedAnimation(
        curve: Curves.decelerate,
        parent: _controller,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: widget.disabled ? () {} : widget.onTap,
    onLongPress: widget.disabled ? () {} : widget.onLongPress,
    onPanDown: (details) => widget.disabled ? () {} : _controller.forward(),
    onPanCancel: () => widget.disabled ? () {} : _controller.reverse(),
    onPanEnd: (details) => widget.disabled ? () {} : _controller.reverse(),
    child: ScaleTransition(
      scale: _scaleAnimation,
      child: widget.child,
    ),
  );
}
