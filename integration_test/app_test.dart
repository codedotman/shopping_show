// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shopping_show/main.dart' as app;

void main() {
  group("App test", () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("Add a Product", (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key("add_product_fab")));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key("add_product_form")), findsOneWidget);
      await tester.pumpAndSettle();
      await tester.enterText(
          find.byKey(const Key("item_name_key")), "nice wears");
      await tester.enterText(find.byKey(const Key("item_quantity_key")), "22");
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key("add_product_button")));
      await tester.pumpAndSettle();
      expect(find.text('Successful'), findsOneWidget);
    });
  });
}
