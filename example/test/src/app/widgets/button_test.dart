import 'package:example/src/app/pages/home/home_controller.dart';
import 'package:example/src/app/widgets/button.dart';
import 'package:example/src/data/repositories/data_users_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'Given stateless button when homePageButton is added to parent widget then return homePageButton',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
      body: TestPage(),
    )));

    final buttonFinder = find.byType(HomePageButton);
    expect(buttonFinder, findsOneWidget);

    final textFinder = find.text('Get User');
    expect(textFinder, findsOneWidget);

    await tester.tap(buttonFinder);
    await tester.pump();
  });
}

class TestPage extends ViewWidget {
  const TestPage({
    super.key,
  });

  @override
  TestPageState createState() => TestPageState();
}

class TestPageState extends ViewWidgetState<TestPage, HomeController> {
  TestPageState() : super(HomeController(DataUsersRepository()));

  @override
  Widget get view =>
      Scaffold(key: globalKey, body: const HomePageButton(text: 'Get User'));
}
