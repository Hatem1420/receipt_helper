import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'app_shadows.dart';

/// ─────────────────────────────────────────────────────────────────
/// AppThemeExtension – custom semantic tokens beyond Material's
/// built-in ColorScheme.  Access via:
///   Theme.of(context).extension<AppThemeExtension>()!
/// ─────────────────────────────────────────────────────────────────
@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    // ── Brand ────────────────────────────────────────────────────
    required this.primaryGlow,

    // ── Surfaces ─────────────────────────────────────────────────
    required this.surfaceCard,
    required this.surfaceModal,
    required this.surfaceInput,
    required this.surfaceChip,
    required this.surfaceDivider,

    // ── Receipt-specific ─────────────────────────────────────────
    required this.receiptBackground,
    required this.receiptDashedLine,
    required this.receiptStamp,

    // ── Status badges ────────────────────────────────────────────
    required this.statusSuccessBg,
    required this.statusSuccessFg,
    required this.statusPendingBg,
    required this.statusPendingFg,
    required this.statusFailedBg,
    required this.statusFailedFg,

    // ── Amount text ──────────────────────────────────────────────
    required this.amountPositive,
    required this.amountNegative,
    required this.amountNeutral,

    // ── Shadows ───────────────────────────────────────────────────
    required this.cardShadow,
    required this.ctaShadow,

    // ── Text helpers ─────────────────────────────────────────────
    required this.textPrimary,
    required this.textSecondary,
    required this.textDisabled,
    required this.textOnPrimary,
    required this.textLink,
  });

  // ── Brand ────────────────────────────────────────────────────────
  final Color primaryGlow;

  // ── Surfaces ─────────────────────────────────────────────────────
  final Color surfaceCard;
  final Color surfaceModal;
  final Color surfaceInput;
  final Color surfaceChip;
  final Color surfaceDivider;

  // ── Receipt-specific ─────────────────────────────────────────────
  final Color receiptBackground;
  final Color receiptDashedLine;
  final Color receiptStamp;

  // ── Status badges ────────────────────────────────────────────────
  final Color statusSuccessBg;
  final Color statusSuccessFg;
  final Color statusPendingBg;
  final Color statusPendingFg;
  final Color statusFailedBg;
  final Color statusFailedFg;

  // ── Amount text ──────────────────────────────────────────────────
  final Color amountPositive;
  final Color amountNegative;
  final Color amountNeutral;

  // ── Shadows ───────────────────────────────────────────────────────
  final List<BoxShadow> cardShadow;
  final List<BoxShadow> ctaShadow;

  // ── Text helpers ─────────────────────────────────────────────────
  final Color textPrimary;
  final Color textSecondary;
  final Color textDisabled;
  final Color textOnPrimary;
  final Color textLink;

  // ── Lerp ─────────────────────────────────────────────────────────
  @override
  AppThemeExtension lerp(AppThemeExtension? other, double t) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      primaryGlow: Color.lerp(primaryGlow, other.primaryGlow, t)!,
      surfaceCard: Color.lerp(surfaceCard, other.surfaceCard, t)!,
      surfaceModal: Color.lerp(surfaceModal, other.surfaceModal, t)!,
      surfaceInput: Color.lerp(surfaceInput, other.surfaceInput, t)!,
      surfaceChip: Color.lerp(surfaceChip, other.surfaceChip, t)!,
      surfaceDivider: Color.lerp(surfaceDivider, other.surfaceDivider, t)!,
      receiptBackground: Color.lerp(
        receiptBackground,
        other.receiptBackground,
        t,
      )!,
      receiptDashedLine: Color.lerp(
        receiptDashedLine,
        other.receiptDashedLine,
        t,
      )!,
      receiptStamp: Color.lerp(receiptStamp, other.receiptStamp, t)!,
      statusSuccessBg: Color.lerp(statusSuccessBg, other.statusSuccessBg, t)!,
      statusSuccessFg: Color.lerp(statusSuccessFg, other.statusSuccessFg, t)!,
      statusPendingBg: Color.lerp(statusPendingBg, other.statusPendingBg, t)!,
      statusPendingFg: Color.lerp(statusPendingFg, other.statusPendingFg, t)!,
      statusFailedBg: Color.lerp(statusFailedBg, other.statusFailedBg, t)!,
      statusFailedFg: Color.lerp(statusFailedFg, other.statusFailedFg, t)!,
      amountPositive: Color.lerp(amountPositive, other.amountPositive, t)!,
      amountNegative: Color.lerp(amountNegative, other.amountNegative, t)!,
      amountNeutral: Color.lerp(amountNeutral, other.amountNeutral, t)!,
      cardShadow: t < 0.5 ? cardShadow : other.cardShadow,
      ctaShadow: t < 0.5 ? ctaShadow : other.ctaShadow,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      textOnPrimary: Color.lerp(textOnPrimary, other.textOnPrimary, t)!,
      textLink: Color.lerp(textLink, other.textLink, t)!,
    );
  }

  @override
  AppThemeExtension copyWith({
    Color? primaryGlow,
    Color? surfaceCard,
    Color? surfaceModal,
    Color? surfaceInput,
    Color? surfaceChip,
    Color? surfaceDivider,
    Color? receiptBackground,
    Color? receiptDashedLine,
    Color? receiptStamp,
    Color? statusSuccessBg,
    Color? statusSuccessFg,
    Color? statusPendingBg,
    Color? statusPendingFg,
    Color? statusFailedBg,
    Color? statusFailedFg,
    Color? amountPositive,
    Color? amountNegative,
    Color? amountNeutral,
    List<BoxShadow>? cardShadow,
    List<BoxShadow>? ctaShadow,
    Color? textPrimary,
    Color? textSecondary,
    Color? textDisabled,
    Color? textOnPrimary,
    Color? textLink,
  }) {
    return AppThemeExtension(
      primaryGlow: primaryGlow ?? this.primaryGlow,
      surfaceCard: surfaceCard ?? this.surfaceCard,
      surfaceModal: surfaceModal ?? this.surfaceModal,
      surfaceInput: surfaceInput ?? this.surfaceInput,
      surfaceChip: surfaceChip ?? this.surfaceChip,
      surfaceDivider: surfaceDivider ?? this.surfaceDivider,
      receiptBackground: receiptBackground ?? this.receiptBackground,
      receiptDashedLine: receiptDashedLine ?? this.receiptDashedLine,
      receiptStamp: receiptStamp ?? this.receiptStamp,
      statusSuccessBg: statusSuccessBg ?? this.statusSuccessBg,
      statusSuccessFg: statusSuccessFg ?? this.statusSuccessFg,
      statusPendingBg: statusPendingBg ?? this.statusPendingBg,
      statusPendingFg: statusPendingFg ?? this.statusPendingFg,
      statusFailedBg: statusFailedBg ?? this.statusFailedBg,
      statusFailedFg: statusFailedFg ?? this.statusFailedFg,
      amountPositive: amountPositive ?? this.amountPositive,
      amountNegative: amountNegative ?? this.amountNegative,
      amountNeutral: amountNeutral ?? this.amountNeutral,
      cardShadow: cardShadow ?? this.cardShadow,
      ctaShadow: ctaShadow ?? this.ctaShadow,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textDisabled: textDisabled ?? this.textDisabled,
      textOnPrimary: textOnPrimary ?? this.textOnPrimary,
      textLink: textLink ?? this.textLink,
    );
  }

  // ── Preset instances ─────────────────────────────────────────────

  static final AppThemeExtension dark = AppThemeExtension(
    primaryGlow: AppColors.primary400.withValues(alpha: 0.30),
    surfaceCard: AppColors.neutral850,
    surfaceModal: AppColors.neutral900,
    surfaceInput: AppColors.neutral800,
    surfaceChip: AppColors.neutral800,
    surfaceDivider: AppColors.neutral700,
    receiptBackground: AppColors.neutral850,
    receiptDashedLine: AppColors.neutral600,
    receiptStamp: AppColors.primary400.withValues(alpha: 0.15),
    statusSuccessBg: AppColors.success500.withValues(alpha: 0.15),
    statusSuccessFg: AppColors.success300,
    statusPendingBg: AppColors.warning500.withValues(alpha: 0.15),
    statusPendingFg: AppColors.warning300,
    statusFailedBg: AppColors.error500.withValues(alpha: 0.15),
    statusFailedFg: AppColors.error300,
    amountPositive: AppColors.primary400,
    amountNegative: AppColors.error300,
    amountNeutral: AppColors.neutral0,
    cardShadow: AppShadows.md,
    ctaShadow: AppShadows.primaryGlowMd,
    textPrimary: AppColors.neutral0,
    textSecondary: AppColors.neutral400,
    textDisabled: AppColors.neutral600,
    textOnPrimary: AppColors.neutral950,
    textLink: AppColors.primary300,
  );

  static final AppThemeExtension light = AppThemeExtension(
    primaryGlow: AppColors.primary500.withValues(alpha: 0.20),
    surfaceCard: AppColors.neutral0,
    surfaceModal: AppColors.neutral50,
    surfaceInput: AppColors.neutral100,
    surfaceChip: AppColors.neutral100,
    surfaceDivider: AppColors.neutral200,
    receiptBackground: AppColors.neutral0,
    receiptDashedLine: AppColors.neutral300,
    receiptStamp: AppColors.primary500.withValues(alpha: 0.12),
    statusSuccessBg: AppColors.success100,
    statusSuccessFg: AppColors.success700,
    statusPendingBg: AppColors.warning100,
    statusPendingFg: AppColors.warning700,
    statusFailedBg: AppColors.error100,
    statusFailedFg: AppColors.error700,
    amountPositive: AppColors.success700,
    amountNegative: AppColors.error700,
    amountNeutral: AppColors.neutral900,
    cardShadow: AppShadows.sm,
    ctaShadow: AppShadows.primaryGlowSm,
    textPrimary: AppColors.neutral950,
    textSecondary: AppColors.neutral500,
    textDisabled: AppColors.neutral300,
    textOnPrimary: AppColors.neutral950,
    textLink: AppColors.primary600,
  );
}
