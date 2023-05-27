import 'package:flutter/material.dart';
import 'about.dart';
import 'main.dart';

class CustomCard extends StatelessWidget {
  final CardInfo cardInfo;
  final VoidCallback onTap;

  const CustomCard({Key? key, required this.cardInfo, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget titleSection() {
      return Positioned(
        bottom: 0,
        left: 16,
        right: 16,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child:  Text(cardInfo.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.star,
                color: Colors.red[500],
              ),
              const Text(
                '41',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget _buildButtonColumn(Color color, IconData icon, String label) {
      return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      );
    }


    Widget buttonSection() {
      return Positioned(
        top: 16,
        right: 16,
        child: Container(
          color: Colors.white.withOpacity(0.7),
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
              SizedBox(width: 16),
              _buildButtonColumn(Colors.green, Icons.near_me, 'ROUTE'),
              SizedBox(width: 16),
              _buildButtonColumn(Colors.black, Icons.share, 'SHARE'),
            ],
          ),
        ),
      );
    }

    Widget buildImageStack(int imageNumber) {
      return Stack(
        children: [
          Image.asset(
            cardInfo.imageUrl,
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection(),
          buttonSection(),
          Positioned(
            top: 16,
            left: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>  AboutPage(cardInfo: cardInfo),
                ),
                );
              },
            child:Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '#${cardInfo.id}.',
                  style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white)
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return buildImageStack(cardInfo.id);
  }

// Rest of the code for _buildButtonColumn method and other helper methods...
}
