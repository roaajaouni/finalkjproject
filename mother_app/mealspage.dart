import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/mother_blocs/mother_select_meals_bloc/selecte_meals_bloc.dart';
import 'package:flutter_childhood/model/mother_app_model/mother_meals_model.dart';
import 'package:flutter_childhood/service/base_service.dart';

import '../../../core/constant/color.dart';

class MealsPage extends StatefulWidget {
  final int id;
  const MealsPage({
    super.key,
    required this.id,
  });

  @override
  State<MealsPage> createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  late List<MoherMealsModel> meals = [];
  late List<bool> isSelectedMeal = [];

  @override
  void initState() {
    super.initState();
    isSelectedMeal = List<bool>.generate(meals.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Meal service",
          style: TextStyle(color: AppColor.fairuz),
        ),
        backgroundColor: AppColor.terqaz,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.fairuz,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => SelecteMealsBloc()..add(GetAllMealsEvent()),
        child: BlocListener<SelecteMealsBloc, SelecteMealsState>(
          listener: (context, state) {
            if (state is MealsIsSelectedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Meal added successfully")),
              );
            }
          },
          child: Scrollbar(
            thumbVisibility: true,
            radius: Radius.circular(100),
            child: ListView(
              children: [
                Column(
                  children: [
                     SizedBox(
                      // height: 20,
                      height: screenheight/40,
                    ),
                    const Center(
                      child: Text(
                        'Choose your child\'s favorite meal',
                        style: TextStyle(fontSize: 20, color: AppColor.terqaz),
                      ),
                    ),
                     SizedBox(
                      // height: 30,
                      height: screenheight/30,
                    ),
                    BlocBuilder<SelecteMealsBloc, SelecteMealsState>(
                      builder: (context, state) {
                        if (state is GetAllMealsSuccesState) {
                          meals = state.moherMealsModel;

                          return SizedBox(
                            //  height: 600,
                            height: screenheight/1.3,
                            child: ListView.separated(
                              itemCount: meals.length,
                              separatorBuilder: (context, index) => const Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  alignment: Alignment.center,
                                  // height: 100,
                                  height: screenheight/15,
                                  child: ListTile(
                                    leading: SizedBox(
                                      // width: 100,
                                      // height: 100,
                                      height: screenwidth/7,
                                      width: screenwidth/7,
                                      child: ClipOval(
                                        child: Image.network(
                                          BaseService.imageurl +
                                              state.moherMealsModel[index].image,
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      state.moherMealsModel[index].name,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    trailing: InkWell(
                                      onTap: () {
                                        context.read<SelecteMealsBloc>().add(
                                              SelectMealEvent(
                                                id: widget.id,
                                                mealName: state
                                                    .moherMealsModel[index].name,
                                              ),
                                            );

                                               ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(
                      "Added successfully"
                      
                    
                    ),
                    duration:  Duration(seconds: 3),
                    ));
                                      },
                                      child: const Icon(
                                        Icons.add_circle_outline,
                                        color: AppColor.terqaz,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else if (state is MealsFailureState) {
                          return Center(
                            child: Text(state.errorMessage),
                          );
                        } else if (state is MealsLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
