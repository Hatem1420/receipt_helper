import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// ─────────────────────────────────────────────────────────────────
/// AppTypography – all text styles from the Receipt App UI Kit.
/// Font: Inter (primary) / SF Pro Display fallback.
/// Scale follows Material 3 naming; sizes match the Figma file.
/// ─────────────────────────────────────────────────────────────────
abstract final class AppTextTheme {
  AppTextTheme._();

  static const String _fontFamily = 'Inter';

  // ── Display ─────────────────────────────────────────────────────
  static const TextStyle displayLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 48,
    height: 1.15,
    fontWeight: FontWeight.w700,
    letterSpacing: -1.0,
    color: AppColors.neutral0,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 40,
    height: 1.2,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.8,
    color: AppColors.neutral0,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    height: 1.25,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
    color: AppColors.neutral0,
  );

  // ── Headline ─────────────────────────────────────────────────────
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    height: 1.3,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.3,
    color: AppColors.neutral0,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    height: 1.33,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.2,
    color: AppColors.neutral0,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    height: 1.4,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.1,
    color: AppColors.neutral0,
  );

  // ── Title ────────────────────────────────────────────────────────
  static const TextStyle titleLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    height: 1.44,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.0,
    color: AppColors.neutral0,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: AppColors.neutral0,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    color: AppColors.neutral0,
  );

  // ── Body ─────────────────────────────────────────────────────────
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    color: AppColors.neutral0,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    height: 1.57,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: AppColors.neutral0,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    height: 1.67,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    color: AppColors.neutral400,
  );

  // ── Label ─────────────────────────────────────────────────────────
  static const TextStyle labelLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    height: 1.43,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    color: AppColors.neutral0,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    height: 1.33,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    color: AppColors.neutral0,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10,
    height: 1.6,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    color: AppColors.neutral400,
  );

  // ── Numeric / Amount (receipt-specific) ──────────────────────────
  static const TextStyle amountLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 40,
    height: 1.2,
    fontWeight: FontWeight.w700,
    letterSpacing: -1.0,
    color: AppColors.primary400,
  );

  static const TextStyle amountMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    height: 1.25,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    color: AppColors.neutral0,
  );

  static const TextStyle amountSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    height: 1.4,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.0,
    color: AppColors.neutral0,
  );

  // ── Convenience constructors ─────────────────────────────────────
  static TextStyle get buttonLg => labelLarge.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    color: AppColors.neutral950,
  );

  static TextStyle get buttonMd => labelLarge.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    color: AppColors.neutral950,
  );

  static TextStyle get buttonSm => labelMedium.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.neutral950,
  );

  static TextStyle get caption => bodySmall.copyWith(
    fontSize: 11,
    color: AppColors.neutral400,
    letterSpacing: 0.3,
  );

  static TextStyle get overline => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10,
    height: 1.6,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5,
    color: AppColors.neutral400,
  );
}
