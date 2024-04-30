import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton(
      {Key? key,
      this.backgroundColor,
      this.elevation,
      this.foregroundColor,
      this.child,
      this.iconData,
      this.isMini,
      this.highlightElevation,
      this.withBorder = false,
      this.borderColor,
      this.borderWidth,
      this.borderRadius,
      this.customBorderRadius,
      this.splashColor,
      this.iconSize,
      required this.onPressed, required this.heroTag, this.iconColor})
      : super(key: key);
  final Color? backgroundColor;
  final double? elevation;
  final Color? foregroundColor;
  final Widget? child;
  final IconData? iconData;
  final bool? isMini;
  final double? highlightElevation;
  final bool? withBorder;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final BorderRadius? customBorderRadius;
  final Color? splashColor;
  final Color? iconColor;
  final double? iconSize;
  final void Function() onPressed;
  final String heroTag;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag:heroTag ,
      onPressed: onPressed,
      backgroundColor: backgroundColor ?? Colors.red,
      elevation: elevation ?? 6,
      foregroundColor: foregroundColor ?? Colors.white,
      child: child ??
          Icon(
            iconData ?? Icons.list,
            size: iconSize ?? 20,
            color:iconColor?? Colors.white ,
          ),
      mini: isMini ?? false,
      highlightElevation: highlightElevation ?? 30,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: borderColor ?? Colors.black,
            width: borderWidth ?? 1,
            style: withBorder! ? BorderStyle.solid : BorderStyle.none),
        borderRadius:
            customBorderRadius ?? BorderRadius.circular(borderRadius ?? 30),
      ),
      splashColor: splashColor ?? Colors.white10,
    );
  }
}
