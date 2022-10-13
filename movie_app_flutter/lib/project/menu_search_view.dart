import 'package:flutter/material.dart';

import '../common/images_path.dart';

class MenuSearchView extends StatefulWidget {
  const MenuSearchView(
      {super.key,
      required this.textEditingController,
      required this.onTap,
      required this.onChanged,
      required this.callClear});

  final TextEditingController textEditingController;
  final Function() onTap;
  final Function(String) onChanged;
  final Function() callClear;
  @override
  State<MenuSearchView> createState() => _MenuSearchViewState();
}

class _MenuSearchViewState extends State<MenuSearchView> {
  bool _textFormFieldVisibility = false;
  void toggleTextFormVisibility() {
    setState(() {
      _textFormFieldVisibility = !_textFormFieldVisibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    final text = "Search Movies";
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () {
                widget.onTap();
              },
              child: Image(image: AssetImage(ImagesPath.menu.getPath()))),
          if (_textFormFieldVisibility)
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextFormField(
                controller: widget.textEditingController,
                onChanged: (value) {
                  widget.onChanged(value);
                },
                decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: () {
                          widget.callClear();
                        },
                        icon: const Icon(Icons.clear)),
                    labelText: text),
              ),
            ),
          InkWell(
              onTap: toggleTextFormVisibility,
              child: Image(image: AssetImage(ImagesPath.search.getPath())))
        ],
      ),
    );
  }
}
