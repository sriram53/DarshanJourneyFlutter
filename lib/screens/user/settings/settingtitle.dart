import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SettingsTile extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool enabled;
  const SettingsTile({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.onTap,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      //   Switch(
      //   value: enabled,
      //   // ignore: unnecessary_null_comparison
      //   onChanged: onTap != null ? (bool value) => onTap() : null,
      // ),
        const Spacer(),
        InkWell(
          onTap: onTap ,

          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Ionicons.chevron_forward_outline),
          ),
        )
      ],
    );
  }
}