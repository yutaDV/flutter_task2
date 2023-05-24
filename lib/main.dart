import 'package:flutter/material.dart';
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
      _listOFGards.add(CardInfo(title: 'title $i', numberOfCard: i));
    }
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
              child: CustomCard(cardInfo: _listOFGards[index],),
            );
          },

        ),
      ),
    );
  }
}


class CardInfo {
  final String title;
  final int numberOfCard;
  final String imageUrl;

  CardInfo({
    required this.title,
    required this.numberOfCard,
    this.imageUrl = 'images/like.jpg',
  });
}
