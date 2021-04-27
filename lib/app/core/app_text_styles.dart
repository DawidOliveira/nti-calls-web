import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nti_calls_web/app/core/core.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle footer = GoogleFonts.notoSans(
    fontSize: 12,
    fontWeight: FontWeight.w100,
  );

  static TextStyle label = GoogleFonts.notoSans(
    fontSize: 15,
  );

  static TextStyle headingTable = GoogleFonts.notoSans(
    fontWeight: FontWeight.bold,
    color: AppColors.WHITE,
  );
}
