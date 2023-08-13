import 'package:flutter/material.dart';

class LearningItemDetailScreen extends StatefulWidget {
  const LearningItemDetailScreen({Key? key}) : super(key: key);

  @override
  State<LearningItemDetailScreen> createState() =>
      _LearningItemDetailScreenState();
}

class _LearningItemDetailScreenState extends State<LearningItemDetailScreen> {
  double _screenWidth = 0;

  final _englishSentences = [
    "The wind acted like a hairdryer, playing with her hair.",
    "An old hairdryer roared, bringing back old memories.",
    "The spaceship's panel lit up like a hairdryer's warm glow.",
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Get media query data
    final mediaQuery = MediaQuery.of(context);
    _screenWidth = mediaQuery.size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: "learning_item_image",
              child: buildLIImageContainer(),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: buildTitleAndDescContainer(context),
            ),
            const SizedBox(height: 24),
            // list of english sentences widget
            ...buildEnglishSentencesWidget(),
          ],
        ),
      ),
    );
  }

  Container buildLIImageContainer() {
    return Container(
      width: _screenWidth,
      height: _screenWidth,
      decoration: BoxDecoration(
        color: Colors.purple,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
    );
  }

  Widget buildTitleAndDescContainer(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Learning Item Title',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 16),
        Text(
          'Learning Item Description',
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }

  List<Widget> buildEnglishSentencesWidget() {
    return _englishSentences.map((sentence) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                sentence,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.volume_up),
            ),
          ],
        ),
      );
    }).toList();
  }
}
