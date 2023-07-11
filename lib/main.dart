import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vpn/ui/view/home_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //OLD
      // designSize: const Size(375, 812),
      //NEW
      designSize: const Size(430, 932),
      builder: (context, child) {
        return const MaterialApp(
          home: HomePage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}