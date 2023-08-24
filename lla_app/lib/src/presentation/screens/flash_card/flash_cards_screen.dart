import 'dart:math' as math;

import 'package:built_collection/built_collection.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/entity.dart';
import 'package:lla_app/presentation.dart';
import 'package:lla_app/src/presentation/container/app_status_container.dart';
import 'package:redux/redux.dart';
import 'package:swipable_stack/swipable_stack.dart';

class FlashcardsScreen<T extends AppState> extends StatefulWidget {
  const FlashcardsScreen({super.key});

  @override
  State<FlashcardsScreen> createState() => _FlashcardsScreenState<T>();
}

class _FlashcardsScreenState<T extends AppState>
    extends State<FlashcardsScreen> {
  late final SwipableStackController _controller;

  void _listenController() => setState(() {});

  late Store<T> _store;
  String _statusId = '';
  String _topicId = "01H84JR4B55MRE6EXF7B8H1SP7";
  int _currIndex = 0;

  @override
  void initState() {
    super.initState();

    _controller = SwipableStackController()
      ..addListener(
        _listenController,
      );
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_listenController)
      ..dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _store = StoreProvider.of<T>(context);

    final action = GetFlashcardsAction.create(
      topicId: _topicId,
      limit: 10,
    );
    _statusId = action.statusId;
    _store.dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AppStatusListener(
        statusId: _statusId,
        loadingPlaceHolder: const AppCircleLoading(),
        builder: (status) {
          return buildBody(context);
        },
      ),
    );
  }

  SafeArea buildBody(BuildContext context) {
    // get flashcard from state
    final flashcards = _store.state.flashcardState.flashcards[_topicId]?.values
            .toBuiltList() ??
        BuiltList();

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: buildProgressContainer(
                context,
                flashcards.length,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: buildFlashcardsContainer(flashcards),
              ),
            ),
            const Text(
              '''Swipe right if you are confident,
and left if you need more practice''',
            )
          ],
        ),
      ),
    );
  }

  Column buildProgressContainer(
    BuildContext context,
    int length,
  ) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: (_currIndex + 1) / length,
          minHeight: 8,
          backgroundColor: Colors.grey,
          valueColor: const AlwaysStoppedAnimation<Color>(
            Colors.purple,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${_currIndex + 1}/${length} words',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ],
    );
  }

  SwipableStack buildFlashcardsContainer(
    BuiltList<FlashcardEntity> flashcard,
  ) {
    return SwipableStack(
      swipeAnchor: SwipeAnchor.bottom,
      detectableSwipeDirections: const {
        SwipeDirection.right,
        SwipeDirection.left,
      },
      controller: _controller,
      stackClipBehaviour: Clip.none,
      onSwipeCompleted: (index, direction) {
        if (kDebugMode) {
          print('$index, $direction');
        }
        setState(() {
          _currIndex = math.min(
            index + 1,
            flashcard.length - 1,
          );
        });
      },
      horizontalSwipeThreshold: 0.8,
      verticalSwipeThreshold: 0.8,
      allowVerticalSwipe: false,
      itemCount: flashcard.length,
      builder: (context, properties) {
        return Stack(
          children: [
            buildFlipCard(context, flashcard[properties.index]),
            // more custom overlay possible than with overlayBuilder
            if (properties.stackIndex == 0 && properties.direction != null)
              CardOverlay(
                swipeProgress: properties.swipeProgress,
                direction: properties.direction!,
              )
          ],
        );
      },
    );
  }

  FlipCard buildFlipCard(
    BuildContext context,
    FlashcardEntity flashcard,
  ) {
    return FlipCard(
      fill: Fill.fillBack,
      // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL,
      // default
      side: CardSide.FRONT,
      // The side to initially display.
      front: Container(
        height: MediaQuery.of(context).size.height * 0.65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Image.network(
          flashcard.imageLink,
          fit: BoxFit.contain,
        ),
      ),
      back: Container(
        height: MediaQuery.of(context).size.height * 0.65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.deepPurple,
        ),
        padding: const EdgeInsets.fromLTRB(32, 64, 32, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              flashcard.englishWord,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "Examples",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: flashcard.englishSentences.length,
                itemBuilder: (context, index) {
                  return Text(
                    flashcard.englishSentences[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardOverlay extends StatelessWidget {
  const CardOverlay({
    required this.direction,
    required this.swipeProgress,
    super.key,
  });

  final SwipeDirection direction;
  final double swipeProgress;

  @override
  Widget build(BuildContext context) {
    final opacity = math.min<double>(swipeProgress, 1);

    final isRight = direction == SwipeDirection.right;
    final isLeft = direction == SwipeDirection.left;
    final isUp = direction == SwipeDirection.up;
    final isDown = direction == SwipeDirection.down;
    return Stack(
      children: [
        Opacity(
          opacity: isRight ? opacity : 0,
          child: CardLabel.right(),
        ),
        Opacity(
          opacity: isLeft ? opacity : 0,
          child: CardLabel.left(),
        ),
        Opacity(
          opacity: isUp ? opacity : 0,
          child: CardLabel.up(),
        ),
        Opacity(
          opacity: isDown ? opacity : 0,
          child: CardLabel.down(),
        ),
      ],
    );
  }
}

const _labelAngle = math.pi / 2 * 0.2;

class CardLabel extends StatelessWidget {
  const CardLabel._({
    required this.color,
    required this.label,
    required this.angle,
    required this.alignment,
  });

  factory CardLabel.right() {
    return const CardLabel._(
      color: SwipeDirectionColor.right,
      label: 'Remember',
      angle: -_labelAngle,
      alignment: Alignment.topLeft,
    );
  }

  factory CardLabel.left() {
    return const CardLabel._(
      color: SwipeDirectionColor.left,
      label: 'Forget',
      angle: _labelAngle,
      alignment: Alignment.topRight,
    );
  }

  factory CardLabel.up() {
    return const CardLabel._(
      color: SwipeDirectionColor.up,
      label: 'UP',
      angle: _labelAngle,
      alignment: Alignment(0, 0.5),
    );
  }

  factory CardLabel.down() {
    return const CardLabel._(
      color: SwipeDirectionColor.down,
      label: 'DOWN',
      angle: -_labelAngle,
      alignment: Alignment(0, -0.75),
    );
  }

  final Color color;
  final String label;
  final double angle;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.symmetric(
        vertical: 36,
        horizontal: 36,
      ),
      child: Transform.rotate(
        angle: angle,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: color,
              width: 4,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.all(6),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.4,
              color: color,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class SwipeDirectionColor {
  static const right = Color.fromRGBO(70, 195, 120, 1);
  static const left = Color.fromRGBO(220, 90, 108, 1);
  static const up = Color.fromRGBO(83, 170, 232, 1);
  static const down = Color.fromRGBO(154, 85, 215, 1);
}

extension SwipeDirecionX on SwipeDirection {
  Color get color {
    switch (this) {
      case SwipeDirection.right:
        return const Color.fromRGBO(70, 195, 120, 1);
      case SwipeDirection.left:
        return const Color.fromRGBO(220, 90, 108, 1);
      case SwipeDirection.up:
        return const Color.fromRGBO(83, 170, 232, 1);
      case SwipeDirection.down:
        return const Color.fromRGBO(154, 85, 215, 1);
    }
  }
}
