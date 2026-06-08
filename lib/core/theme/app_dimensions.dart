/// ─────────────────────────────────────────────────────────────────
/// AppDimensions – spacing, radius, elevation & icon-size tokens.
/// Matches the 4-pt / 8-pt grid used in the Receipt App UI Kit.
/// ─────────────────────────────────────────────────────────────────
abstract final class AppDimensions {
  AppDimensions._();

  // ── Spacing (multiples of 4) ─────────────────────────────────────
  static const double spaceXxs  =  2.0;
  static const double spaceXs   =  4.0;
  static const double spaceSm   =  8.0;
  static const double spaceMd   = 12.0;
  static const double spaceLg   = 16.0;
  static const double spaceXl   = 20.0;
  static const double spaceXxl  = 24.0;
  static const double space3xl  = 32.0;
  static const double space4xl  = 40.0;
  static const double space5xl  = 48.0;
  static const double space6xl  = 64.0;

  // ── Corner radius ───────────────────────────────────────────────
  static const double radiusNone   =  0.0;
  static const double radiusXs     =  4.0;
  static const double radiusSm     =  8.0;
  static const double radiusMd     = 12.0;
  static const double radiusLg     = 16.0;   // card default
  static const double radiusXl     = 20.0;
  static const double radiusXxl    = 24.0;   // modal sheets
  static const double radius3xl    = 32.0;
  static const double radiusFull   = 999.0;  // pill / avatar

  // ── Elevation ───────────────────────────────────────────────────
  static const double elevationNone  =  0.0;
  static const double elevationXs    =  1.0;
  static const double elevationSm    =  2.0;
  static const double elevationMd    =  4.0;
  static const double elevationLg    =  8.0;
  static const double elevationXl    = 12.0;
  static const double elevationXxl   = 16.0;

  // ── Icon sizes ──────────────────────────────────────────────────
  static const double iconXs   = 12.0;
  static const double iconSm   = 16.0;
  static const double iconMd   = 20.0;
  static const double iconLg   = 24.0;  // default
  static const double iconXl   = 32.0;
  static const double iconXxl  = 40.0;
  static const double icon3xl  = 48.0;

  // ── Component sizes ─────────────────────────────────────────────
  static const double buttonHeightSm  = 36.0;
  static const double buttonHeightMd  = 48.0;  // primary button
  static const double buttonHeightLg  = 56.0;

  static const double inputHeight     = 52.0;
  static const double appBarHeight    = 60.0;
  static const double bottomNavHeight = 68.0;
  static const double cardMinHeight   = 80.0;

  static const double avatarSm  = 32.0;
  static const double avatarMd  = 40.0;
  static const double avatarLg  = 56.0;
  static const double avatarXl  = 80.0;

  // ── Layout ──────────────────────────────────────────────────────
  static const double pageHorizontalPadding = 20.0;
  static const double pageVerticalPadding   = 24.0;
  static const double sectionSpacing        = 32.0;
  static const double dividerThickness      =  1.0;
}
