import 'package:e_commerce/core/di/service_locator.dart';
import 'package:e_commerce/core/widgets/error_indicator.dart';
import 'package:e_commerce/core/widgets/loading_indicator.dart';
import 'package:e_commerce/featuers/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/featuers/home/presentation/cubit/home_state.dart';
import 'package:e_commerce/featuers/home/presentation/widgets/brand_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsSection extends StatelessWidget {
  const BrandsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator.get<HomeCubit>()..getBrands(),
      child: SizedBox(
        height: 280.h,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is GetBrandsLoading) {
              return const LoadingIndicator();
            } else if (state is GetBrandsError) {
              return ErrorIndicator(state.message);
            } else if (state is GetBrandsSuccess) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    mainAxisExtent: 100.h,
                    childAspectRatio: 100 / 114),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => BrandItem(state.brandsList[index]),
                itemCount: state.brandsList.length,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
