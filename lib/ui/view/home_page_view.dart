import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scale_button/scale_button.dart';
import 'package:vpn/core/constants/colors.dart';
import 'package:vpn/ui/widgets/circle_progress.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    _animation = Tween<double>(begin: 0, end: 100).animate(_animationController!)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _animation?.value == null && _animationController == null
          ? Container()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 36.w, top: 61.h),
                  child: SvgPicture.asset(
                    'assets/icons/menu.svg',
                  ),
                ),
                _animation?.value != 100
                    ? Padding(
                        padding: EdgeInsets.only(left: 79.w, top: 149.h),
                        child: AnimatedContainer(
                          height: 272.h,
                          width: 272.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(272),
                            border: Border.all(color: ColorStyles.mainBorderAnimation, width: 21.w),
                          ),
                          duration: const Duration(seconds: 3),
                          child: Center(
                            child: CustomPaint(
                              foregroundPainter: CirculProgress(_animation?.value ?? 0),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/icons/shape.svg',
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(left: 79.w, top: 149.h),
                        child: Container(
                          height: 272.h,
                          width: 272.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(272),
                            border: Border.all(color: ColorStyles.mainBorderAnimation, width: 15.w),
                          ),
                          child: CustomPaint(
                            foregroundPainter: CirculProgress(_animation?.value ?? 0),
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorStyles.paintedBorderAnimation,
                                  borderRadius: BorderRadius.circular(149.88.r),
                                ),
                                height: 149.88.h,
                                width: 149.88.w,
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/white_shape.svg',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 48.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 92.w,
                    ),
                    SvgPicture.asset(
                      'assets/icons/internet.svg',
                    ),
                    SizedBox(
                      width: 27.w,
                    ),
                    Text(
                      'Наилучшая скорость',
                      style: TextStyle(fontSize: 15.sp, color: ColorStyles.text),
                    ),
                    SizedBox(
                      width: 53.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 15.h,
                    ),
                  ],
                ),
                SizedBox(
                  height: 48.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 59.w),
                  child: SizedBox(
                    child: ScaleButton(
                      bound: 0.02,
                      onTap: () {
                        setState(() {
                          if (_animation?.value == null && _animationController == null) {
                          } else {
                            if (_animation?.value == 100) {
                              _animationController?.reset();
                            } else {
                              if (_animationController != null) {
                                _animationController?.forward();
                              }
                            }
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorStyles.bottoms,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Container(
                          color: Colors.transparent,
                          height: 69.h,
                          width: 320.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _animation?.value != 100
                                    ? _animation?.value == 0
                                        ? 'Подключиться'
                                        : 'Подключение'
                                    : 'Отключиться',
                                style: TextStyle(fontSize: 20.sp, color: ColorStyles.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 51.w),
                  child: Text(
                    'Условия пользования и Политика конфиденциальности',
                    style: TextStyle(fontSize: 12.sp, color: ColorStyles.text)
                        .copyWith(decoration: TextDecoration.underline),
                  ),
                ),
                SizedBox(
                  height: 79.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 36.w),
                  child: SizedBox(
                    child: ScaleButton(
                      bound: 0.02,
                      onTap: () {},
                      child: Container(
                        height: 85.h,
                        width: 358.w,
                        decoration: BoxDecoration(
                          color: ColorStyles.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(width: 1, color: ColorStyles.border),
                        ),
                        child: Container(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ADS',
                                style: TextStyle(fontSize: 18.sp, color: ColorStyles.text),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
