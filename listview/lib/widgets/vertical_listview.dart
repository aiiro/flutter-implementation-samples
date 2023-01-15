import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTileItem {
  final String title;

  const ListTileItem({
    required this.title,
  });
}

class ListItemData {
  final List<String> alphabets = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
  ];

  ListItemData();
}

class VerticalListView extends StatelessWidget {
  const VerticalListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ListItemData itemData = ListItemData();

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: itemData.alphabets.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 50,
          child: ListTile(
            onTap: () {
              print("${itemData.alphabets[index]} is tapped.");
            },
            title: Center(
              child: Text(
                itemData.alphabets[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
