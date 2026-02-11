import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultPadding extends StatelessWidget {
  const DefaultPadding({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(24.w), child: child);
  }
}
