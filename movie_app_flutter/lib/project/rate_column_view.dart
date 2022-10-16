import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../common/text_style.dart';

class RateColumnView extends StatefulWidget {
  const RateColumnView({super.key});

  @override
  State<RateColumnView> createState() => _RateColumnViewState();
}

class _RateColumnViewState extends State<RateColumnView> {
  final rateThis = "Rate This";

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //https://stackoverflow.com/questions/54617432/looking-up-a-deactivated-widgets-ancestor-is-unsafe
    //scaffold needs global key + builder needs different context name like dialogContext
    Future<void> showRateDialog() {
      const title = "Movie Rate";
      const rate = "Rate";
      const rateIndex = "Rate index is between 0 and 5.";
      const numberFormatError = "Number format error";
      const cancel = "Cancel";
      const empty = "Empty";
      return showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text(title),
            content: TextFormField(
              controller: _textEditingController,
              autofillHints: const [rate],
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    var message = "";
                    var text = _textEditingController.text;
                    if (text.isNotEmpty) {
                      var rate = int.tryParse(text);
                      if (rate != null && rate >= 0 && rate <= 5) {
                        message = text;
                      } else if (rate != null) {
                        message = rateIndex;
                      } else {
                        message = numberFormatError;
                      }
                    } else {
                      message = empty;
                    }
                    Fluttertoast.showToast(msg: message);
                    Navigator.of(dialogContext).pop();
                  },
                  child: const Text(rate)),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                  child: const Text(cancel))
            ],
          );
        },
      );
    }

    return InkWell(
      onTap: showRateDialog,
      child: Column(
        children: [
          const Icon(Icons.star_border, size: 24),
          Text(
            rateThis,
            style: TextStyleBold().getBoldStyle(14),
          )
        ],
      ),
    );
  }
}
