import 'package:beyond_console/common/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ExtendedOutlinedButton extends OutlinedButton {
  const ExtendedOutlinedButton({
    super.key,
    required super.onPressed,
    required super.child,
    super.autofocus,
    super.clipBehavior,
    super.focusNode,
    super.onFocusChange,
    super.onHover,
    super.onLongPress,
    super.statesController,
    super.style,
  });

  static ExtendedOutlinedButton primary(
    BuildContext context, {
    Key? key,
    required Function() onPressed,
    required Widget child,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    FocusNode? focusNode,
    Function(bool)? onFocusChange,
    Function(bool)? onHover,
    Function()? onLongPress,
    WidgetStatesController? statesController,
    ButtonStyle? style,
  }) =>
      ExtendedOutlinedButton(
        key: key,
        onPressed: onPressed,
        autofocus: autofocus,
        focusNode: focusNode,
        onFocusChange: onFocusChange,
        onHover: onHover,
        onLongPress: onLongPress,
        clipBehavior: clipBehavior,
        statesController: statesController,
        style: context.theme.elevatedButtonTheme.style?.copyWith(
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.transparent;
              } else if (states.contains(WidgetState.disabled)) {
                return context.colorScheme.onSurface.withOpacity(0.12);
              } else {
                return Colors.transparent;
              }
            },
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return context.colorScheme.onSurface;
              } else if (states.contains(WidgetState.disabled)) {
                return context.colorScheme.primary.withOpacity(0.38);
              } else {
                return context.colorScheme.primary;
              }
            },
          ),
          side: WidgetStateProperty.resolveWith(
            (states) {
              return BorderSide(
                color: context.colorScheme.primary,
                width: 1,
              );
            },
          ),
        ),
        child: child,
      );

  static ExtendedOutlinedButton secondary(
    BuildContext context, {
    Key? key,
    required Function() onPressed,
    required Widget child,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    FocusNode? focusNode,
    Function(bool)? onFocusChange,
    Function(bool)? onHover,
    Function()? onLongPress,
    WidgetStatesController? statesController,
    ButtonStyle? style,
  }) =>
      ExtendedOutlinedButton(
        key: key,
        onPressed: onPressed,
        autofocus: autofocus,
        focusNode: focusNode,
        onFocusChange: onFocusChange,
        onHover: onHover,
        onLongPress: onLongPress,
        clipBehavior: clipBehavior,
        statesController: statesController,
        style: context.theme.elevatedButtonTheme.style?.copyWith(
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.transparent;
              } else if (states.contains(WidgetState.disabled)) {
                return context.colorScheme.onSurface.withOpacity(0.12);
              } else {
                return Colors.transparent;
              }
            },
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return context.colorScheme.onSurface;
              } else if (states.contains(WidgetState.disabled)) {
                return context.colorScheme.secondary.withOpacity(0.38);
              } else {
                return context.colorScheme.secondary;
              }
            },
          ),
          side: WidgetStateProperty.resolveWith(
            (states) {
              return BorderSide(
                color: context.colorScheme.secondary,
                width: 1,
              );
            },
          ),
        ),
        child: child,
      );

  static ExtendedOutlinedButton tertiary(
    BuildContext context, {
    Key? key,
    required Function() onPressed,
    required Widget child,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    FocusNode? focusNode,
    Function(bool)? onFocusChange,
    Function(bool)? onHover,
    Function()? onLongPress,
    WidgetStatesController? statesController,
    ButtonStyle? style,
  }) =>
      ExtendedOutlinedButton(
        key: key,
        onPressed: onPressed,
        autofocus: autofocus,
        focusNode: focusNode,
        onFocusChange: onFocusChange,
        onHover: onHover,
        onLongPress: onLongPress,
        clipBehavior: clipBehavior,
        statesController: statesController,
        style: context.theme.elevatedButtonTheme.style?.copyWith(
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.transparent;
              } else if (states.contains(WidgetState.disabled)) {
                return context.colorScheme.tertiary.withOpacity(0.12);
              } else {
                return Colors.transparent;
              }
            },
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return context.colorScheme.onSurface;
              } else if (states.contains(WidgetState.disabled)) {
                return context.colorScheme.onSurface.withOpacity(0.38);
              } else {
                return context.colorScheme.tertiary;
              }
            },
          ),
          side: WidgetStateProperty.resolveWith(
            (states) {
              return BorderSide(
                color: context.colorScheme.tertiary,
                width: 1,
              );
            },
          ),
        ),
        child: child,
      );
}
