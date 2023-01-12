import 'package:flutter/material.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/atom-one-dark.dart';
import 'package:flutter_highlighter/themes/atom-one-light.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:google_fonts/google_fonts.dart';

class CodeElementBuilder extends MarkdownElementBuilder {
  @override
  Widget? visitElementAfter(
    md.Element element,
    TextStyle? preferredStyle,
  ) {
    var language = '';
    final isInlineCode = element.attributes.isEmpty;
    final mediaQueryWindow = MediaQueryData.fromWindow(
      WidgetsBinding.instance.window,
    );
    if (isInlineCode) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 1,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: const Color(
            0xff383a42,
          ),
        ),
        child: Text(
          element.textContent,
          style: GoogleFonts.robotoMono().copyWith(
            color: const Color(0xfffafafa),
          ),
        ),
      );
    }

    if (element.attributes['class'] != null) {
      String lg = element.attributes['class'] as String;
      language = lg.substring(9);
    }

    return SizedBox(
      width: mediaQueryWindow.size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: HighlightView(
          element.textContent,
          language: language,
          theme: mediaQueryWindow.platformBrightness == Brightness.light
              ? atomOneLightTheme
              : atomOneDarkTheme,
          padding: const EdgeInsets.all(16),
          tabSize: 8,
          textStyle: GoogleFonts.robotoMono(),
        ),
      ),
    );
  }
}
