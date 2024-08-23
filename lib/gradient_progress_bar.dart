library gradient_progress_bar;

import 'package:flutter/material.dart';

class GradientProgressIndicator extends StatefulWidget {
  final List<Color> colors;
  final Color backgroundColor;
  final Duration animationDuration;

  final double value;

  const GradientProgressIndicator({
    super.key,
    required this.colors,
    required this.value,
    this.backgroundColor = const Color(0x55FFC56F),
    this.animationDuration = const Duration(seconds: 1),
  });

  @override
  _GradientProgressIndicatorState createState() =>
      _GradientProgressIndicatorState();
}

class _GradientProgressIndicatorState extends State<GradientProgressIndicator> {
  double _value = 0.0;

  @override
  void didUpdateWidget(GradientProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        final widthToApply = availableWidth * _value;

        return Container(
          height: 10,
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          ),
          child: Row(
            children: [
              AnimatedContainer(
                curve: Curves.linear,
                duration: widget.animationDuration,
                width: widthToApply,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  child: _GradientProgressInternal(
                    widget.colors,
                    _value,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class _GradientProgressInternal extends StatelessWidget {
  static const double _kLinearProgressIndicatorHeight = 10.0;
  final List<Color> colors;
  final double value;

  const _GradientProgressInternal(this.colors, this.value);

  @override
  Widget build(BuildContext context) {
    int colorsCount = (colors.length * value).toInt();
    final colorsToApply = colors.sublist(0, colorsCount);
    if (colorsToApply.isEmpty) {
      return Container();
    }
    if (colorsToApply.length < 2) colorsToApply.add(colors[0]);

    return Container(
      constraints: const BoxConstraints.tightFor(
        width: double.infinity,
        height: _kLinearProgressIndicatorHeight,
      ),
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: colorsToApply)),
    );
  }
}
