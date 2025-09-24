import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/views/widgets/spinner.dart';
import 'package:hazard_app/others/app_colors.dart';

enum _Type {
  filled,
  bordered,
}

class Button extends StatelessWidget {
  /// A customizable button widget that is filled.
  const Button.filled({
    super.key,
    this.value,
    this.valueStyle,
    this.color,
    this.splashColor,
    this.icon,
    this.isIconLeft = true,
    this.width,
    this.borderRadius,
    this.padding,
    this.elevation = 0.0,
    this.isLoading = false,
    this.loader,
    this.onPressed,
  })  : _type = _Type.filled,
        borderSide = null;

  /// A customizable button widget that is bordered.
  const Button.bordered({
    super.key,
    this.value,
    this.valueStyle,
    this.borderSide,
    this.splashColor,
    this.icon,
    this.isIconLeft = true,
    this.width,
    this.borderRadius,
    this.padding,
    this.elevation = 0.0,
    this.isLoading = false,
    this.loader,
    this.onPressed,
  })  : _type = _Type.bordered,
        color = null;

  /// The type of the button.
  final _Type _type;

  /// The text to display on the button.
  final String? value;

  /// The style of the text to display on the button.
  final TextStyle? valueStyle;

  /// The color of the button.
  final Color? color;

  /// The color of the splash effect when the button is pressed.
  final Color? splashColor;

  /// The border side of the button.
  final BorderSide? borderSide;

  /// The icon to display on the button alongside the text.
  final Widget? icon;

  /// Whether the icon should be displayed on the left side of the text.
  ///
  /// This is only applicable when [icon] is not null.
  final bool isIconLeft;

  /// The width of the button.
  final double? width;

  /// The border radius of the button.
  final double? borderRadius;

  /// The padding of the button content.
  final EdgeInsets? padding;

  /// The elevation of the button.
  final double elevation;

  /// Whether the button is in a loading state.
  ///
  /// When true, the button will display a loader.
  final bool isLoading;

  /// The loader to display when the button is in a loading state.
  ///
  /// This is only applicable when [isLoading] is true.
  final Widget? loader;

  /// The function to call when the button is pressed.
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case _Type.filled:
        return _filledBuilder(context);
      case _Type.bordered:
        return _borderedBuilder(context);
    }
  }

  Widget _filledBuilder(final BuildContext context) {
    final elevatedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: color,
      shape: borderRadius == null
          ? null
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!.r),
            ),
      elevation: elevation,
      padding: padding,
    );

    return SizedBox(
      width: width?.spMin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: elevatedButtonStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isIconLeft)
              if (icon != null) icon ?? Container(),
            if (isIconLeft)
              if (icon != null && value != null)
                SizedBox(
                  width: 10.spMin,
                ),
            if (value != null)
              Text(
                '$value',
                style: valueStyle,
              ),
            if (!isIconLeft)
              if (value != null)
                SizedBox(
                  width: 10.spMin,
                ),
            if (!isIconLeft)
              if (icon != null) icon ?? Container(),
            if (isLoading && value != null && isIconLeft)
              SizedBox(
                width: 20.spMin,
              ),
            if (isLoading && !isIconLeft)
              SizedBox(
                width: 20.spMin,
              ),
            if (isLoading)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  loader ??
                      Spinner(
                        size: 15.spMin,
                        color: AppColors.white,
                      ),
                ],
              )
          ],
        ),
      ),
    );
  }

  Widget _borderedBuilder(final BuildContext context) {
    final outlinedButtonStyle = OutlinedButton.styleFrom(
      side: borderSide,
      shape: borderRadius == null
          ? null
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!.r),
            ),
      elevation: elevation,
      padding: padding,
    );

    return SizedBox(
      width: width?.spMin,
      child: OutlinedButton(
        onPressed: onPressed,
        style: outlinedButtonStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isIconLeft)
              if (icon != null) icon ?? Container(),
            if (isIconLeft)
              if (icon != null && value != null)
                SizedBox(
                  width: 10.spMin,
                ),
            if (value != null)
              Text(
                '$value',
                style: valueStyle,
              ),
            if (!isIconLeft)
              if (value != null)
                SizedBox(
                  width: 10.spMin,
                ),
            if (!isIconLeft)
              if (icon != null) icon ?? Container(),
            if (isLoading && value != null && isIconLeft)
              SizedBox(
                width: 20.spMin,
              ),
            if (isLoading && !isIconLeft)
              SizedBox(
                width: 20.spMin,
              ),
            if (isLoading)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  loader ??
                      Spinner(
                        size: 15.spMin,
                        color: outlinedButtonStyle.side?.resolve(
                          const <WidgetState>{
                            WidgetState.pressed,
                            WidgetState.hovered,
                            WidgetState.focused,
                          },
                        )?.color,
                      ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
