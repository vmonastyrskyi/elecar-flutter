import 'package:elecar/extensions/sizer.dart';
import 'package:elecar/extensions/widget.dart';
import 'package:elecar/utils/disallow_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'page_indicator.dart';

class PopularCarsView extends StatefulWidget {
  const PopularCarsView({
    Key? key,
    required this.options,
    required this.items,
  }) : super(key: key);

  final PopularCarsViewOptions options;
  final List<Widget> items;

  @override
  _PopularCarsViewState createState() => _PopularCarsViewState();
}

class _PopularCarsViewState extends State<PopularCarsView> {
  static const PageScrollPhysics _pageScrollPhysics = PageScrollPhysics();

  final GlobalKey<PageIndicatorState> _pageIndicatorKey = GlobalKey();
  final ScrollPhysics _physics = const _ForceImplicitScrollPhysics(
    allowImplicitScrolling: true,
  ).applyTo(_pageScrollPhysics);

  late final PageController _pageController = PageController(
    viewportFraction: widget.options.viewportFraction,
    initialPage: 0,
  );

  int _lastReportedPage = 0;

  @override
  Widget build(BuildContext context) {
    final axisDirection = _getDirection();

    return Column(
      children: [
        SizedBox(
          height: widget.options.height + (widget.options.spaceBetween * 2),
          child: OverflowBox(
            maxWidth: 100.w,
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.depth == 0 &&
                    notification is ScrollUpdateNotification) {
                  final metrics = notification.metrics as PageMetrics;
                  final currentPage = metrics.page!.round();
                  if (currentPage != _lastReportedPage) {
                    _pageIndicatorKey.currentState
                        ?.setCurrentIndex(_lastReportedPage = currentPage);
                  }
                }
                return false;
              },
              child: DisallowGlow(
                child: Scrollable(
                  physics: _physics,
                  controller: _pageController,
                  axisDirection: axisDirection,
                  viewportBuilder: (_, position) {
                    return Viewport(
                      cacheExtent: 1.0,
                      cacheExtentStyle: CacheExtentStyle.viewport,
                      axisDirection: axisDirection,
                      clipBehavior: Clip.none,
                      offset: position,
                      slivers: [
                        SliverFillViewport(
                          viewportFraction: _pageController.viewportFraction,
                          delegate: SliverChildBuilderDelegate(
                            (_, index) {
                              return _wrapItem(widget.items[index], index);
                            },
                            childCount: widget.items.length,
                          ),
                          padEnds: true,
                        ),
                      ],
                    );
                  },
                ).withPaddingSymmetric(widget.options.spaceBetween / 2.0, 0.0),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24.0),
        PageIndicator(
          key: _pageIndicatorKey,
          count: widget.items.length,
        ),
      ],
    );
  }

  Widget _wrapItem(Widget item, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.options.borderRadius),
      child: item,
    ).withPaddingSymmetric(widget.options.spaceBetween / 2.0, 0.0);
  }

  AxisDirection _getDirection() {
    final textDirection = Directionality.of(context);
    return textDirectionToAxisDirection(textDirection);
  }
}

class PopularCarsViewOptions {
  PopularCarsViewOptions({
    required this.height,
    this.spaceBetween = 0.0,
    this.borderRadius = 0.0,
    this.viewportFraction = 1.0,
  });

  final double height;
  final double spaceBetween;
  final double borderRadius;
  final double viewportFraction;
}

class _ForceImplicitScrollPhysics extends ScrollPhysics {
  const _ForceImplicitScrollPhysics({
    required this.allowImplicitScrolling,
    ScrollPhysics? parent,
  }) : super(parent: parent);

  @override
  _ForceImplicitScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return _ForceImplicitScrollPhysics(
      allowImplicitScrolling: allowImplicitScrolling,
      parent: buildParent(ancestor),
    );
  }

  @override
  final bool allowImplicitScrolling;
}
