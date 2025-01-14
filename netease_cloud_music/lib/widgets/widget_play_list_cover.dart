import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/utils/number_utils.dart';

/// 歌单、新碟上架等封面组件
class PlayListCoverWidget extends StatelessWidget {

  final String url;
  final int playCount;
  final double width;


  PlayListCoverWidget(this.url, {this.playCount, this.width = 200});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: Container(
        width: ScreenUtil().setWidth(width),
        height: ScreenUtil().setWidth(width),
        child: Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            Image.network(url),
            playCount == null
                ? Container()
                : Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setWidth(2),
                  right: ScreenUtil().setWidth(5)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    'images/icon_triangle.png',
                    width: ScreenUtil().setWidth(30),
                    height: ScreenUtil().setWidth(30),
                  ),
                  Text(
                    '${NumberUtils.amountConversion(playCount)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
