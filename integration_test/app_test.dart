// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:maka_live_app/main.dart' as app;

void main() {
  group("App test", () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets("full app test", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key("add_product_fab")));
      await tester.pumpAndSettle();
      await tester.enterText(
          find.byKey(const Key("item_name_key")), "nice wears");
      await tester.enterText(
          find.byKey(const Key("item_quantity_key")), "nice wears");
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key("add_product_button")));
      // await tester.pumpAndSettle();
    });
  });

  // group('Testing App Performance Tests', () {
  //   final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
  //       as IntegrationTestWidgetsFlutterBinding;
  //
  //   binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  //
  //   testWidgets('Scrolling test', (tester) async {
  //     await tester.pumpWidget(TestingApp());
  //
  //     final listFinder = find.byType(ListView);
  //
  //     await binding.watchPerformance(() async {
  //       await tester.fling(listFinder, const Offset(0, -500), 10000);
  //       await tester.pumpAndSettle();
  //
  //       await tester.fling(listFinder, const Offset(0, 500), 10000);
  //       await tester.pumpAndSettle();
  //     }, reportKey: 'scrolling_summary');
  //   });
  //
  //   testWidgets('Favorites operations test', (tester) async {
  //     await tester.pumpWidget(TestingApp());
  //
  //     final iconKeys = [
  //       'icon_0',
  //       'icon_1',
  //       'icon_2',
  //     ];
  //
  //     for (var icon in iconKeys) {
  //       await tester.tap(find.byKey(ValueKey(icon)));
  //       await tester.pumpAndSettle(const Duration(seconds: 1));
  //
  //       expect(find.text('Added to favorites.'), findsOneWidget);
  //     }
  //
  //     await tester.tap(find.text('Favorites'));
  //     await tester.pumpAndSettle();
  //
  //     final removeIconKeys = [
  //       'remove_icon_0',
  //       'remove_icon_1',
  //       'remove_icon_2',
  //     ];
  //
  //     for (final iconKey in removeIconKeys) {
  //       await tester.tap(find.byKey(ValueKey(iconKey)));
  //       await tester.pumpAndSettle(const Duration(seconds: 1));
  //
  //       expect(find.text('Removed from favorites.'), findsOneWidget);
  //     }
  //   });
  // });
}
