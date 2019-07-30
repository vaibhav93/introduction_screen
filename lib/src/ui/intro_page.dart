import 'package:flutter/material.dart';
import 'package:introduction_screen/src/model/page_view_model.dart';
import 'package:introduction_screen/src/ui/intro_content.dart';

class IntroPage extends StatelessWidget {
  final PageViewModel page;

  const IntroPage({Key key, @required this.page}) : super(key: key);

  Widget _buildWidget(Widget widget, String text, TextStyle style) {
    return widget ?? Text(text, style: style, textAlign: TextAlign.center);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: page.decoration.pageColor,
      decoration: page.decoration.boxDecoration,
      child: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex:0,
            child: SizedBox(height: 10,),
            ),
            Expanded(
              flex: 1,
              child: _buildWidget(
                page.titleWidget,
                page.title,
                page.decoration.titleTextStyle,
              ),
            ),
//            const SizedBox(height: 24.0),
            Expanded(flex:page.decoration.imageFlex,child: page.image),
//            Expanded(child: const SizedBox(height: 24.0)),
            Expanded(
              flex: page.decoration.bodyFlex,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: _buildWidget(
                    page.bodyWidget,
                    page.body,
                    page.decoration.bodyTextStyle,
                  ),
                ),
              ),
            ),
//            if (page.image != null)
//              Expanded(
//                flex: page.decoration.imageFlex,
//                child: page.image,
//              ),
//            Expanded(
//              flex: page.decoration.bodyFlex,
//              child: Padding(
//                padding: const EdgeInsets.only(bottom: 70.0),
//                child: SingleChildScrollView(
//                  physics: const BouncingScrollPhysics(),
//                  child: IntroContent(page: page),
//                ),
//              ),
//            ),
          ],
        ),
      ),
    );
  }
}
