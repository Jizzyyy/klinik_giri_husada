import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klinik_giri_husada/helpers/colorThemes.dart';
import 'package:klinik_giri_husada/widgets/TextHelper.dart';

class SuccessCancel extends StatelessWidget {
  const SuccessCancel({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // Navigator.of(context)
          //     .pushNamedAndRemoveUntil('/home', (route) => false);
          Navigator.pop(context, 'refresh');
          return true;
        },
        child: Scaffold(
          backgroundColor: Color(0xffF1F1F1),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/cancelled.png',
                width: 120.w,
                height: 120.h,
              ),
              SizedBox(height: 60.h),
              TextHelper(text: 'Pesanan Telah Dibatalkan', fontSize: 20.sp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: TextHelper(
                  text:
                      'Pesanan anda telah dibatalkan dan nomor antrian yang diterima akan ditarik kembali.',
                  fontSize: 18.sp,
                  textAlign: TextAlign.center,
                  fontColor: AppColors.grey,
                ),
              ),
              SizedBox(height: 32.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 14.w),
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, 'refresh');
                      // Navigator.of(context)
                      //     .pushNamedAndRemoveUntil('/home', (route) => false);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: TextHelper(
                        text: 'Kembali',
                        fontSize: 20.sp,
                        fontColor: Colors.white,
                      ),
                    )),
              )
            ],
          )),
        ));
  }
}
