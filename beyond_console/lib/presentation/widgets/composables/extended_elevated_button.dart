import 'package:beyond_console/common/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ExtendedElevatedButton extends ElevatedButton {
  const ExtendedElevatedButton({
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

  static ExtendedElevatedButton primary(
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
    MaterialStatesController? statesController,
    ButtonStyle? style,
  }) =>
      ExtendedElevatedButton(
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
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return context.colorScheme.primary.withOpacity(0.5);
              } else if (states.contains(MaterialState.disabled)) {
                return context.colorScheme.onSurface.withOpacity(0.12);
              } else {
                return context.colorScheme.primary;
              }
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return context.colorScheme.onPrimary;
              } else if (states.contains(MaterialState.disabled)) {
                return context.colorScheme.onSurface.withOpacity(0.38);
              } else {
                return context.colorScheme.onPrimary;
              }
            },
          ),
        ),
        child: child,
      );

  static ExtendedElevatedButton secondary(
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
    MaterialStatesController? statesController,
    ButtonStyle? style,
  }) =>
      ExtendedElevatedButton(
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
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return context.colorScheme.secondary.withOpacity(0.5);
              } else if (states.contains(MaterialState.disabled)) {
                return context.colorScheme.onSurface.withOpacity(0.12);
              } else {
                return context.colorScheme.secondary;
              }
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return context.colorScheme.onSecondary;
              } else if (states.contains(MaterialState.disabled)) {
                return context.colorScheme.onSurface.withOpacity(0.38);
              } else {
                return context.colorScheme.onSecondary;
              }
            },
          ),
        ),
        child: child,
      );

  static ExtendedElevatedButton tertiary(
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
    MaterialStatesController? statesController,
    ButtonStyle? style,
  }) =>
      ExtendedElevatedButton(
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
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return context.colorScheme.tertiary.withOpacity(0.5);
              } else if (states.contains(MaterialState.disabled)) {
                return context.colorScheme.onSurface.withOpacity(0.12);
              } else {
                return context.colorScheme.tertiary;
              }
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return context.colorScheme.onTertiary;
              } else if (states.contains(MaterialState.disabled)) {
                return context.colorScheme.onSurface.withOpacity(0.38);
              } else {
                return context.colorScheme.onTertiary;
              }
            },
          ),
        ),
        child: child,
      );
}
