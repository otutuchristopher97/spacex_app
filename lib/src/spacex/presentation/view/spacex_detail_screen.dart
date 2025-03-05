import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:spacex_app/core/common/widget/customer_text.dart';
import 'package:spacex_app/core/resources/app_colors.dart';
import 'package:spacex_app/core/resources/media_res.dart';
import 'package:spacex_app/core/utils/data_function.dart';
import 'package:spacex_app/src/spacex/presentation/cubit/spacexdetail/spacex_detail_cubit.dart';

class SpacexDetailScreen extends StatefulWidget {
  const SpacexDetailScreen({super.key, required this.spacexId});

  final String? spacexId;

  @override
  State<SpacexDetailScreen> createState() => _SpacexDetailScreenState();
}

class _SpacexDetailScreenState extends State<SpacexDetailScreen> {
  void getSpacexDetail() {
    context.read<SpacexDetailCubit>().getSpacexDetailData(id: widget.spacexId!);
  }

  @override
  void initState() {
    super.initState();
    getSpacexDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: AppColors.blackTextColor),
        ),
        title: const CustomText(
          text: 'Mission Details',
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: BlocBuilder<SpacexDetailCubit, SpaceXDetailState>(
        builder: (context, state) {
          if (state is LoadingSpaceXDetail) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(MediaRes.loading, height: 40, width: 50),
                  const SizedBox(height: 5),
                  const CustomText(text: 'Processing', fontSize: 14),
                ],
              ),
            );
          }
          if (state is SpaceXDetailError) {
            return Center(
              child: CustomText(
                text: state.message,
              )
            );
          }
          if (state is LoadedSpaceXDetail) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: state.spacex.links.largePatch != null &&
                              state.spacex.links.largePatch!.isNotEmpty
                          ? Image.network(
                              state.spacex.links.largePatch!,
                              width: 200,
                              height: 200,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.broken_image, size: 200),
                            )
                          : const Icon(Icons.broken_image, size: 200),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      state.spacex.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Launch Date and Time
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 20),
                        const SizedBox(width: 5),
                        Text(
                          formatDate(state.spacex.dateUtc),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Success/Failure Status
                    Row(
                      children: [
                        Icon(
                          state.spacex.success == true
                              ? Icons.check_circle
                              : Icons.cancel,
                          color:
                              state.spacex.success == true ? Colors.green : Colors.red,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          state.spacex.success == true ? 'Success' : 'Failure',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color:
                                state.spacex.success == true ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Mission Details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      state.spacex.details,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          }
          return Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: Lottie.asset(MediaRes.pageUnderConstruction),
            ),
          );
        },
      ),
    );
  }
}
