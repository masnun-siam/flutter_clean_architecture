import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart'
    as flutter_clean_architecture;

import '../../../data/repositories/data_users_repository.dart';
import './home_controller.dart';

class HomePage extends flutter_clean_architecture.View {
  const HomePage({super.key, this.title});

  final String? title;

  @override
  HomePageState createState() =>
      // inject dependencies inwards
      HomePageState();
}

class HomePageState
    extends flutter_clean_architecture.ViewState<HomePage, HomeController> {
  HomePageState() : super(HomeController(DataUsersRepository()));

  @override
  Widget get view {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
      ),
      body: Scaffold(
        key:
            globalKey, // built in global key for the ViewState for easy access in the controller
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              flutter_clean_architecture.ControlledWidgetBuilder<
                  HomeController>(
                builder: (context, controller) {
                  return Text(
                    'Button pressed ${controller.counter} times.',
                  );
                },
              ),
              const Text(
                'The current user is',
              ),
              flutter_clean_architecture.ControlledWidgetBuilder<
                  HomeController>(
                builder: (context, controller) {
                  return Text(
                    '${controller.user}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
              flutter_clean_architecture.ControlledWidgetBuilder<
                  HomeController>(
                builder: (context, controller) {
                  return ElevatedButton(
                    onPressed: controller.getUser,
                    child: const Text(
                      'Get User',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
              flutter_clean_architecture.ControlledWidgetBuilder<
                  HomeController>(
                builder: (context, controller) {
                  return ElevatedButton(
                    onPressed: controller.getUserWithError,
                    child: const Text(
                      'Get User Error',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
          flutter_clean_architecture.ControlledWidgetBuilder<HomeController>(
        builder: (context, controller) {
          return FloatingActionButton(
            onPressed: () => controller.buttonPressed(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
