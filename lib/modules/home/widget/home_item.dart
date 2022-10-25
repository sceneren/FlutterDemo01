import 'package:flutter/material.dart';
import 'package:flutter_demo/res/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/article_mo.dart';

class HomeItem extends StatelessWidget {
  final ArticleMo? articleMo;
  final GestureTapCallback? onTap;

  const HomeItem({super.key, this.articleMo, this.onTap});

  @override
  Widget build(BuildContext context) {
    var author = articleMo?.author ?? "";
    var shareUser = articleMo?.shareUser ?? "";
    author = author.isEmpty ? shareUser : author;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
          width: ScreenUtil().screenWidth,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20.w),
                    child: Text(
                        author,
                        style: TextStyle(
                            fontSize: 25.sp,
                            color: ColorRes.color_707070,
                            fontWeight: FontWeight.w500)),
                  ),
                  //var currentTime= DateTime.now().millisecondsSinceEpoch;
                  Visibility(
                      visible: (articleMo?.shareDate ?? 0) >
                          DateTime.now().millisecondsSinceEpoch -
                              24 * 60 * 60 * 1000,
                      child: Container(
                        margin: EdgeInsets.only(right: 20.w),
                        width: 40.w,
                        height: 40.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorRes.color_ff0000, width: 1.w),
                        ),
                        child: Text("新",
                            style: TextStyle(
                                fontSize: 25.sp,
                                color: ColorRes.color_ff0000,
                                fontWeight: FontWeight.w500)),
                      )),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20.w),
                child: Text(articleMo?.title ?? "",
                    style: TextStyle(
                        fontSize: 25.sp,
                        color: ColorRes.color_232323,
                        fontWeight: FontWeight.w500)),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.w),
                child: Text(articleMo?.niceShareDate ?? "",
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: ColorRes.color_767A7F,
                        fontWeight: FontWeight.w500)),
              )
            ],
          )),
    );
  }
}
