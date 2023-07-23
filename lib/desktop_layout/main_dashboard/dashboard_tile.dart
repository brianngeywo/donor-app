import 'package:flutter/material.dart';

class DashboardTile extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  DashboardTile({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: onPressed,
        child: Card(
          color: Colors.white,
          child: Center(
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
