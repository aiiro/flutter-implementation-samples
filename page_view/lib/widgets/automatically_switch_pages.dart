import 'dart:async';

import 'package:flutter/cupertino.dart';

class AutomaticallySwitchPageView extends StatefulWidget {
  const AutomaticallySwitchPageView({Key? key}) : super(key: key);

  @override
  State<AutomaticallySwitchPageView> createState() =>
      _AutomaticallySwitchPageViewState();
}

class _AutomaticallySwitchPageViewState
    extends State<AutomaticallySwitchPageView> {
  final _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 2) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      } else {
        _pageController.jumpToPage(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height * 0.5,
      width: width,
      child: PageView(
        controller: _pageController,
        onPageChanged: ((int index) {
          setState(() {
            _currentPage = index;
          });
        }),
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("https://picsum.photos/id/237/300/200"),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("https://picsum.photos/id/20/300/200"),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("https://picsum.photos/id/24/300/200"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
