import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_colors.dart';
import 'app_dimensions.dart';
import 'app_theme_extension.dart';
import 'app_text_theme.dart';

/// ─────────────────────────────────────────────────────────────────
/// AppTheme – assembles all tokens into Material 3 ThemeData.
///
/// Usage in MaterialApp:
///   MaterialApp(
///     theme:      AppTheme.light,
///     darkTheme:  AppTheme.dark,
///     themeMode:  ThemeMode.system,
///   )
/// ─────────────────────────────────────────────────────────────────
abstract final class AppTheme {
  AppTheme._();

  // ────────────────────────────────────────────────────────────────
  // DARK  (primary design in the Figma kit)
  // ────────────────────────────────────────────────────────────────
  static ThemeData get dark => _build(
    brightness: Brightness.dark,
    colorScheme: _darkColorScheme,
    ext: AppThemeExtension.dark,
    systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: AppColors.neutral950,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  // ────────────────────────────────────────────────────────────────
  // LIGHT
  // ────────────────────────────────────────────────────────────────
  static ThemeData get light => _build(
    brightness: Brightness.light,
    colorScheme: _lightColorScheme,
    ext: AppThemeExtension.light,
    systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: AppColors.neutral50,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // ════════════════════════════════════════════════════════════════
  // PRIVATE BUILDERS
  // ════════════════════════════════════════════════════════════════

  static ThemeData _build({
    required Brightness brightness,
    required ColorScheme colorScheme,
    required AppThemeExtension ext,
    required SystemUiOverlayStyle systemOverlayStyle,
  }) {
    final bool isDark = brightness == Brightness.dark;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      extensions: [ext],

      // ── Scaffold ──────────────────────────────────────────────
      scaffoldBackgroundColor: colorScheme.surface,

      // ── App Bar ──────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: AppTextTheme.titleLarge.copyWith(
          color: colorScheme.onSurface,
        ),
        iconTheme: IconThemeData(
          color: colorScheme.onSurface,
          size: AppDimensions.iconLg,
        ),
        actionsIconTheme: IconThemeData(
          color: colorScheme.onSurface,
          size: AppDimensions.iconLg,
        ),
        systemOverlayStyle: systemOverlayStyle,
        toolbarHeight: AppDimensions.appBarHeight,
      ),

      // ── Text Theme ───────────────────────────────────────────
      textTheme: _buildTextTheme(colorScheme),

      // ── Elevated Button (primary CTA) ────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          disabledBackgroundColor: isDark
              ? AppColors.neutral700
              : AppColors.neutral200,
          disabledForegroundColor: isDark
              ? AppColors.neutral500
              : AppColors.neutral400,
          minimumSize: const Size(
            double.infinity,
            AppDimensions.buttonHeightMd,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spaceLg,
            vertical: AppDimensions.spaceMd,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimensions.radiusLg),
            ),
          ),
          textStyle: AppTextTheme.buttonLg,
          elevation: AppDimensions.elevationNone,
        ),
      ),

      // ── Outlined Button (secondary CTA) ──────────────────────
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          disabledForegroundColor: isDark
              ? AppColors.neutral600
              : AppColors.neutral400,
          minimumSize: const Size(
            double.infinity,
            AppDimensions.buttonHeightMd,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spaceLg,
            vertical: AppDimensions.spaceMd,
          ),
          side: BorderSide(color: colorScheme.primary, width: 1.5),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimensions.radiusLg),
            ),
          ),
          textStyle: AppTextTheme.buttonLg.copyWith(color: colorScheme.primary),
        ),
      ),

      // ── Text Button (tertiary / ghost) ───────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: AppTextTheme.buttonMd,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spaceMd,
            vertical: AppDimensions.spaceXs,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimensions.radiusSm),
            ),
          ),
        ),
      ),

      // ── Filled Button ────────────────────────────────────────
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spaceLg,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppDimensions.radiusLg),
            ),
          ),
          textStyle: AppTextTheme.buttonLg,
        ),
      ),

      // ── Icon Button ──────────────────────────────────────────
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: colorScheme.onSurface,
          highlightColor: colorScheme.primary.withValues(alpha: 0.1),
          padding: const EdgeInsets.all(AppDimensions.spaceSm),
        ),
      ),

      // ── Card ─────────────────────────────────────────────────
      cardTheme: CardThemeData(
        color: ext.surfaceCard,
        elevation: AppDimensions.elevationNone,
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimensions.radiusXl),
          ),
        ),
        shadowColor: Colors.transparent,
        clipBehavior: Clip.antiAlias,
      ),

      // ── Input / Text Field ───────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ext.surfaceInput,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spaceLg,
          vertical: AppDimensions.spaceMd,
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimensions.radiusMd),
          ),
          borderSide: BorderSide(color: ext.surfaceDivider, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimensions.radiusMd),
          ),
          borderSide: BorderSide(color: ext.surfaceDivider, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimensions.radiusMd),
          ),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimensions.radiusMd),
          ),
          borderSide: BorderSide(color: colorScheme.error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimensions.radiusMd),
          ),
          borderSide: BorderSide(color: colorScheme.error, width: 1.5),
        ),
        hintStyle: AppTextTheme.bodyMedium.copyWith(color: ext.textSecondary),
        labelStyle: AppTextTheme.bodyMedium.copyWith(color: ext.textSecondary),
        floatingLabelStyle: AppTextTheme.labelMedium.copyWith(
          color: colorScheme.primary,
        ),
        prefixIconColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return colorScheme.primary;
          }
          return ext.textSecondary;
        }),
        suffixIconColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return colorScheme.primary;
          }
          return ext.textSecondary;
        }),
      ),

      // ── Bottom Navigation Bar ────────────────────────────────
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: isDark ? AppColors.neutral900 : AppColors.neutral0,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: ext.textSecondary,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: AppTextTheme.labelSmall.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: AppTextTheme.labelSmall.copyWith(
          color: ext.textSecondary,
        ),
        elevation: AppDimensions.elevationNone,
      ),

      // ── Navigation Bar (M3) ──────────────────────────────────
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: isDark ? AppColors.neutral900 : AppColors.neutral0,
        indicatorColor: colorScheme.primary.withValues(alpha: 0.15),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(
              color: colorScheme.primary,
              size: AppDimensions.iconLg,
            );
          }
          return IconThemeData(
            color: ext.textSecondary,
            size: AppDimensions.iconLg,
          );
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTextTheme.labelSmall.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w600,
            );
          }
          return AppTextTheme.labelSmall.copyWith(color: ext.textSecondary);
        }),
        height: AppDimensions.bottomNavHeight,
        elevation: 0,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),

      // ── Chip ─────────────────────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor: ext.surfaceChip,
        selectedColor: colorScheme.primary.withValues(alpha: 0.20),
        labelStyle: AppTextTheme.labelMedium.copyWith(color: ext.textPrimary),
        secondaryLabelStyle: AppTextTheme.labelMedium.copyWith(
          color: colorScheme.primary,
        ),
        side: BorderSide(color: ext.surfaceDivider, width: 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimensions.radiusFull),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spaceMd,
          vertical: AppDimensions.spaceXs,
        ),
        checkmarkColor: colorScheme.primary,
        iconTheme: IconThemeData(
          color: ext.textSecondary,
          size: AppDimensions.iconSm,
        ),
      ),

      // ── Dialog / Bottom Sheet ────────────────────────────────
      dialogTheme: DialogThemeData(
        backgroundColor: ext.surfaceModal,
        elevation: AppDimensions.elevationXl,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimensions.radiusXxl),
          ),
        ),
        titleTextStyle: AppTextTheme.headlineSmall.copyWith(
          color: ext.textPrimary,
        ),
        contentTextStyle: AppTextTheme.bodyMedium.copyWith(
          color: ext.textSecondary,
        ),
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: ext.surfaceModal,
        modalBackgroundColor: ext.surfaceModal,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppDimensions.radiusXxl),
          ),
        ),
        elevation: AppDimensions.elevationXl,
        dragHandleColor: ext.surfaceDivider,
        dragHandleSize: const Size(40, 4),
        showDragHandle: true,
        modalElevation: AppDimensions.elevationXl,
        clipBehavior: Clip.antiAlias,
      ),

      // ── Divider ───────────────────────────────────────────────
      dividerTheme: DividerThemeData(
        color: ext.surfaceDivider,
        thickness: AppDimensions.dividerThickness,
        space: AppDimensions.spaceLg,
      ),

      // ── List Tile ─────────────────────────────────────────────
      listTileTheme: ListTileThemeData(
        tileColor: ext.surfaceCard,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spaceLg,
          vertical: AppDimensions.spaceSm,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimensions.radiusMd),
          ),
        ),
        titleTextStyle: AppTextTheme.titleSmall.copyWith(
          color: ext.textPrimary,
        ),
        subtitleTextStyle: AppTextTheme.bodySmall.copyWith(
          color: ext.textSecondary,
        ),
        leadingAndTrailingTextStyle: AppTextTheme.labelMedium.copyWith(
          color: ext.textSecondary,
        ),
        iconColor: ext.textSecondary,
        minLeadingWidth: AppDimensions.iconLg,
        minVerticalPadding: AppDimensions.spaceSm,
      ),

      // ── Switch ────────────────────────────────────────────────
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.neutral950;
          }
          return isDark ? AppColors.neutral600 : AppColors.neutral400;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return isDark ? AppColors.neutral700 : AppColors.neutral200;
        }),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),

      // ── Checkbox ──────────────────────────────────────────────
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(AppColors.neutral950),
        side: BorderSide(
          color: isDark ? AppColors.neutral500 : AppColors.neutral400,
          width: 1.5,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),

      // ── Radio ─────────────────────────────────────────────────
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return isDark ? AppColors.neutral500 : AppColors.neutral400;
        }),
      ),

      // ── Floating Action Button ────────────────────────────────
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: AppDimensions.elevationMd,
        focusElevation: AppDimensions.elevationLg,
        hoverElevation: AppDimensions.elevationLg,
        highlightElevation: AppDimensions.elevationXl,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimensions.radiusLg),
          ),
        ),
        extendedTextStyle: AppTextTheme.buttonLg,
        iconSize: AppDimensions.iconLg,
      ),

      // ── Tab Bar ───────────────────────────────────────────────
      tabBarTheme: TabBarThemeData(
        labelColor: colorScheme.primary,
        unselectedLabelColor: ext.textSecondary,
        indicatorColor: colorScheme.primary,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        labelStyle: AppTextTheme.labelLarge.copyWith(
          color: colorScheme.primary,
        ),
        unselectedLabelStyle: AppTextTheme.labelLarge.copyWith(
          color: ext.textSecondary,
        ),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        dividerColor: ext.surfaceDivider,
      ),

      // ── Snack Bar ─────────────────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        backgroundColor: isDark ? AppColors.neutral100 : AppColors.neutral900,
        contentTextStyle: AppTextTheme.bodyMedium.copyWith(
          color: isDark ? AppColors.neutral900 : AppColors.neutral0,
        ),
        actionTextColor: colorScheme.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimensions.radiusMd),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: AppDimensions.elevationLg,
      ),

      // ── Progress Indicator ────────────────────────────────────
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.primary,
        linearTrackColor: isDark ? AppColors.neutral700 : AppColors.neutral200,
        circularTrackColor: isDark
            ? AppColors.neutral700
            : AppColors.neutral200,
        linearMinHeight: 4,
        refreshBackgroundColor: isDark
            ? AppColors.neutral850
            : AppColors.neutral50,
      ),

      // ── Slider ────────────────────────────────────────────────
      sliderTheme: SliderThemeData(
        activeTrackColor: colorScheme.primary,
        inactiveTrackColor: isDark
            ? AppColors.neutral700
            : AppColors.neutral200,
        thumbColor: colorScheme.primary,
        overlayColor: colorScheme.primary.withValues(alpha: 0.12),
        valueIndicatorColor: colorScheme.primary,
        valueIndicatorTextStyle: AppTextTheme.labelMedium.copyWith(
          color: colorScheme.onPrimary,
        ),
        trackHeight: 4,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
      ),

      // ── Tooltip ───────────────────────────────────────────────
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: isDark ? AppColors.neutral100 : AppColors.neutral900,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimensions.radiusSm),
          ),
        ),
        textStyle: AppTextTheme.bodySmall.copyWith(
          color: isDark ? AppColors.neutral900 : AppColors.neutral0,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spaceMd,
          vertical: AppDimensions.spaceXs,
        ),
      ),

      // ── Popup Menu ────────────────────────────────────────────
      popupMenuTheme: PopupMenuThemeData(
        color: ext.surfaceModal,
        elevation: AppDimensions.elevationLg,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimensions.radiusMd),
          ),
        ),
        textStyle: AppTextTheme.bodyMedium.copyWith(color: ext.textPrimary),
        labelTextStyle: WidgetStateProperty.all(
          AppTextTheme.bodyMedium.copyWith(color: ext.textPrimary),
        ),
      ),

      // ── Drawer ────────────────────────────────────────────────
      drawerTheme: DrawerThemeData(
        backgroundColor: ext.surfaceModal,
        elevation: AppDimensions.elevationXxl,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(AppDimensions.radiusXxl),
          ),
        ),
      ),

      // ── Icon Theme ────────────────────────────────────────────
      iconTheme: IconThemeData(
        color: ext.textPrimary,
        size: AppDimensions.iconLg,
      ),
    );
  }

  // ════════════════════════════════════════════════════════════════
  // COLOR SCHEMES
  // ════════════════════════════════════════════════════════════════

  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,

    // ── Primary (Lime-Green CTA) ─────────────────────────────────
    primary: AppColors.primary400,
    onPrimary: AppColors.neutral950,
    primaryContainer: AppColors.primary900,
    onPrimaryContainer: AppColors.primary200,

    // ── Secondary (muted green) ──────────────────────────────────
    secondary: AppColors.primary700,
    onSecondary: AppColors.neutral0,
    secondaryContainer: AppColors.primary800,
    onSecondaryContainer: AppColors.primary200,

    // ── Tertiary (info blue) ─────────────────────────────────────
    tertiary: AppColors.info500,
    onTertiary: AppColors.neutral0,
    tertiaryContainer: AppColors.info700,
    onTertiaryContainer: AppColors.info100,

    // ── Error ─────────────────────────────────────────────────────
    error: AppColors.error500,
    onError: AppColors.neutral0,
    errorContainer: AppColors.error700,
    onErrorContainer: AppColors.error100,

    // ── Surfaces ─────────────────────────────────────────────────
    surface: AppColors.neutral950, // scaffold bg
    onSurface: AppColors.neutral0,
    surfaceContainerHighest: AppColors.neutral800,
    surfaceContainerHigh: AppColors.neutral850,
    surfaceContainer: AppColors.neutral850,
    surfaceContainerLow: AppColors.neutral900,
    surfaceContainerLowest: AppColors.neutral950,
    surfaceBright: AppColors.neutral800,
    surfaceDim: AppColors.neutral950,

    // ── Outline ──────────────────────────────────────────────────
    outline: AppColors.neutral700,
    outlineVariant: AppColors.neutral800,

    // ── Inverse ──────────────────────────────────────────────────
    inverseSurface: AppColors.neutral100,
    onInverseSurface: AppColors.neutral900,
    inversePrimary: AppColors.primary600,

    // ── Shadow / Scrim ───────────────────────────────────────────
    shadow: AppColors.neutral950,
    scrim: AppColors.neutral950,
  );

  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,

    // ── Primary ──────────────────────────────────────────────────
    primary: AppColors.primary500,
    onPrimary: AppColors.neutral950,
    primaryContainer: AppColors.primary100,
    onPrimaryContainer: AppColors.primary800,

    // ── Secondary ────────────────────────────────────────────────
    secondary: AppColors.primary600,
    onSecondary: AppColors.neutral0,
    secondaryContainer: AppColors.primary100,
    onSecondaryContainer: AppColors.primary700,

    // ── Tertiary ─────────────────────────────────────────────────
    tertiary: AppColors.info500,
    onTertiary: AppColors.neutral0,
    tertiaryContainer: AppColors.info100,
    onTertiaryContainer: AppColors.info700,

    // ── Error ─────────────────────────────────────────────────────
    error: AppColors.error500,
    onError: AppColors.neutral0,
    errorContainer: AppColors.error100,
    onErrorContainer: AppColors.error700,

    // ── Surfaces ─────────────────────────────────────────────────
    surface: AppColors.neutral50,
    onSurface: AppColors.neutral950,
    surfaceContainerHighest: AppColors.neutral200,
    surfaceContainerHigh: AppColors.neutral100,
    surfaceContainer: AppColors.neutral50,
    surfaceContainerLow: AppColors.neutral50,
    surfaceContainerLowest: AppColors.neutral0,
    surfaceBright: AppColors.neutral0,
    surfaceDim: AppColors.neutral200,

    // ── Outline ──────────────────────────────────────────────────
    outline: AppColors.neutral300,
    outlineVariant: AppColors.neutral200,

    // ── Inverse ──────────────────────────────────────────────────
    inverseSurface: AppColors.neutral900,
    onInverseSurface: AppColors.neutral50,
    inversePrimary: AppColors.primary300,

    // ── Shadow / Scrim ───────────────────────────────────────────
    shadow: AppColors.neutral900,
    scrim: AppColors.neutral900,
  );

  // ════════════════════════════════════════════════════════════════
  // TEXT THEME
  // ════════════════════════════════════════════════════════════════

  static TextTheme _buildTextTheme(ColorScheme cs) => TextTheme(
    displayLarge: AppTextTheme.displayLarge.copyWith(color: cs.onSurface),
    displayMedium: AppTextTheme.displayMedium.copyWith(color: cs.onSurface),
    displaySmall: AppTextTheme.displaySmall.copyWith(color: cs.onSurface),

    headlineLarge: AppTextTheme.headlineLarge.copyWith(color: cs.onSurface),
    headlineMedium: AppTextTheme.headlineMedium.copyWith(color: cs.onSurface),
    headlineSmall: AppTextTheme.headlineSmall.copyWith(color: cs.onSurface),

    titleLarge: AppTextTheme.titleLarge.copyWith(color: cs.onSurface),
    titleMedium: AppTextTheme.titleMedium.copyWith(color: cs.onSurface),
    titleSmall: AppTextTheme.titleSmall.copyWith(color: cs.onSurface),

    bodyLarge: AppTextTheme.bodyLarge.copyWith(color: cs.onSurface),
    bodyMedium: AppTextTheme.bodyMedium.copyWith(color: cs.onSurface),
    bodySmall: AppTextTheme.bodySmall.copyWith(
      color: cs.onSurface.withValues(alpha: 0.7),
    ),

    labelLarge: AppTextTheme.labelLarge.copyWith(color: cs.onSurface),
    labelMedium: AppTextTheme.labelMedium.copyWith(color: cs.onSurface),
    labelSmall: AppTextTheme.labelSmall.copyWith(
      color: cs.onSurface.withValues(alpha: 0.6),
    ),
  );
}
