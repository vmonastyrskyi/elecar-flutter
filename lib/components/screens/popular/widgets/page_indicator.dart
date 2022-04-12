import 'package:elecar/app_colors.dart';
import 'package:elecar/components/shared_widgets/separated_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PageIndicator extends StatefulWidget {
  const PageIndicator({
    Key? key,
    required this.count,
  }) : super(key: key);

  final int count;

  @override
  PageIndicatorState createState() => PageIndicatorState();
}

class PageIndicatorState extends State<PageIndicator> {
  final double _indicatorWidth = 8.0;
  final double _indicatorHeight = 8.0;
  final double _spaceBetween = 8.0;

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _indicatorHeight,
      width: (_indicatorWidth * 5) + (_spaceBetween * 4),
      child: Scrollable(
        physics: const NeverScrollableScrollPhysics(),
        viewportBuilder: (_, position) {
          return Viewport(
            cacheExtent: 1.0,
            cacheExtentStyle: CacheExtentStyle.viewport,
            axisDirection: AxisDirection.right,
            clipBehavior: Clip.none,
            offset: ViewportOffset.fixed(
                (_indicatorWidth + _spaceBetween) * _currentIndex),
            anchor: 0.5,
            slivers: [
              SliverToBoxAdapter(
                child: SeparatedRow(
                  mainAxisSize: MainAxisSize.min,
                  separator: const SizedBox(width: 8.0),
                  children: [
                    for (int i = 0; i < widget.count; i++) _buildIndicator(i),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void setCurrentIndex(int index) {
    setState(() => _currentIndex = index);
  }

  Widget _buildIndicator(int index) {
    final selected = _currentIndex == index;

    var scale = 0.0;
    if (index == _currentIndex) {
      scale = 1.0;
    } else if ((_currentIndex - index).abs() == 1) {
      scale = 0.75;
    } else if ((_currentIndex - index).abs() == 2) {
      scale = 0.5;
    }

    return SizedBox(
      width: _indicatorWidth,
      height: _indicatorHeight,
      child: Center(
        child: Container(
          width: _indicatorWidth * scale,
          height: _indicatorHeight * scale,
          decoration: BoxDecoration(
            color: selected ? AppColors.primaryColor : AppColors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
