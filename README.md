AutoRouteLogger Integration Guide
Purpose
-------
AutoRouteLogger logs all screen navigations automatically (push, pop, replace).
- Provides route-level visibility in adb logcat.
- Minimal setup, no changes in navigation code required.
- Logs prefix example: FLUTTER_ROUTE: PUSH -> LoginPage | From -> null
Add AutoRouteLogger File
------------------------
Create file: lib/utils/auto_route_logger.dart
Key Features:
- Implements NavigatorObserver
- Overrides didPush, didPop, didReplace
- Uses _extractName() to get route/widget name
_extractName Function
---------------------
- Returns route.settings.name if available
- For initial route `/`, converts MaterialPageRoute builder widget to type
- Fallback: route.runtimeType.toString()
Viewing Logs
------------
Run on device:
adb logcat | grep "FLUTTER_ROUTE"
Sample output:
FLUTTER_ROUTE: PUSH -> LoginPage | From -> null
FLUTTER_ROUTE: REPLACE -> LoginPage WITH -> WelcomePage
FLUTTER_ROUTE: POP -> WelcomePage | Back To -> LoginPage
Notes
-----
- Works with named routes & MaterialPageRoute
- Logs initial screen correctly
- Developers do not need to change existing navigation code
- Optional: extend _extractName() to log arguments or timestamps
