import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../core/extensions/context_extensions.dart';

class BlurLoading extends StatelessWidget {
  final Color? color;
  final EdgeInsets? padding;
  const BlurLoading({Key? key, this.padding, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
          ),
          child: Center(
            child: SpinKitCircle(color: color ?? context.theme.primaryColor),
          ),
        ),
      ),
    );
  }
}
