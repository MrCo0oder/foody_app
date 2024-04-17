import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foody_app/presentation/onboarding/onboarding_viewmodel.dart';
import 'package:foody_app/presentation/utils/app_constants.dart';
import 'package:foody_app/presentation/utils/assets_manager.dart';
import 'package:foody_app/presentation/utils/color_manager.dart';
import 'package:foody_app/presentation/utils/strings_manager.dart';
import 'package:foody_app/presentation/utils/values_manager.dart';

import '../../domain/model/onboarding_slider.dart';
import '../utils/routes_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController pageController = PageController();
  OnboardingViewModel _viewModel = OnboardingViewModel();

  _binding() {
    _viewModel.onStart();
  }

  @override
  void initState() {
    _binding();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OnboardingSliderViewObject>(
        stream: _viewModel.outputSliderViewObject,
        builder: (context, snapshot) {
          return _getContentWidget(snapshot.data);
        });
  }

  Widget _getContentWidget(OnboardingSliderViewObject? data) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: data?.pageCount,
        onPageChanged: (index) {
          _viewModel.onPageChanged(index);
        },
        itemBuilder: (context, index) {
          return OnboardingPage(
            onboardingSlider: data!.onboardingSlider,
          );
        },
      ),
      bottomSheet: Container(
        color: ColorManager.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.loginRoute);
                  },
                  child: const Text(
                    AppStrings.skip,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
            _getBottomSheetWidget(data)
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget(OnboardingSliderViewObject? data) {
    return Container(
      decoration: BoxDecoration(color: ColorManager.primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p16, horizontal: AppPadding.p20),
            child: GestureDetector(
              onTap: () {
                pageController.previousPage(
                    duration: const Duration(
                        milliseconds: AppConstants.sliderAnimationTime),
                    curve: Curves.ease);
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
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            for (int index = 0; index < data!.pageCount; index++)
              Container(
                width: data.currentIndex == index ? AppSize.s11_5 : AppSize.s10,
                height:
                    data.currentIndex == index ? AppSize.s11_5 : AppSize.s10,
                margin: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: data.currentIndex == index
                      ? Border.all(
                          color: ColorManager.white,
                          width: AppSize.s1_5,
                        )
                      : null,
                  color: data.currentIndex == index
                      ? ColorManager.primary
                      : ColorManager.white,
                ),
              )
          ]),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: GestureDetector(
              onTap: () {
                pageController.nextPage(
                    duration: const Duration(
                        milliseconds: AppConstants.sliderAnimationTime),
                    curve: Curves.ease);
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
