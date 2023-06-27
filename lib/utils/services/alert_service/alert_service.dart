import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../../config/resources/text_styles/app_text_styles.dart';


enum AlertType { snackBar, toast, banner }

/// [globalSnackbarKey] will be used for showing
/// Snackbar
final globalSnackbarKey = GlobalKey<ScaffoldMessengerState>();

/// [AlertService] can be used to show snackbars or toasts
/// For now only snackbar is supported
class AlertService {
  AlertService._();

  static Future<void> show({
    AlertType type = AlertType.snackBar,
    Duration? duration,
    // will be used as subtile in case of banners
    required String text,
    String? bannerTitle,
    IconData? bannerIcon,
    Color? bannerIconColor,
    Function()? onRetry,
  }) async {
    switch (type) {
      case AlertType.snackBar:
        final snackBar = SnackBar(
          duration: duration ?? const Duration(milliseconds: 600),
          content: Text(text),
        );
        globalSnackbarKey.currentState?.showSnackBar(snackBar);
        break;
      case AlertType.toast:
        toast(
          text,
          duration: duration ?? const Duration(milliseconds: 600),
        );
        break;
      case AlertType.banner:
        final banner = MaterialBanner(
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  bannerIcon,
                  color: bannerIconColor,
                  size: 32,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(bannerTitle ?? '',
                          style: AppTextStyles().heading3),
                      const SizedBox(height: 4),
                      Text(text, style: AppTextStyles().bodyText2),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Theme(
              data: ThemeData.light().copyWith(
                textButtonTheme: TextButtonThemeData(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFFFAAA52),
                    ),
                    overlayColor: MaterialStateProperty.all<Color>(
                      const Color(0xFFFAAA52).withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              child: TextButton(
                onPressed: onRetry,
                child: const Text('Dismiss'),
              ),
            ),
          ],
        );

        globalSnackbarKey.currentState?.showMaterialBanner(banner);

        Future.delayed(const Duration(seconds: 3), hide);
        break;
    }
  }

  static Future<void> hide() async {
    globalSnackbarKey.currentState?.hideCurrentSnackBar();

    globalSnackbarKey.currentState?.clearMaterialBanners();
  }
}
