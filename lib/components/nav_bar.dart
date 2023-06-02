import "package:flutter/material.dart";
import 'package:google_nav_bar/google_nav_bar.dart';


class BNavigator extends StatefulWidget {
  final Function currentIndex;
  const BNavigator({super.key, required this.currentIndex});

  @override
  State<BNavigator> createState() => _BNavigatorState();
}

class _BNavigatorState extends State<BNavigator> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return GNav(
      selectedIndex: index,
      onTabChange: (int i) {
        setState(() {
          index = i;
          widget.currentIndex(i);
        });
      },
      backgroundColor: Theme.of(context).colorScheme.primary,
      color: Colors.white,
      tabBackgroundColor: Theme.of(context).colorScheme.background,
      tabs: const [
        GButton(
          icon: Icons.list,
          text: 'My List',
        ),
        GButton(
          icon: Icons.receipt_long_rounded,
          text: 'Recent Items',
        ),
      ],
    );
  }
}
