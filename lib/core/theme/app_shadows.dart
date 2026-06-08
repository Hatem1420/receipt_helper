import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// ─────────────────────────────────────────────────────────────────
/// AppShadows – BoxShadow tokens for the Receipt App UI Kit.
/// Uses slightly tinted black shadows that look correct on
/// the dark-background card surfaces.
/// ─────────────────────────────────────────────────────────────────
abstract final class AppShadows {
  AppShadows._();

  // ── Base shadow colour (pure black at varying opacities) ─────────
  static const Color _shadowColor = Color(0xFF000000);

  // ── xs – hairline elevation (chips, tags) ────────────────────────
  static const List<BoxShadow> xs = [
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  ];

  // ── sm – subtle card lift ────────────────────────────────────────
  static const List<BoxShadow> sm = [
    BoxShadow(
      color: Color(0x26000000),
      offset: Offset(0, 2),
      blurRadius: 6,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x0D000000),
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  ];

  // ── md – default card shadow ──────────────────────────────────────
  static const List<BoxShadow> md = [
    BoxShadow(
      color: Color(0x33000000),
      offset: Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x14000000),
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];

  // ── lg – elevated modal / bottom sheet ──────────────────────────
  static const List<BoxShadow> lg = [
    BoxShadow(
      color: Color(0x40000000),
      offset: Offset(0, 8),
      blurRadius: 24,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ];

  // ── xl – floating action button / popover ───────────────────────
  static const List<BoxShadow> xl = [
    BoxShadow(
      color: Color(0x4D000000),
      offset: Offset(0, 12),
      blurRadius: 32,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x26000000),
      offset: Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 0,
    ),
  ];

  // ── Primary glow – lime-green accent glow (CTA buttons) ──────────
  static final List<BoxShadow> primaryGlowSm = [
    BoxShadow(
      color: AppColors.primary400.withValues(alpha: 0.25),
      offset: const Offset(0, 4),
      blurRadius: 16,
      spreadRadius: 0,
    ),
  ];

  static final List<BoxShadow> primaryGlowMd = [
    BoxShadow(
      color: AppColors.primary400.withValues(alpha: 0.35),
      offset: const Offset(0, 6),
      blurRadius: 24,
      spreadRadius: 0,
    ),
  ];

  // ── Inner shadow (receipt torn-edge effect) ──────────────────────
  static const List<BoxShadow> innerTop = [
    BoxShadow(
      color: Color(0x33000000),
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: -4,
    ),
  ];
}
