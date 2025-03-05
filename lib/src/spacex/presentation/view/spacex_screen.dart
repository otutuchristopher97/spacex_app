import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:spacex_app/core/common/widget/customer_text.dart';
import 'package:spacex_app/core/resources/app_colors.dart';
import 'package:spacex_app/core/resources/media_res.dart';
import 'package:spacex_app/core/routing/router.dart';
import 'package:spacex_app/src/spacex/presentation/cubit/spacex/spacex_cubit.dart';
import 'package:spacex_app/src/spacex/presentation/view/widget/spacex_widget.dart';

class SpacexScreen extends StatefulWidget {
  const SpacexScreen({super.key});

  @override
  State<SpacexScreen> createState() => _SpacexScreenState();
}

class _SpacexScreenState extends State<SpacexScreen> {
  String? dataType;
  String _filterType = 'All';

  void getSpacex() {
    context.read<SpaceXCubit>().getSpacexListData();
  }

  @override
  void initState() {
    super.initState();
    dataType = 'online';
    final spaceXState = context.read<SpaceXCubit>().state;
    if (spaceXState is! LoadedSpaceX) {
      getSpacex();
    }
  }

  Future<void> _refreshData() async {
    getSpacex();
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: const CustomText(
            text: 'List of Spacex',
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          BlocBuilder<SpaceXCubit, SpaceXState>(
            builder: (context, state) {
              if (state is LoadingSpaceX) {
                return Expanded(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(MediaRes.loading, height: 40, width: 50),
                        const SizedBox(height: 5),
                        const CustomText(text: 'Processing', fontSize: 14),
                      ],
                    ),
                  ),
                );
              }
              if (state is SpaceXError) {
                return Center(child: CustomText(text: state.message));
              }
              if (state is LoadedSpaceX) {
                // Dropdown for filtering launches (only shown when data is loaded)

                // Apply filtering based on selection
                final filteredData =
                    state.spacexData.where((launch) {
                      if (_filterType == 'All') return true;
                      if (_filterType == 'Success') {
                        return launch.success == true;
                      }
                      if (_filterType == 'Failure') {
                        return launch.success == false;
                      }
                      return true;
                    }).toList();

                if (filteredData.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            MediaRes.emptylogo,
                            height: 100,
                            width: 100,
                          ),
                          const SizedBox(height: 10),
                          const CustomText(
                            text: 'No Launches Found',
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white, // Background color
                            borderRadius: BorderRadius.circular(
                              12,
                            ), // Rounded corners
                            border: Border.all(
                              color: Colors.grey.shade400,
                            ), // Border color
                          ),
                          child: DropdownButtonHideUnderline(
                            // Hides default underline
                            child: DropdownButton<String>(
                              value: _filterType,
                              isExpanded: true,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _filterType = newValue!;
                                });
                              },
                              items: const [
                                DropdownMenuItem(
                                  value: 'All',
                                  child: Text('All Launches'),
                                ),
                                DropdownMenuItem(
                                  value: 'Success',
                                  child: Text('Successful Launches'),
                                ),
                                DropdownMenuItem(
                                  value: 'Failure',
                                  child: Text('Failed Launches'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: _refreshData,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: filteredData.length,
                            itemBuilder: (context, index) {
                              return SpacexWidget(
                                spaceXEntity: filteredData[index],
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    RouteConstants.spacexdetailscreen,
                                    arguments: {'id': filteredData[index].id},
                                  );
                                },
                              );
                            },
                            padding: const EdgeInsets.all(10),
                          ),
                        ),
                      ),
                    ],
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
        ],
      ),
    );
  }
}
