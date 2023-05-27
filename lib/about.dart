import 'package:flutter/material.dart';
import 'main.dart';


class AboutPage extends StatefulWidget {
  final CardInfo cardInfo;

  const AboutPage({Key? key, required this.cardInfo}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
 late TextEditingController controller;
 late CardInfo cardInfo2;

 @override
 void initState() {
   cardInfo2 = CardInfo(
       title: widget.cardInfo.title,
       id: widget.cardInfo.id,
     imageUrl: widget.cardInfo.imageUrl,
   );

   controller = TextEditingController(text: cardInfo2.title);

    super.initState();
 }
 void save(){
   cardInfo2.title = controller.text;
 }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter layout demo'),
      ),
      body: SafeArea (
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
              widget.cardInfo.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
          ),
          const SizedBox(height: 32,),
          TextField(controller: controller,),
          ElevatedButton(
              onPressed: () {
                save();
                print('ok');
                Navigator.of(context).pop(cardInfo2);
              },
              child: const Text('Save'),
          )
        ],
      ),
    ),
    );
  }
}
