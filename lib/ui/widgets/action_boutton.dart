import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/constants.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color bgColor;
  final Color color;
  const ActionButton(
      {Key? key,
        required this.label,
        required this.icon,
        required this.bgColor,
        required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(8), color: bgColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            label,
            style: GoogleFonts.poppins(
                color: color, fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
