import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class SomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SomeWidgetState();
}

class _SomeWidgetState extends State<SomeWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // doWhatWhenAppResumed();
      dev.log('The application is visible and responding to user input.');
    } else if (state == AppLifecycleState.inactive) {
      // doWhatWhenAppInactive();
      dev.log(
          'The application is in an inactive state and is not receiving user input.');
    } else if (state == AppLifecycleState.paused) {
      // doWhatWhenAppPaused();
      dev.log(
          'The application is not currently visible to the user, not responding to user input, and running in the background.');
    } else if (state == AppLifecycleState.detached) {
      // doWhatWhenAppDetached();
      dev.log(
          'The application is still hosted on a flutter engine but is detached from any host views.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
