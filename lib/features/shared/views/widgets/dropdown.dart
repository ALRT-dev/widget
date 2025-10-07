import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/others/app_colors.dart';

class AlrtDropdown extends ConsumerStatefulWidget {
  const AlrtDropdown({
    super.key,
    required this.button,
    required this.menuContent,
  });

  final Widget button;

  final Widget Function(BuildContext, Function()) menuContent;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AlrtDropdownState();
}

class _AlrtDropdownState extends ConsumerState<AlrtDropdown> {
  OverlayEntry? _entry;
  final _layerLink = LayerLink();

  final _buttonKey = GlobalKey();

  @override
  void dispose() {
    _entry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDropdown,
      child: CompositedTransformTarget(
        link: _layerLink,
        key: _buttonKey,
        child: widget.button,
      ),
    );
  }

  void _showDropdown() {
    context.unfocusInputs();

    final renderBox =
        _buttonKey.currentContext?.findRenderObject() as RenderBox?;
    final buttonSize = renderBox?.size ?? Size.zero;

    _entry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            IgnorePointer(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.transparent,
              ),
            ),
            Positioned(
              child: CompositedTransformFollower(
                link: _layerLink,
                offset: Offset(0, 50.h),
                child: TapRegion(
                  onTapOutside: (event) => _closeDropdown(),
                  child: Material(
                    color: AppColors.transparent,
                    child: Container(
                      width: buttonSize.width,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: AppColors.lightGrey,
                        ),
                      ),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        removeBottom: true,
                        child: widget.menuContent(context, _closeDropdown),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    Overlay.of(context).insert(_entry!);
  }

  void _closeDropdown() {
    _entry?.remove();
    _entry = null;
  }
}
