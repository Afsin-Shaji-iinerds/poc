import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funds_32bj_poc/app/common/const/assets_const/icon_const.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final List<_CardItem> items = const [
    _CardItem(
      title: 'Training',
      subtitle:
          'Take your career to the next level \nby making the most of your \nTraining Fund. ',
      color: Color(0xff7748fb),
      iconPath: IconsConst.medicalIcon1,
    ),
    _CardItem(
      title: 'Legal',
      subtitle:
          'The 32BJ Legal Services Fund provides \nlegal advice and representation to you \nand your dependents.',
      color: Color(0xff217091),
      iconPath: IconsConst.legalIcon1,
    ),
    _CardItem(
      title: 'Retirement',
      subtitle:
          '401(k) Savings Snapshot (as of \n09/15/2025). \nBalance: \$12,854.63',
      color: Color(0xff324762),
      iconPath: IconsConst.retirementIcon1,
    ),
    _CardItem(
      title: 'Health',
      subtitle: 'Your Plan: Anthem Blue Cross – Family Coverage',
      color: Color(0xff4a6cc5),
      iconPath: IconsConst.healthIcon1,
    ),
  ];

  // 👈 set to 0 to expand Training card by default
  int selectedIndex = 0;

  void _onTapCard(int index) {
    setState(() {
      selectedIndex = (selectedIndex == index) ? -1 : index;
    });
  }


@override
Widget build(BuildContext context) {
  const collapsedHeight = 90.0;
  const expandedHeight = 300.0;
  const overlap = 75.0;

  final collapsedStackHeight =
      collapsedHeight + ((items.length - 1) * overlap);

  final totalHeight = collapsedStackHeight +
      (selectedIndex == -1 ? 0 : (expandedHeight - collapsedHeight));

  return AnimatedContainer(
    duration: const Duration(milliseconds: 400),
    curve: Curves.easeInOut,
    height: totalHeight,
    child: Stack(
      children: List.generate(items.length, (i) {
        final isExpanded = selectedIndex == i;

        double topOffset = i * overlap;
        if (selectedIndex != -1 && i > selectedIndex) {
          topOffset += (expandedHeight - collapsedHeight);
        }

        return AnimatedPositioned(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          top: topOffset,
          left: 0,
          right: 0,
          child: GestureDetector(
            onTap: () => _onTapCard(i),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOut,
                height: isExpanded ? expandedHeight : collapsedHeight,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: items[i].color,
                  borderRadius: BorderRadius.only(
                    bottomLeft:Radius.circular(i==(items.length-1)?  16:0) ,
                    bottomRight: Radius.circular(i==(items.length-1)?16:0),
      topLeft: Radius.circular(16),
      topRight: Radius.circular(16),),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Stack(
                  children: [
                    // SingleChildScrollView wraps the whole column
                    // Inside AnimatedContainer -> child: Stack -> SingleChildScrollView
SingleChildScrollView(
  physics: isExpanded
      ? const BouncingScrollPhysics()
      : const NeverScrollableScrollPhysics(),
  child: ConstrainedBox(
    constraints: BoxConstraints(
      minHeight: isExpanded ? expandedHeight - 36 : collapsedHeight - 36,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Top content: Title + Subtitle
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              items[i].title,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            if (isExpanded) ...[
              const SizedBox(height: 8),
              Text(
                items[i].subtitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),

        // Bottom content: View More + Icon (always sticks to bottom for non-health cards)
        if (isExpanded)
          if (items[i].title != 'Health') ...[
            // Row with bottom text + icon
Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    const TiltedArrowChip(),
    const SizedBox(width: 10),
    Text(
      items[i].title == 'Training'
          ? "Go to the Training Dashboard" // Custom text for Training
          : "View more info",          // Default for others
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 15,
      ),
    ),
    const Spacer(),
    SvgPicture.asset(
      items[i].iconPath,
      width: 70,
      height: 70,
    ),
  ],
),

          ]
          else ...[
            // Health card keeps original layout with tip
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TiltedArrowChip(),
                const SizedBox(width: 10),
                const Text(
                  "View more info",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  items[i].iconPath,
                  width: 70,
                  height: 70,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange, width: 1.2),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(IconsConst.lightIcon1),
                  const SizedBox(width: 8),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                            text: "TIP: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                "New in 2025! 32BJ Health Fund Centers of Excellence (COE) for Surgery. ",
                          ),
                          TextSpan(
                            text: "See more",
                            style: TextStyle(
                              color: Color(0XFF5A2D7E),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
      ],
    ),
  ),
)

                  ],
                ),
              ),
            ),
          ),
        );
      }),
    ),
  );
}
}

class _CardItem {
  final String title;
  final String subtitle;
  final Color color;
  final String iconPath; // 👈 new field

  const _CardItem({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.iconPath,

  });
}

class TiltedArrowChip extends StatelessWidget {
  final double size;
  final double angleDegrees;
  final Color bg;
  final String arrowAsset;

  const TiltedArrowChip({
    Key? key,
    this.size = 45,
    this.angleDegrees = -10, // 👈 rotate to point ↗
    this.bg = Colors.white,
    this.arrowAsset = IconsConst.arrowIcon1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSvg = arrowAsset.toLowerCase().endsWith('.svg');

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bg,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Transform.rotate(
          angle: angleDegrees * pi / 180, // convert to radians
          child: isSvg
              ? SvgPicture.asset(
                  arrowAsset,
                  width: size * 0.70, // slightly bigger for clarity
                  height: size * 0.70,
                )
              : Image.asset(
                  arrowAsset,
                  width: size * 0.55,
                  height: size * 0.55,
                ),
        ),
      ),
    );
  }
}
