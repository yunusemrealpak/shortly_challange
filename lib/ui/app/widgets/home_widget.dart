import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grisoft_url_shortening/core/base/base_loader.dart';
import 'package:grisoft_url_shortening/core/extensions/context_extensions.dart';
import 'package:grisoft_url_shortening/ui/app/viewmodel/app_viewmodel.dart';
import 'package:grisoft_url_shortening/ui/app/widgets/url_input_area.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, model, _) => Scaffold(
        backgroundColor: const Color(0xFFEFF1F7),
        body: BaseLoader(
          state: model.state,
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
              child: SizedBox(
                height: context.height - context.topPadding,
                child: Column(
                  children: [
                    Expanded(
                      child: SvgPicture.asset(
                        "assets/logo/logo.svg",
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: SvgPicture.asset(
                        "assets/images/illustration.svg",
                        fit: BoxFit.cover,
                        width: context.width,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: buildInfoArea,
                    ),
                    Expanded(
                      flex: 2,
                      child: UrlInputArea(
                        hintText: model.hintText,
                        emptyError: model.emptyError,
                        sendUrl: model.shortenTheLink,
                        setError: model.setEmptyError,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column get buildInfoArea {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Let's get started!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: context.customWidthValue(0.055),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: context.customWidthValue(0.02),
        ),
        SizedBox(
          width: context.customWidthValue(0.6),
          child: Text(
            "Paste your first link into the field to shorten it",
            style: TextStyle(
              fontSize: context.customWidthValue(0.05),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
