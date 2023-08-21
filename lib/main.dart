import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_update_http_2_flutter/controller/theme_controller.dart';
import 'package:test_update_http_2_flutter/themes.dart';


void main() {

  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      assignId: true,
      builder: (controller) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: controller.appTheme.value,
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Dio dio;

  @override
  void initState() {
    super.initState();
    dio = Dio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Get.find<ThemeController>().changeTheme(Themes.lightTheme);
                },
                child: const Text('Set default theme')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.find<ThemeController>().changeTheme(Themes.blueTheme);
                },
                child: const Text('Set blue theme')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.find<ThemeController>().changeTheme(Themes.greenTheme);
                },
                child: const Text('Set green theme')),
          ],
        ),
      ),
    );
  }

  Future<void> startCallApi() async {
    final response = await dio.post(
        'https://dgbs.vpa.com.vn/web-api/admin-api/public/license-plate',
        data: {
          'limit': 10,
          'offset': 0,
          'license_plate': '',
          'province': '',
          'vehicle': ''
        });
    debugPrint('RESPONSE: $response');
  }
}
