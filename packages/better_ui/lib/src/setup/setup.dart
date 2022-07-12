import 'package:better_ui/better_ui.dart';
import 'package:catcher/catcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

mixin SetupMixin {
  ///
  /// quick run app:
  ///
  Future<void> runQuick({
    required WidgetCallback appFn,
    List<AsyncCallback>? beforeRun,
    List<AsyncCallback>? afterRun,

    ///
    bool useCatcher = true,
    bool init = true,
    String? sentryDSN,
    String? discordUrl,
    List<String>? emailTo,
  }) async {
    await setupApp(
      runAppFn: () => runner(
        appFn: appFn,
        useCatcher: useCatcher,
        sentryDSN: sentryDSN,
        discordUrl: discordUrl,
        emailTo: emailTo,
      ),
      beforeRun: beforeRun,
      afterRun: afterRun,
      init: init,
    );
  }

  ///
  /// app setup:
  ///
  Future<void> setupApp({
    required VoidCallback runAppFn,
    List<AsyncCallback>? beforeRun,
    List<AsyncCallback>? afterRun,
    bool init = true,
  }) async {
    /// with default:
    if (init) {
      _setupBeforeHook();
    }

    ///
    /// before:
    ///
    if (beforeRun != null) {
      for (var fn in beforeRun) {
        await fn();
      }
    }

    ui.print('setup before run app...');
    ui.print('ready to run app...');

    ///
    /// run app:
    ///
    runAppFn();

    ui.print('setup after run app...');

    ///
    /// after:
    ///
    if (afterRun != null) {
      for (var fn in afterRun) {
        await fn();
      }
    }

    /// with default:
    if (init) {
      _setupAfterHook();
    }
  }

  /// hook:
  void _setupBeforeHook() {
    WidgetsFlutterBinding.ensureInitialized();
  }

  void _setupAfterHook() {
    var systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  void runner({
    required WidgetCallback appFn,
    bool useCatcher = true,
    String? sentryDSN,
    String? discordUrl,
    List<String>? emailTo,
  }) {
    if (!useCatcher) {
      return runApp(appFn());
    }

    var debugOptions = CatcherOptions(
      SilentReportMode(),
      [
        ConsoleHandler(),
        if (sentryDSN != null)
          SentryHandler(
            SentryClient(
              SentryOptions(dsn: sentryDSN),
            ),
          )
      ],
      // logger: CatcherLoggerEx(),
    );

    var releaseOptions = CatcherOptions(
      SilentReportMode(),
      [
        if (discordUrl != null)
          DiscordHandler(
            discordUrl,
            enableDeviceParameters: true,
            enableApplicationParameters: true,
            enableCustomParameters: true,
            enableStackTrace: true,
            printLogs: true,
          ),
        if (emailTo != null)
          EmailManualHandler(
            emailTo,
          ),
      ],
      // logger: CatcherLoggerEx(),
    );

    var profileOptions = CatcherOptions(
      PageReportMode(),
      [
        ConsoleHandler(),
        ToastHandler(),
      ],
      handlerTimeout: 10000,
      customParameters: {'example': 'example_parameter'},
      // logger: CatcherLoggerEx(),
    );

    ///
    /// catcher:
    ///
    final blackList = <String>[
      'plugins.flutter.io/sensors/gyroscope',
      'plugins.flutter.io/sensors/user_accel',
      'plugins.flutter.io/sensors/accelerometer',
    ];

    Catcher(
      runAppFunction: () {
        runApp(appFn());
      },
      debugConfig: debugOptions,
      releaseConfig: releaseOptions,
      profileConfig: profileOptions,
      ensureInitialized: true,
    );
  }
}
