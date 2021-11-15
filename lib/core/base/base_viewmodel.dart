
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grisoft_url_shortening/core/enum/notification_type.dart';
import 'package:grisoft_url_shortening/core/extensions/context_extensions.dart';

import '../enum/types.dart';

abstract class BaseViewModel with ChangeNotifier {
  BuildContext? context;

  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  bool disposed = false;

  setContext(BuildContext context) => this.context = context;

  setState(ViewState state) {
    _state = state;
    if (!disposed) notifyListeners();
  }
  
  saveChanges(){
    if (!disposed) notifyListeners();
  }
  
  showNotification(NotificationType type, String message,
      {Color? customColor}) {
    var color = type == NotificationType.ERROR ? Colors.red : Colors.green;
    BotToast.showAttachedWidget(
      attachedBuilder: (_) => Container(
        width: context!.width,
        padding: EdgeInsets.only(top: context!.customWidthValue(0.15)),
        child: Container(
          color: customColor ?? color,
          width: context!.customWidthValue(1),
          height: context!.customHeightValue(0.07),
          child: Center(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      duration: const Duration(milliseconds: 2000),
      target: const Offset(0, 0),
    );
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }
}
