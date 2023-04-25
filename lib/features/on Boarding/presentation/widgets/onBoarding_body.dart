import 'package:mysoftwareproject/core/constant.dart';
import 'package:mysoftwareproject/core/utils/size_config.dart';
import 'package:mysoftwareproject/core/widgets/custom_buttons.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/login_view.dart';
import 'package:mysoftwareproject/features/on%20Boarding/presentation/widgets/custom_indictor.dart';
import 'package:mysoftwareproject/features/on%20Boarding/presentation/widgets/custom_page_view.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';



class onBoardingBody extends StatefulWidget {
  const onBoardingBody({Key? key}) : super(key: key);

  @override
  State<onBoardingBody> createState() => _onBoardingBodyState();
}

class _onBoardingBodyState extends State<onBoardingBody> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          Custompageview(
            pageController: pageController,
          ),
          Positioned(
            left: 0,
              right: 0,
              bottom: SizeConfig.defaultSize!*18,
              child: customindicator(
                dots:pageController!.hasClients ? pageController?.page : 0,
              )
          ),
          Visibility(
            visible: pageController!.hasClients
                ? (pageController?.page == 2 ? false : true)
                : true,
            child: Positioned(
              top: SizeConfig.defaultSize! * 10,
              right: 32,
              child: InkWell(
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xff898989),
                  ),
                ),
                onTap: (){
                  Get.to(() => login_view(), transition: Transition.rightToLeft , duration: Duration(milliseconds: 500));
                },
              )
            ),
          ),

          Positioned(
              left: SizeConfig.defaultSize! * 10,
              right: SizeConfig.defaultSize! * 10,
              bottom: SizeConfig.defaultSize! * 10,
              child: generalButton(
                onTap: () {
                  if (pageController!.page! < 2) {
                    pageController?.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  } else {
                     Get.to(() => login_view(), transition: Transition.rightToLeft , duration: Duration(milliseconds: 500));
                  }
                },
                text: pageController!.hasClients
                    ? (pageController?.page == 2 ? 'Get started' : 'Next')
                    : 'Next',
              )),
        ],
      ),
    );
  }
}
