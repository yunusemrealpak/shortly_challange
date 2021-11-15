import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grisoft_url_shortening/core/extensions/context_extensions.dart';

class UrlInputArea extends StatefulWidget {
  final String hintText;
  final bool emptyError;
  final Function(String) sendUrl;
  final Function(bool) setError;
  const UrlInputArea(
      {Key? key, required this.emptyError, required this.hintText, required this.sendUrl, required this.setError})
      : super(key: key);

  @override
  State<UrlInputArea> createState() => _UrlInputAreaState();
}

class _UrlInputAreaState extends State<UrlInputArea> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildTextAreaBackground,
        Center(
          child: SizedBox(
            width: context.customWidthValue(0.75),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      errorStyle: const TextStyle(height: 0),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: widget.hintText,
                      hintStyle: TextStyle(
                        fontSize: context.customWidthValue(0.05),
                        color: widget.emptyError ? Colors.red : Colors.grey.shade500,
                        fontWeight: widget.emptyError ? FontWeight.bold : FontWeight.normal,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2.0),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    validator: (text) {
                      if (text?.isEmpty ?? true) {
                        return "";
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: context.customWidthValue(0.03),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(context.customWidthValue(0.75), 50),
                    primary: const Color(0xFF2ACFCF),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.sendUrl(_controller.text);
                    } else {
                      widget.setError(true);
                    }
                  },
                  child: Text(
                    "SHORTEN IT!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: context.customWidthValue(0.055)),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Container get buildTextAreaBackground => Container(
        color: const Color(0xFF3B3054),
        width: context.width,
        alignment: Alignment.topRight,
        child: SvgPicture.asset("assets/images/shape.svg"),
      );
}
