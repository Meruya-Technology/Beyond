import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double percentage;
  final Color? fillColor;
  final Color? emptyColor;
  final Color? borderColor;

  const ProgressBar({
    this.percentage = 0,
    this.fillColor,
    this.emptyColor,
    this.borderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: (borderColor != null)
            ? Border.all(
                color: borderColor ?? Colors.white,
                width: 2,
              )
            : null,
      ),
      child: LayoutBuilder(
        builder: (context, constrain) => Visibility(
          visible: percentage != 0.0 && percentage < 100.0,
          replacement: progressBar(
            context,
            maxWidth: constrain.maxWidth,
            percentage: 100,
            borderRadius: BorderRadius.circular(8),
            color: (percentage > 0)
                ? (fillColor ?? defaultColor(context))
                : (emptyColor ?? defaultColor(context).withOpacity(0.25)),
          ),
          child: Row(
            children: [
              progressBar(
                context,
                maxWidth: constrain.maxWidth,
                percentage: percentage,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                color: fillColor ?? defaultColor(context),
              ),
              progressBar(
                context,
                maxWidth: constrain.maxWidth,
                percentage: 100 - percentage,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                color: emptyColor ?? defaultColor(context).withOpacity(0.25),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget progressBar(
    BuildContext context, {
    required double maxWidth,
    required double percentage,
    required BorderRadiusGeometry borderRadius,
    required Color color,
  }) {
    return Container(
      height: 12,
      width: barWidth(
        maxWidth,
        percentage,
      ),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: color,
      ),
    );
  }

  double barWidth(
    double maxWidth,
    double percentage,
  ) =>
      (maxWidth / 100) * percentage;

  Color defaultColor(context) {
    if (percentage >= 90) {
      return Colors.red;
    } else if (percentage >= 75) {
      return Colors.orange;
    } else if (percentage >= 50) {
      return Colors.amber;
    } else if (percentage >= 25) {
      return Colors.yellow;
    } else if (percentage >= 1) {
      return Colors.green;
    } else {
      return Colors.green.withOpacity(0.25);
    }
  }
}
