import 'package:flutter/material.dart';
import 'package:grisoft_url_shortening/core/base/base_loader.dart';
import 'package:grisoft_url_shortening/core/extensions/context_extensions.dart';
import 'package:grisoft_url_shortening/core/extensions/string_extensions.dart';
import 'package:grisoft_url_shortening/model/shortly_link.dart';
import 'package:grisoft_url_shortening/ui/app/viewmodel/app_viewmodel.dart';
import 'package:provider/provider.dart';

import 'url_input_area.dart';

class LinkListWidget extends StatelessWidget {
  const LinkListWidget({Key? key}) : super(key: key);

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
                      flex: 6,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            buildTitle(context),
                            ...model.links.map((e) => buildLinkCard(context, e, model)).toList()
                          ],
                        ),
                      ),
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

  Container buildLinkCard(BuildContext context, ShortlyLink link, AppViewModel model) {
    var index = model.links.indexOf(link);
    var copied = index == model.copiedIndex;
    return Container(
      margin: context.paddingNormal,
      padding: EdgeInsets.symmetric(horizontal: context.normalWidthValue),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
            padding: context.paddingLow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(
                  link.originalLink?.checkLength(25) ?? "",
                  style: TextStyle(fontSize: context.customWidthValue(0.05)),
                )),
                IconButton(
                  onPressed: () => model.removeTheLink(link),
                  icon: const Icon(
                    Icons.delete,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 0,
          ),
          Padding(
            padding: context.paddingLow,
            child: SizedBox(
              width: double.infinity,
              child: Text(
                link.shortLink?.checkLength(25) ?? "",
                style: TextStyle(
                  fontSize: context.customWidthValue(0.05),
                  color: const Color(0xFF25D0D0),
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Padding(
            padding: context.paddingLow,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(context.customWidthValue(1), 40),
                primary: copied ? const Color(0xFF382C53) : const Color(0xFF2ACFCF),
              ),
              onPressed: () {
                if (!copied) model.copyShortLink(link);
              },
              child: Text(
                copied ? "COPIED!" : "COPY",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: context.customWidthValue(0.05)),
              ),
            ),
          ),
          SizedBox(
            height: context.customWidthValue(0.05),
          ),
        ],
      ),
    );
  }

  Padding buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.mediumWidthValue),
      child: Text(
        "Your Link History",
        style: TextStyle(
          fontSize: context.customWidthValue(0.05),
        ),
      ),
    );
  }
}
