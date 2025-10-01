import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';

extension WidgetExt on Widget {
  Widget onPressed(
    final Function()? onPressed, {
    final bool changeCursor = true,
    final HitTestBehavior behaviour = HitTestBehavior.opaque,
  }) =>
      MouseRegion(
        cursor: changeCursor ? SystemMouseCursors.click : MouseCursor.defer,
        child: GestureDetector(
          onTap: onPressed,
          behavior: behaviour,
          child: this,
        ),
      );
  Widget onPressedDown(final Function(TapDownDetails)? onPressed) =>
      GestureDetector(
        onTapDown: onPressed,
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  Widget onPressedUp(final Function(TapUpDetails)? onPressed) =>
      GestureDetector(
        onTapUp: onPressed,
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  Widget onLongPressed(final Function()? onLongPressed) => GestureDetector(
        onLongPress: onLongPressed,
        behavior: HitTestBehavior.opaque,
        child: this,
      );

  Widget pX(double val) => Padding(
        padding: EdgeInsets.symmetric(horizontal: val.spMin),
        child: this,
      );

  Widget pY(double val) => Padding(
        padding: EdgeInsets.symmetric(vertical: val.spMin),
        child: this,
      );

  Widget pXY(double x, double y) => Padding(
        padding: EdgeInsets.symmetric(vertical: y.spMin, horizontal: x.spMin),
        child: this,
      );

  Widget pT(double val) => Padding(
        padding: EdgeInsets.only(top: val.spMin),
        child: this,
      );

  Widget pL(double val) => Padding(
        padding: EdgeInsets.only(left: val.spMin),
        child: this,
      );

  Widget pR(double val) => Padding(
        padding: EdgeInsets.only(right: val.spMin),
        child: this,
      );

  Widget pB(double val) => Padding(
        padding: EdgeInsets.only(bottom: val.spMin),
        child: this,
      );

  Widget pNT(double val) => Padding(
        padding: EdgeInsets.only(
          bottom: val.spMin,
          left: val.spMin,
          right: val.spMin,
        ),
        child: this,
      );

  Widget pNL(double val) => Padding(
        padding: EdgeInsets.only(
          top: val.spMin,
          bottom: val.spMin,
          right: val.spMin,
        ),
        child: this,
      );

  Widget pNR(double val) => Padding(
        padding: EdgeInsets.only(
          top: val.spMin,
          bottom: val.spMin,
          left: val.spMin,
        ),
        child: this,
      );

  Widget pNB(double val) => Padding(
        padding: EdgeInsets.only(
          top: val.spMin,
          left: val.spMin,
          right: val.spMin,
        ),
        child: this,
      );

  Widget pad(double val) => Padding(
        padding: EdgeInsets.all(val.spMin),
        child: this,
      );

  Widget get sliverBox => SliverToBoxAdapter(
        key: key,
        child: this,
      );

  Widget toSizedBox({
    final double? width,
    final double? height,
  }) =>
      SizedBox(
        key: key,
        width: width?.spMin,
        height: height?.spMin,
        child: Center(child: this),
      );

  /// Wraps the widget with a [GestureDetector] that dismisses the keyboard.
  ///
  /// The [requestFocusNode] can be used to request focus on a specific [FocusNode] after the keyboard is dismissed.
  Widget keyboardDismisser(
    final BuildContext context, {
    final FocusNode? requestFocusNode,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.unfocusInputs();
        if (requestFocusNode != null) {
          context.requestFocusOnInputs(focusNode: requestFocusNode);
        }
      },
      child: this,
    );
  }

  /// A wrapper that can be used to hide the scrollbar of a [ListView].
  Widget hideScrollbarWrap(
    final BuildContext context,
  ) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false,
      ),
      child: this,
    );
  }

  /// A wrapper that is used to provide the semantic label for a widget.
  Widget withSemanticsLabel(
    final String? label, {
    final bool? enabled,
  }) {
    return Semantics(
      label: label,
      enabled: enabled,
      child: this,
    );
  }

  /// A wrapper that is used to disable the semantics of a widget.
  Widget disableSemantics() {
    return Semantics(
      excludeSemantics: true,
      child: this,
    );
  }

  /// A wrappper to add positioned widget
  Widget positioned({
    final double? top,
    final double? bottom,
    final double? left,
    final double? right,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: this,
    );
  }

  Widget posT(double val) => Positioned(
        top: val,
        child: this,
      );
  Widget posL(double val) => Positioned(
        left: val,
        child: this,
      );
  Widget posR(double val) => Positioned(
        right: val,
        child: this,
      );
  Widget posB(double val) => Positioned(
        bottom: val,
        child: this,
      );
}
