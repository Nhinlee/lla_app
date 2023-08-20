import 'package:flutter/material.dart';

class TopicsScreen extends StatefulWidget {
  const TopicsScreen({super.key});

  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  final topcisList = [
    "Home",
    "Food",
    "Transportation",
    "Shopping",
  ];

  final bgColorList = [
    Colors.purple,
    Color(0xFFDB6D6D),
    Color(0xFFE7B768),
  ];

  final overlayColorList = [
    Color(0xFFFDCC4A).withOpacity(0.8),
    Color(0xFF7CC6D6),
    Color(0xFF858C94),
  ];

  late Size _screenSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _screenSize = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: topcisList.length,
      itemBuilder: (context, index) {
        return buildTopicItemContainer(
          index,
          bgColorList[index % 3],
          overlayColorList[index % 3],
        );
      },
    );
  }

  Padding buildTopicItemContainer(
    int index,
    Color bgColor,
    Color overlayColor,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: _screenSize.width,
        height: _screenSize.width / 2,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          // background color with gradient
          gradient: LinearGradient(
            colors: [
              bgColor,
              bgColor.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -36,
              right: -39,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: overlayColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: -45,
              bottom: -68,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: overlayColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Container(
              width: _screenSize.width,
              height: _screenSize.width / 2,
              child: buildTopicContent(index),
            ),
          ],
        ),
      ),
    );
  }

  Row buildTopicContent(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(width: 32),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              topcisList[index],
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "100 words",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        const SizedBox(width: 32),
      ],
    );
  }
}
