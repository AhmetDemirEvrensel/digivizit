import 'dart:ui';

import 'package:digivizit/shared/components/containers/figma_container.dart';
import 'package:digivizit/shared/components/loader/hexagon_loader2.dart';
import 'package:flutter/material.dart';

class AsyncProcessLoader extends StatelessWidget {
  const AsyncProcessLoader({super.key});
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
      child: FigmaContainer(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromRGBO(15, 15, 15, 0.60),
        child: Center(child: HexagonLoaderScreen2()),
      ),
    );
  }
}
