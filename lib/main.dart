import 'package:flutter/material.dart';
import 'package:flutter_task2/about.dart';
import 'customer_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<CardInfo> _listOFGards =[];

  @override
  void initState() {
    genereteGardInfo();

    super.initState();
  }

  void genereteGardInfo() {
    for (int i = 0; i < 20; i++) {
      _listOFGards.add(CardInfo(title: 'title $i', id: i));
    }
  }

  void updateCard (CardInfo newCardInfo){
    setState(() {
      _listOFGards[newCardInfo.id] = newCardInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: ListView.builder(
          itemCount: _listOFGards.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomCard(cardInfo: _listOFGards[index],
              onTap:() async {
                final newCardInfo = await Navigator.push<CardInfo>(
                  context,
                  MaterialPageRoute(
                  builder: (_) => AboutPage (
                    cardInfo: _listOFGards[index],
                    ),
                  ),
                );

                if (newCardInfo != null) {
                  print(newCardInfo.title);
                  updateCard(newCardInfo);
                }
              },
              ),
            );
          },

        ),
      ),
    );
  }
}


class CardInfo {
  String title;
  final int id;
  final String imageUrl;

  CardInfo({
    required this.title,
    required this.id,
    this.imageUrl = 'images/like.jpg',
  });
}
