library free_check_box;

import 'package:flutter/material.dart';

class FreeCheckBox extends StatefulWidget {
  const FreeCheckBox({
    Key? key,
    this.isChecked,
    this.checkedWidget,
    this.uncheckedWidget,
    this.checkedColor,
    this.uncheckedColor,
    this.disabledColor,
    this.border,
    this.borderColor,
    this.size,
    this.animationDuration,
    this.isRound = true,
    this.widgetPadding,
    required this.onTap,
  }) : super(key: key);

  final bool? isChecked;

  final Widget? checkedWidget;

  final Widget? uncheckedWidget;

  final Color? checkedColor;

  final Color? uncheckedColor;

  final Color? disabledColor;

  final Border? border;

  final Color? borderColor;

  final double? size;

  final Function(bool?)? onTap;

  final Duration? animationDuration;

  final bool isRound;

  final double? widgetPadding;

  @override
  _FreeCheckBoxState createState() => _FreeCheckBoxState();
}

class _FreeCheckBoxState extends State<FreeCheckBox> {
  bool? isChecked;
  late Duration animationDuration;
  double? size;
  Widget? checkedWidget;
  Widget? uncheckedWidget;
  Color? checkedColor;
  Color? uncheckedColor;
  Color? disabledColor;
  late Color borderColor;
  double? widgetPadding;

  @override
  void initState() {
    isChecked = widget.isChecked ?? false;
    animationDuration =
        widget.animationDuration ?? const Duration(milliseconds: 500);
    size = widget.size ?? 40.0;
    checkedColor = widget.checkedColor ?? Colors.green;
    uncheckedColor = widget.uncheckedColor;
    borderColor = widget.borderColor ?? Colors.grey;
    checkedWidget = widget.checkedWidget ??
        const Icon(
          Icons.check,
          color: Colors.white,
          size: 20,
        );
    uncheckedWidget = widget.uncheckedWidget ?? const SizedBox.shrink();
    widgetPadding = widget.widgetPadding ?? 0;
    super.initState();
  }

  @override
  void didUpdateWidget(FreeCheckBox oldWidget) {
    uncheckedColor =
        widget.uncheckedColor ?? Theme.of(context).scaffoldBackgroundColor;
    if (isChecked != widget.isChecked) {
      isChecked = widget.isChecked ?? false;
    }
    if (animationDuration != widget.animationDuration) {
      animationDuration =
          widget.animationDuration ?? const Duration(milliseconds: 500);
    }
    if (size != widget.size) {
      size = widget.size ?? 40.0;
    }
    if (checkedColor != widget.checkedColor) {
      checkedColor = widget.checkedColor ?? Colors.green;
    }
    if (borderColor != widget.borderColor) {
      borderColor = widget.borderColor ?? Colors.grey;
    }
    if (checkedWidget != widget.checkedWidget) {
      checkedWidget =
          widget.checkedWidget ?? const Icon(Icons.check, color: Colors.white);
    }
    if (uncheckedWidget != widget.uncheckedWidget) {
      uncheckedWidget = widget.uncheckedWidget ?? const SizedBox.shrink();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return widget.onTap != null
        ? GestureDetector(
            onTap: () {
              setState(() => isChecked = !isChecked!);
              widget.onTap!(isChecked);
            },
            child: ClipRRect(
              borderRadius: borderRadius,
              child: AnimatedContainer(
                duration: animationDuration,
                height: size,
                width: size,
                decoration: BoxDecoration(
                  color: isChecked! ? checkedColor : uncheckedColor,
                  border: widget.border ??
                      Border.all(
                        color: borderColor,
                      ),
                  borderRadius: borderRadius,
                ),
                child: isChecked! ? checkedWidget : uncheckedWidget,
              ),
            ),
          )
        : ClipRRect(
            borderRadius: borderRadius,
            child: AnimatedContainer(
              duration: animationDuration,
              height: size,
              width: size,
              decoration: BoxDecoration(
                color: widget.disabledColor ?? Theme.of(context).disabledColor,
                border: widget.border ??
                    Border.all(
                      color: widget.disabledColor ??
                          Theme.of(context).disabledColor,
                    ),
                borderRadius: borderRadius,
              ),
              child: isChecked! ? checkedWidget : uncheckedWidget,
            ),
          );
  }

  BorderRadius get borderRadius {
    if (widget.isRound) {
      return BorderRadius.circular(size! / 2);
    } else {
      return BorderRadius.zero;
    }
  }
}
