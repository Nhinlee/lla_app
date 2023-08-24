import 'package:flutter/material.dart';
import 'package:lla_app/entity.dart';
import 'package:lla_app/presentation.dart';

class TopicWithTotalLIWidget extends StatelessWidget {
  TopicWithTotalLIWidget({
    super.key,
    required this.width,
    required this.topicEntity,
    required this.totalLI,
    required this.index,
    this.onTap,
    this.showArrowIcon = true,
  });

  final double width;
  final TopicEntity topicEntity;
  final int totalLI;
  final int index;
  final bool showArrowIcon;
  final Function()? onTap;

  final bgColorList = [
    AppColors.primary,
    const Color(0xFFDB6D6D),
    const Color(0xFFE7B768),
  ];

  final overlayColorList = [
    const Color(0xFFFDCC4A).withOpacity(0.8),
    const Color(0xFF7CC6D6),
    const Color(0xFF858C94),
  ];

  @override
  Widget build(BuildContext context) {
    return buildTopicItemContainer(
      topicEntity,
      totalLI,
      bgColorList[index % 3],
      overlayColorList[index % 3],
    );
  }

  Widget buildTopicItemContainer(
    TopicEntity topicEntity,
    int totalLI,
    Color bgColor,
    Color overlayColor,
  ) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: width,
            height: width / 2,
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
                SizedBox(
                  width: width,
                  height: width / 2,
                  child: buildTopicContent(
                    topicEntity.name,
                    totalLI,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildTopicContent(
    String topicName,
    int totalLI,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(width: 32),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              topicName,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "$totalLI words",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const Spacer(),
        if (showArrowIcon)
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        const SizedBox(width: 32),
      ],
    );
  }
}
