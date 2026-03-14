import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/global_initializer.dart';

class SliverHeader extends StatelessWidget {
  final String text;
  final double expandedHeight;
  final double collapsedFontSize;
  final double expandedFontSize;

  const SliverHeader({super.key, required this.text, this.expandedHeight = 60.0, this.collapsedFontSize = 20, this.expandedFontSize = 20});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: expandedHeight,
      floating: false,
      pinned: true,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // AppBar'ın scroll durumunu hesapla
          final bool isCollapsed = constraints.biggest.height <= kToolbarHeight + MediaQuery.of(context).padding.top;

          return FlexibleSpaceBar(
            titlePadding: appSizer.paddingOnly(left: isCollapsed ? 16.0 : 23.0, bottom: 16.0),
            title: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: appSizer.style(
                color: const Color(0xFF101828),
                fontSize: isCollapsed ? collapsedFontSize : expandedFontSize,
                fontWeight: FontWeight.w700,
                height: 1.5,
                letterSpacing: -0.177,
              ),
              child: Text(text),
            ),
            centerTitle: false,
          );
        },
      ),
    );
  }
}
