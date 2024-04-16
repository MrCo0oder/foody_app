import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foody_app/presentation/utils/app_constants.dart';
import 'package:foody_app/presentation/utils/assets_manager.dart';
import 'package:foody_app/presentation/utils/color_manager.dart';
import 'package:foody_app/presentation/utils/strings_manager.dart';
import 'package:foody_app/presentation/utils/values_manager.dart';

import '../../model/onboarding_slider.dart';
import '../utils/routes_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<OnboardingSlider> _list = _getSliderData();
  final PageController pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return OnboardingPage(
            onboardingSlider: _list[index],
          );
        },
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:AppPadding.p8),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
                  },
                  child: const Text(
                    AppStrings.skip,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
            _getBottomSheetWidget()
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      decoration: BoxDecoration(color: ColorManager.primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical:AppPadding.p16,horizontal: AppPadding.p20),
            child: GestureDetector(
              onTap: (){
                pageController.previousPage(duration: const Duration(milliseconds: AppConstants.sliderAnimationTime), curve: Curves.ease);
              },
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(
                  AssetsManager.leftArrow,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _list.map((slide) {
              int index = _list.indexOf(slide);
              return Container(
                width: _currentPage == index?AppSize.s11_5:AppSize.s10,
                height:_currentPage == index?AppSize.s11_5:AppSize.s10,
                margin: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:_currentPage == index? Border.all(
                    color: ColorManager.white,
                    width: AppSize.s1_5,
                  ) :null,
                  color: _currentPage == index
                      ? ColorManager.primary
                      : ColorManager.white,
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: GestureDetector(
              onTap: (){
                pageController.nextPage(duration: const Duration(milliseconds: AppConstants.sliderAnimationTime), curve: Curves.ease);
              },
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(AssetsManager.rightArrow),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<OnboardingSlider> _getSliderData() {
  return [
    OnboardingSlider(AppStrings.onBoardingHeader1, AppStrings.onBoardingBody1,
        AssetsManager.onBoarding1),
    OnboardingSlider(AppStrings.onBoardingHeader2, AppStrings.onBoardingBody2,
        AssetsManager.onBoarding2),
    OnboardingSlider(AppStrings.onBoardingHeader3, AppStrings.onBoardingBody3,
        AssetsManager.onBoarding3),
    OnboardingSlider(AppStrings.onBoardingHeader4, AppStrings.onBoardingBody4,
        AssetsManager.onBoarding4),
  ];
}

class OnboardingPage extends StatelessWidget {
  final OnboardingSlider onboardingSlider;

  const OnboardingPage({super.key, required this.onboardingSlider});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
          child: Text(
            onboardingSlider.header,
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Text(
            onboardingSlider.body,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(
          onboardingSlider.imagePath,
        )
      ],
    );
  }
}
