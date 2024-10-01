import 'package:flutter/material.dart';

import '../../constants/app_defaults.dart';

class TitleAndActionButton extends StatelessWidget {
  const TitleAndActionButton({
    super.key,
    required this.title,
    this.actionLabel,
    required this.onTap,
    this.isHeadline = true,
  });

  final String title;
  final String? actionLabel;
  final void Function() onTap;
  final bool isHeadline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: isHeadline
                ? Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontFamily: "Poppins", fontWeight: FontWeight.bold)
                : Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.black, fontFamily: "Poppins"),
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              actionLabel ?? 'View All',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontFamily: "Poppins",
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
