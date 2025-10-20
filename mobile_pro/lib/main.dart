import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zelus_ui/zelus_ui.dart';
import 'core/router/app_router.dart';

void main() {
  runApp(
    const ProviderScope(
      child: ZelusProApp(),
    ),
  );
}

class ZelusProApp extends ConsumerWidget {
  const ZelusProApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Zelus Pro',
      debugShowCheckedModeBanner: false,
      theme: ZelusTheme.lightTheme,
      darkTheme: ZelusTheme.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: router,
    );
  }
}

