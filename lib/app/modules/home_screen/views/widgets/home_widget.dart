import 'dart:math';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  // simple card model
  final List<_CardItem> items = const [
    _CardItem(title: 'Training', subtitle: 'Take your career to the next level', color: Color(0xFF8E63FF)),
    _CardItem(title: 'Legal', subtitle: 'Legal advice & representation', color: Color(0xFF2E9AAE)),
    _CardItem(title: 'Retirement', subtitle: 'Plan for the future', color: Color(0xFFEF6C6C)),
    _CardItem(title: 'Health', subtitle: 'Your Plan: Anthem Blue Cross – Family Coverage', color: Color(0xFF158C5B)),
  ];

  int selectedIndex = -1;

  // visual constants (tweak these)
  final double baseTop = 120;
  final double collapsedHeight = 140;
  final double expandedHeight = 340;
  final double overlap = 36;
  final Duration animDuration = const Duration(milliseconds: 350);

  void _onTapCard(int index) {
    setState(() {
      selectedIndex = (selectedIndex == index) ? -1 : index;
    });
  }

  void _collapse() {
    if (selectedIndex != -1) setState(() => selectedIndex = -1);
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;

    return Scaffold(
      // ignore top system bar visuals as user requested earlier
      backgroundColor: const Color(0xFFF6F6F6),
      body: GestureDetector(
        // tapping outside collapses
        onTap: _collapse,
        child: Stack(
          children: [
            // header region (avatar + greeting)
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: _buildHeader(),
            ),

            // stack of cards
            ...List.generate(items.length, (i) {
              final item = items[i];

              // compute positions and heights depending on selectedIndex
              double top;
              double height;
              double left = 18;
              double right = 18;

              if (selectedIndex == -1) {
                // all collapsed stacked
                top = baseTop + i * overlap;
                height = collapsedHeight;
              } else {
                // one is selected
                if (i < selectedIndex) {
                  top = baseTop + i * overlap;
                  height = collapsedHeight;
                } else if (i == selectedIndex) {
                  // selected: raise a bit and expand
                  top = baseTop + i * overlap - 12;
                  height = expandedHeight;
                  left = 12; // make it a bit wider
                  right = 12;
                } else {
                  // cards after selected are pushed down by the expansion delta
                  final delta = (expandedHeight - collapsedHeight);
                  top = baseTop + i * overlap + delta;
                  height = collapsedHeight;
                }
              }

              // to ensure higher z-order for later cards (so top-most visually last)
              final zIndex = i;

              return AnimatedPositioned(
                key: ValueKey('card_$i'),
                duration: animDuration,
                curve: Curves.easeInOut,
                top: top,
                left: left,
                right: right,
                height: height,
                child: IgnorePointer(
                  // Prevent taps passing through when expanded - individual GestureDetectors will handle
                  ignoring: false,
                  child: Material(
                    // use Material so elevation/shadows render nicely
                    color: Colors.transparent,
                    elevation: 0,
                    child: GestureDetector(
                      onTap: () {
                        // prevent parent GestureDetector collapse from running (tap should interact with card)
                        // (GestureDetector under Stack handles tap directly)
                        _onTapCard(i);
                      },
                      child: AnimatedCard(
                        item: item,
                        isExpanded: selectedIndex == i,
                        animDuration: animDuration,
                      ),
                    ),
                  ),
                ),
              );
            }),

            // optional: a small bottom safe area spacer so last card doesn't get fully hidden
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(height: MediaQuery.of(context).padding.bottom + 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(radius: 22, backgroundColor: Colors.grey, child: Icon(Icons.person, color: Colors.white)),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Good Morning,', style: TextStyle(fontSize: 13, color: Colors.black54)),
            SizedBox(height: 2),
            Text('Maria Alax!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
          ],
        ),
        const Spacer(),
        Container(
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
        ),
      ],
    );
  }
}

/// data holder
class _CardItem {
  final String title;
  final String subtitle;
  final Color color;
  const _CardItem({required this.title, required this.subtitle, required this.color});
}

/// AnimatedCard: content + subtle shadow + inner layout
class AnimatedCard extends StatelessWidget {
  final _CardItem item;
  final bool isExpanded;
  final Duration animDuration;
  const AnimatedCard({
    Key? key,
    required this.item,
    required this.isExpanded,
    required this.animDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // animate roundness, elevation, content opacity
    final borderRadius = BorderRadius.circular(18);
    return AnimatedContainer(
      duration: animDuration,
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Stack(
        children: [
          // text column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedDefaultTextStyle(
                style: TextStyle(
                  fontSize: isExpanded ? 36 : 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  
                ),
                child: SizedBox(),
                duration: animDuration,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: AnimatedOpacity(
                  duration: animDuration,
                  opacity: isExpanded ? 1 : 0.95,
                  child: Text(
                    item.subtitle,
                    style: const TextStyle(color: Colors.white70, fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              // arrow chip + action label (only small when collapsed)
              Row(
                children: [
                  TiltedArrowChip(),
                  const SizedBox(width: 12),
                  AnimatedOpacity(
                    duration: animDuration,
                    opacity: isExpanded ? 1 : 0.9,
                    child: Text(
                      isExpanded ? 'Go to the ${item.title.toLowerCase()} dashboard' : 'Go to the ${item.title.toLowerCase()}',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // placeholder illustration aligned bottom-right
          Positioned(
            right: 6,
            bottom: 6,
            child: AnimatedOpacity(
              duration: animDuration,
              opacity: isExpanded ? 1 : 0.9,
              child: SizedBox(
                width: isExpanded ? 120 : 86,
                height: isExpanded ? 120 : 86,
                // replace with your Image.asset(...) later
                child: Icon(Icons.image, size: isExpanded ? 72 : 48, color: Colors.white70),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// small circular tilted arrow like in screenshot.
/// Quick implementation using Icon + Transform.rotate tuned to ~30deg clockwise.
class TiltedArrowChip extends StatelessWidget {
  final double size;
  final double angleDegrees;
  final Color bg;
  final Color arrowColor;

  const TiltedArrowChip({
    Key? key,
    this.size = 46,
    this.angleDegrees = 30,
    this.bg = Colors.white,
    this.arrowColor = const Color(0xFFFFA726),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
      child: Center(
        child: Transform.rotate(
          angle: angleDegrees * pi / 180,
          child: Icon(Icons.arrow_upward, color: arrowColor, size: size * 0.46),
        ),
      ),
    );
  }
}
