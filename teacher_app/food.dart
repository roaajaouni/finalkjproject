// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_childhood/blocs/teacher_blocs/food_bloc/food_teacher_bloc.dart';
// import 'package:flutter_childhood/core/constant/color.dart';
// import 'package:flutter_childhood/core/constant/imageasset.dart';

// class FoodPage extends StatelessWidget {
//   final int id;
//   final String name;
//   const FoodPage({
//     super.key,
//     required this.id,
//     required this.name,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => FoodTeacherBloc ()..add(FetchTeacherMealEvent(childId: id)),
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title:  Text(
//             " $name 's meal",
//             style:const  TextStyle(color: AppColor.fairuz),
//           ),
//           backgroundColor: AppColor.terqaz,
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(
//               Icons.arrow_back,
//               color: AppColor.fairuz,
//             ),
//           ),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 50,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(15),
//                 child: BlocBuilder<FoodTeacherBloc, FoodTeacherState>(
//                   builder: (context, state) {
//                     if (state is TeacherMealIsFetchedState) {
//                       return Container(
//                         alignment: Alignment.center,
//                         height: 190,
//                         width: 190,
//                         decoration: const BoxDecoration(
//                             color: AppColor.fairuz,
//                             //border: Border.all(color: AppColor.terqaz, width: 5),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(20))),
//                         child: Text(
//                           state.teacherFoodModel.meal,
//                           style: const TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.w600,
//                               color: AppColor.purple),
//                         ),
//                       );
//                     } else if (state is TeacherFoodFailureState) {
//                       return Center(
//                         child: Text(state.errorMessage),
//                       );
//                     } else {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                   },
//                 ),
//               ),
//               const SizedBox(
//                 height: 100,
//               ),
//               SizedBox(
//                   height: 200,
//                   width: 200,
//                   child: ClipOval(
//                       child: Image.asset(
//                     AppImageAsset.foodbascket,
//                   )))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/teacher_blocs/food_bloc/food_teacher_bloc.dart';
import 'package:flutter_childhood/core/constant/color.dart';
import 'package:flutter_childhood/core/constant/imageasset.dart';

class FoodPage extends StatelessWidget {
  final int id;
  final String name;
  const FoodPage({
    super.key,
    required this.id,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodTeacherBloc()..add(FetchTeacherMealEvent(childId: id)),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "$name's Meal",
            style: const TextStyle(color: AppColor.fairuz, fontSize: 24, fontWeight: FontWeight.bold),
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(15),
                child: BlocBuilder<FoodTeacherBloc, FoodTeacherState>(
                  builder: (context, state) {
                    if (state is TeacherMealIsFetchedState) {
                      return Container(
                        alignment: Alignment.center,
                        height: 190,
                        width: 190,
                        decoration: BoxDecoration(
                          color: AppColor.fairuz.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.terqaz.withOpacity(0.5),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Text(
                         ' Selected meal :  ${ state.teacherFoodModel.meal}',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    } else if (state is TeacherFoodFailureState) {
                      return Column(
                        children: [
                          Text(
                            state.errorMessage,
                            style: const TextStyle(color: Colors.red, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              context.read<FoodTeacherBloc>().add(FetchTeacherMealEvent(childId: id));
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
              const SizedBox(height: 100),
              SizedBox(
                height: 200,
                width: 200,
                child: ClipOval(
                  child: Image.asset(
                    AppImageAsset.foodbascket,
                    
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
