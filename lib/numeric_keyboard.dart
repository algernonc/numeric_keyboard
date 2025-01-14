library numeric_keyboard;

import 'package:flutter/material.dart';

typedef KeyboardTapCallback = void Function(String text);

class NumericKeyboard extends StatefulWidget {
  /// Color of the text [default = Colors.black]
  final Color textColor;

  /// Display a custom right icon
  final Image? rightIcon;

  /// Action to trigger when right button is pressed
  final Function()? rightButtonFn;

  /// Display a custom left icon
  final Image? leftIcon;

  /// Action to trigger when left button is pressed
  final Function()? leftButtonFn;

  /// Callback when an item is pressed
  final KeyboardTapCallback onKeyboardTap;

  /// Main axis alignment [default = MainAxisAlignment.spaceEvenly]
  final MainAxisAlignment mainAxisAlignment;

  NumericKeyboard(
      {Key? key,
      required this.onKeyboardTap,
      this.textColor = Colors.black,
      this.rightButtonFn,
      this.rightIcon,
      this.leftButtonFn,
      this.leftIcon,
      this.mainAxisAlignment = MainAxisAlignment.spaceEvenly})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NumericKeyboardState();
  }
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      padding: const EdgeInsets.only(bottom: 20, left: 25, right: 25),
      color: Colors.black.withOpacity(.5),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('1'),
              _calcButton('2'),
              _calcButton('3'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('4'),
              _calcButton('5'),
              _calcButton('6'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('7'),
              _calcButton('8'),
              _calcButton('9'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              InkWell(
                  borderRadius: BorderRadius.circular(45),
                  onTap: widget.leftButtonFn,
                  child: Container(
                      alignment: Alignment.center,
                      width: 85,
                      height: 85,
                      child: widget.leftIcon)),
              _calcButton('0'),
              InkWell(
                  borderRadius: BorderRadius.circular(120),
                  onTap: widget.rightButtonFn,
                  child: Container(
                      alignment: Alignment.center,
                      width: 85,
                      height: 85,
                      child: widget.rightIcon))
            ],
          ),
        ],
      ),
    );
  }

  Widget _calcButton(String value) {
    return InkWell(
        borderRadius: BorderRadius.circular(120),
        onTap: () {
          widget.onKeyboardTap(value);
        },
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/keyboardkeys/keypadButtonBackground.png'),)),
          alignment: Alignment.center,
          width: 85,
          height: 85,
          child: Text(
            value,
            style: TextStyle(
                fontFamily: 'RacingSansOne',
                fontSize: 40,
                // fontWeight: FontWeight.bold,
                color: const Color(0xFFB3574DB)),
          ),
        ));

    // return InkWell(
    //     image: AssetImage('assets/keyboardkeys/keypadButtonBackground.png'),
    //     borderRadius: BorderRadius.circular(45),
    //     onTap: () {
    //       widget.onKeyboardTap(value);
    //     },
    //     child: Container(
    //       alignment: Alignment.center,
    //       width: 50,
    //       height: 50,
    //       child: Text(
    //         value,
    //         style: TextStyle(
    //             fontSize: 26,
    //             fontWeight: FontWeight.bold,
    //             color: widget.textColor),
    //       ),
    //     ));
  }
}
