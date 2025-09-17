import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funds_32bj_poc/app/common/const/assets_const/icon_const.dart';

/// Upcoming Event Card widget
/// 
/// Drop this file into your `lib/widgets/` (or preferred) folder and
/// import as `import 'widgets/upcoming_event_widget.dart';`
///
/// Example usage:
/// ```dart
/// UpcomingEventCard(
///   date: DateTime(2025, 9, 25),
///   tag: 'LEGAL',
///   title: 'Planning for the Future / Planeando por el Futuro',
///   subtitle: 'Tomorrow: 12:00 PM - 7:00 PM',
///   location: '25 West 18th Street, 4th floor',
///   accentColor: Color(0xFFBFB0FF),
/// );
/// ```

class UpcomingEventCard extends StatelessWidget {
  final DateTime date;
  final String tag;
  final String title;
  final String subtitle;
  final String? location;
  final Color? accentColor;
  final bool hasLocationIcon;

  const UpcomingEventCard({
    Key? key,
    required this.date,
    required this.tag,
    required this.title,
    required this.subtitle,
    this.location,
    this.accentColor,
    this.hasLocationIcon = true,
  }) : super(key: key);

  String get monthShort {
    const months = [
      'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
      'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'
    ];
    return months[date.month - 1];
  }

  @override
  Widget build(BuildContext context) {
    final Color leftBg = accentColor ?? const Color(0XFFBDB8FB);
    final Color borderColor = leftBg.withOpacity(0.35);

    return Card(
      margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 1.4),
        ),
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            // Left date box
            Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                color: leftBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    date.day.toString(),
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '$monthShort ${date.year}',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0XFF212121),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 14),

            // Right content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tag and title row
                  // Tag above title
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.purple.withOpacity(0.06),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        tag.toUpperCase(),
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: Color(0XFF5A2D7E),
        ),
      ),
    ),
    const SizedBox(height: 6),
    Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    ),
  ],
),

                  const SizedBox(height: 8),

                  // Subtitle (time)
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),

                  if (location != null && location!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        if (hasLocationIcon) ...[
                           SvgPicture.asset(
                            IconsConst.location_on_outlined,
                            width: 12,height: 12,
                          ),
                          const SizedBox(width: 6),
                        ],

                        Expanded(
                          child: Text(
                            location!,
                            style: TextStyle(fontSize: 13, color: Colors.black54),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ]
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// A couple of helper variations to mimic stacked upcoming events like in
/// the screenshot: one with white background, another with a warm accent.

class UpcomingEventListExample extends StatelessWidget {
  const UpcomingEventListExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 15)),
                Text(
                  'Upcoming Events',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 30,
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Color(0XFFD2BFEC),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '2',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0XFF5A2D7E),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text(
              'View all',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0XFF563A87),
              ),
            ),
          ),

          ],
        ),

        const SizedBox(height: 16),

        // First card
        UpcomingEventCard(
          date: DateTime(2025, 9, 25),
          tag: 'LEGAL',
          title: 'Planning for the Future / Planeando por el Futuro',
          subtitle: 'Tomorrow: 12:00 PM - 7:00 PM',
          // location: 'Room 201',
          accentColor: const Color(0xFFDAD1FF),
        ),

        const SizedBox(height: 12),

        // Second card
        UpcomingEventCard(
          date: DateTime(2025, 9, 16),
          tag: '32BJ DENTAL CENTER',
          title: 'Periodic / Recare',
          subtitle: 'Thursday: 1:30 PM',
          location: '25 West 18th Street, 4th floor ....',
          accentColor: const Color(0xFFF5DE9A),
        ),

          const SizedBox(height: 52),
      ],
    );
  }
}
