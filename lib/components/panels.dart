import 'package:flutter/material.dart';

class PrimaryPanel extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;

  const PrimaryPanel({super.key, required this.child, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width ?? 150,
        height: height ?? 150,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8)
        ),
        child: child,
      ),
    );
  }
}

class SecondaryPanel extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;

  const SecondaryPanel({super.key, required this.child, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width ?? 150,
        height: height ?? 150,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8)
        ),
        child: child,
      ),
    );
  }
}

class PrimaryCard extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;

  const PrimaryCard({super.key, required this.child, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width ?? 150,
        height: height ?? 150,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8)
        ),
        child: child,
      ),
    );
  }
}