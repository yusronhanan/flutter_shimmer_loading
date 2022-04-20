// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CardSlider extends StatelessWidget {
  final String textTitle;
  final bool isVisible;
  final List<String> itemList;
  final void Function(String) onTapCallback;

  CardSlider(
      {required this.textTitle,
      required this.itemList,
      required this.onTapCallback,
      this.isVisible = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        children: <Widget>[
          Row(children: [
            Text(textTitle,
                style: const TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            const Spacer(),
            Visibility(
              visible: isVisible,
              child: IconButton(
                icon:
                    const Icon(Icons.keyboard_arrow_right, color: Colors.black),
                onPressed: () => {onTapCallback('MORE')},
              ),
            ),
          ]),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print(index);
                        },
                        child: FlatButton(
                          onPressed: null,
                          padding: EdgeInsets.all(0.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.width * 0.2,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.network(
                                itemList[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
