import 'package:flutter/material.dart';
import 'package:movies_flutter/common/ui/widgets/text_style_widget.dart';

class TextWidget extends StatelessWidget {
  final String movieTitle;

  const TextWidget({super.key, required this.movieTitle});

  @override
  Widget build(BuildContext context) {
    return Text(movieTitle, style: TextStyleWidget());
  }
}
