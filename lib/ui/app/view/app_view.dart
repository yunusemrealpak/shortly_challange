import 'package:flutter/material.dart';
import 'package:grisoft_url_shortening/core/base/base_view.dart';
import 'package:grisoft_url_shortening/ui/app/viewmodel/app_viewmodel.dart';
import 'package:grisoft_url_shortening/ui/app/widgets/home_widget.dart';
import 'package:grisoft_url_shortening/ui/app/widgets/link_list_widget.dart';

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  var _formKey = GlobalKey<FormState>();
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
    return BaseView<AppViewModel>(
      viewModel: AppViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      builder: (context, model, _) => model.showList ? const LinkListWidget() : const HomeWidget(),
    );
  }

  
}
