import 'package:flutter/material.dart';

/// ─────────────────────────────────────────────────────────────────
/// AppColors – single source of truth for every color token.
/// Extracted from: Receipt App UI Kit (Community) – Figma node 7-73
/// ─────────────────────────────────────────────────────────────────
abstract final class AppColors {
  AppColors._();

  // ── Brand / Primary (Lime-Green) ─────────────────────────────────
  static const Color primary50  = Color(0xFFF5FDE7);
  static const Color primary100 = Color(0xFFE8F9C3);
  static const Color primary200 = Color(0xFFD2F382);
  static const Color primary300 = Color(0xFFBEED45);
  static const Color primary400 = Color(0xFFB5E82E); // ← Figma accent
  static const Color primary500 = Color(0xFFA8DC1A); // ← Primary CTA
  static const Color primary600 = Color(0xFF8BBF0E);
  static const Color primary700 = Color(0xFF6A9309);
  static const Color primary800 = Color(0xFF507010);
  static const Color primary900 = Color(0xFF3A5212);

  // ── Neutral / Grey palette ───────────────────────────────────────
  static const Color neutral0   = Color(0xFFFFFFFF);
  static const Color neutral50  = Color(0xFFF5F5F5);
  static const Color neutral100 = Color(0xFFEEEEEE);
  static const Color neutral200 = Color(0xFFE0E0E0);
  static const Color neutral300 = Color(0xFFBDBDBD);
  static const Color neutral400 = Color(0xFF9E9E9E);
  static const Color neutral500 = Color(0xFF757575);
  static const Color neutral600 = Color(0xFF616161);
  static const Color neutral700 = Color(0xFF424242);
  static const Color neutral800 = Color(0xFF303030);
  static const Color neutral850 = Color(0xFF1E1E1E);
  static const Color neutral900 = Color(0xFF141414);
  static const Color neutral950 = Color(0xFF0D0D0D); // deepest background

  // ── Semantic – Success ───────────────────────────────────────────
  static const Color success100 = Color(0xFFDCFCE7);
  static const Color success300 = Color(0xFF86EFAC);
  static const Color success500 = Color(0xFF22C55E);
  static const Color success700 = Color(0xFF15803D);

  // ── Semantic – Error ─────────────────────────────────────────────
  static const Color error100   = Color(0xFFFFE4E6);
  static const Color error300   = Color(0xFFFCA5A5);
  static const Color error500   = Color(0xFFEF4444);
  static const Color error700   = Color(0xFFB91C1C);

  // ── Semantic – Warning ───────────────────────────────────────────
  static const Color warning100 = Color(0xFFFFF7ED);
  static const Color warning300 = Color(0xFFFDBA74);
  static const Color warning500 = Color(0xFFF97316);
  static const Color warning700 = Color(0xFFC2410C);

  // ── Semantic – Info ─────────────────────────────────────────────
  static const Color info100    = Color(0xFFE0F2FE);
  static const Color info300    = Color(0xFF7DD3FC);
  static const Color info500    = Color(0xFF0EA5E9);
  static const Color info700    = Color(0xFF0369A1);

  // ── Overlay & Scrim ─────────────────────────────────────────────
  static const Color scrim      = Color(0x99000000); // 60% black
  static const Color overlay12  = Color(0x1FFFFFFF); // white 12%
  static const Color overlay20  = Color(0x33FFFFFF); // white 20%
  static const Color overlay8   = Color(0x14FFFFFF); // white 8%

  // ── Transparent helper ──────────────────────────────────────────
  static const Color transparent = Colors.transparent;
}
