import 'package:flutter/material.dart';

class AutoRouteLogger extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint(
      "FLUTTER_ROUTE: PUSH → ${_extractName(route)} | From → ${_extractName(previousRoute)}"
    );
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    debugPrint(
      "FLUTTER_ROUTE: REPLACE → ${_extractName(oldRoute)} WITH → ${_extractName(newRoute)}"
    );
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    debugPrint(
      "FLUTTER_ROUTE: POP → ${_extractName(route)} | Back To → ${_extractName(previousRoute)}"
    );
  }

  // -------------------------
  // 🔥 CORE: Extract screen/widget name
  // -------------------------
  String _extractName(Route? route) {
  if (route == null) return "null";

  // Named route
  if (route.settings.name != null && route.settings.name!.trim().isNotEmpty) {
    if (route.settings.name == '/') {
      // Map `/` to actual widget type
      if (route is MaterialPageRoute) {
        final widget = route.builder(route.navigator!.context);
        return widget.runtimeType.toString();
      }
    }
    return route.settings.name!;
  }

  // MaterialPageRoute fallback
  if (route is MaterialPageRoute) {
    final widget = route.builder(route.navigator!.context);
    return widget.runtimeType.toString();
  }

  // Last fallback
  return route.runtimeType.toString();
}
}
