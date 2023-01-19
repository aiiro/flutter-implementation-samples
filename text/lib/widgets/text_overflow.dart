import 'package:flutter/cupertino.dart';

class MyTextOverflowEllipsis extends StatelessWidget {
  const MyTextOverflowEllipsis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(top: height * 0.2, left: width * 0.05),
      child: const Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        style: TextStyle(
          fontSize: 20.0,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
