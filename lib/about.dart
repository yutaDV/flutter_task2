import 'package:flutter/material.dart';
import 'main.dart';

class AboutPage extends StatefulWidget {
  final CardInfo cardInfo;

  const AboutPage({Key? key, required this.cardInfo}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter layout demo'),
      ),
      body: SafeArea (
      child: Column(
        children: [
          Image.asset(
              widget.cardInfo.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
          ),
        ],
      ),
    ),
    );
  }
}
