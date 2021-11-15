
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../core/extensions/context_extensions.dart';
import '../enum/types.dart';
import 'blur_loading.dart';

class BaseLoader extends StatelessWidget {
  final Widget child;
  final ViewState state;
  final bool showTextArea;
  final String loaderText;
  const BaseLoader(
      {Key? key, required this.child, required this.state, this.showTextArea = false, this.loaderText = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Visibility(
          visible: state == ViewState.Busy,
          child: showTextArea
              ? Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: context.customWidthValue(0.7),
                    height: context.customWidthValue(0.3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SpinKitCircle(color: context.theme.primaryColor),
                        Text(loaderText),
                      ],
                    ),
                  ),
                )
              : BlurLoading(),
        ),
      ],
    );
  }
}
