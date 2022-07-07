import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OneButtonDialog extends StatefulWidget {
  final String title;
  final String content;
  final VoidCallback? onConfirmPressed;

  const OneButtonDialog(
      {Key? key,
      required this.title,
      required this.content,
      this.onConfirmPressed})
      : super(key: key);

  @override
  State<OneButtonDialog> createState() => _OneButtonDialogState();
}

class _OneButtonDialogState extends State<OneButtonDialog>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Dialog(
        child: Builder(
          builder: (BuildContext context) {
            return SizedBox(
              width: MediaQuery.of(context).size.width - 90,
              height: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(widget.title,
                      style: const TextStyle(fontSize: 14, color: Colors.blue)),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 120,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(widget.content,
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.blue)),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      widget.onConfirmPressed ?? Get.back();
                    },
                    child: const SizedBox(
                      width: 52,
                      height: 37,
                      child: Center(
                        child: Text('확인',
                            style: TextStyle(fontSize: 16, color: Colors.blue)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
