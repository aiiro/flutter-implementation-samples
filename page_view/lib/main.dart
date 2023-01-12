import 'package:flutter/material.dart';
import 'package:page_view/widgets/automatically_switch_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PageView Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("PageView Sample"),
        ),
        body: MyPageViewList(),
        // body: const MyPageViewWidget(),
      ),
    );
  }
}

class MyPageViewListItem {
  final String title;
  final Scaffold route;

  MyPageViewListItem({required this.title, required this.route});
}

class MyPageViewList extends StatelessWidget {
  final List<MyPageViewListItem> items = [
    MyPageViewListItem(
      title: "Automatically Switch Pages",
      route: Scaffold(
        appBar: AppBar(
          title: const Text("Automatically Switch Pages"),
        ),
        body: const AutomaticallySwitchPageView(),
      ),
    ),
  ];

  MyPageViewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                ),
                title: Text(
                  items[index].title,
                  style: TextStyle(
                    fontSize: height * 0.02,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => items[index].route,
                    ),
                  );
                },
              ),
              Divider(
                color: Colors.grey.shade500,
              ),
            ],
          );
        },
      ),
    );
  }
}
