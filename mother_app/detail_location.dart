// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_childhood/blocs/mother_blocs/location_bloc/child_location_bloc.dart';
// import 'package:flutter_childhood/core/constant/color.dart';

// class DetailLocationPage extends StatelessWidget {
//   final int id;
//   final String name;
//   const DetailLocationPage({super.key, required this.id, required this.name});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider(
//         create: (context) => ChildLocationBloc()..add(FetchChildLocationEvent(childId: id)),
//         child: Container(
//           margin: const EdgeInsets.all(20),
//           padding: const EdgeInsets.all(8),
//           child: BlocBuilder<ChildLocationBloc, ChildLocationState>(
//             builder: (context, state) {
//               if (state is ChildLocationIsFetchedState) {
//                 return Column(
//                   children: [
//                     const SizedBox(
//                       height: 100,
//                     ),
//                     const Icon(
//                       Icons.location_on_outlined,
//                       color: AppColor.terqaz,
//                       size: 90,
//                     ),
//                     const SizedBox(
//                       height: 50,
//                     ),
//                     Text("$name's state",style:const TextStyle(fontSize: 30,color: AppColor.terqaz),),
//                      const SizedBox(
//                       height: 75,
//                     ),
//                     Center(
//                       child: Container(
//                           decoration: BoxDecoration(
//                               color: AppColor.fairuz,
//                               borderRadius: BorderRadius.circular(20)),
//                           padding: const EdgeInsets.only(
//                               top: 20, left: 15, right: 15),
//                           height: 200,
//                           width: 300,
//                           child: state.motherLocationModel.Important_notes.isEmpty
//      ? Text(
//           "${state.motherLocationModel.location} \n",
//           textAlign: TextAlign.center,style: const TextStyle(fontSize: 20),
//         )
//       : Text(
//           "${state.motherLocationModel.Important_notes} \n",
//           textAlign: TextAlign.center,style: const TextStyle(fontSize: 20),
//         ),
                          
                          
//                           ),
//                     ),
//                   ],
//                 );
//               } else if (state is ChildLocationFailureState) {
//                 return Center(child: Text(state.errorMessage));
//               } else {
//                 return const Center(child: CircularProgressIndicator());
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/mother_blocs/location_bloc/child_location_bloc.dart';
import 'package:flutter_childhood/core/constant/color.dart';

class DetailLocationPage extends StatelessWidget {
  final int id;
  final String name;
  const DetailLocationPage({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
        title: Text("$name's state ",style: const TextStyle(color: AppColor.fairuz),),
        
      ),
      body: BlocProvider(
        create: (context) => ChildLocationBloc()..add(FetchChildLocationEvent(childId: id)),
        child: BlocBuilder<ChildLocationBloc, ChildLocationState>(
          builder: (context, state) {
            if (state is ChildLocationIsFetchedState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SizedBox(
                    // height: 50
                    height: screenheight/10,
                    ),
                  const Center(
                    child: Icon(
                      Icons.location_on_outlined,
                      color: AppColor.terqaz,
                      size: 90,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      "$name's State",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColor.terqaz,
                      ),
                    ),
                  ),
                   SizedBox(
                    // height: 80
                    height: screenheight/10,
                    ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.fairuz.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Text(
                            "State :",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                           SizedBox(
                            // height: 10
                            height: screenheight/25,
                            ),
                          Text(
                            state.motherLocationModel.Important_notes.isEmpty
                                ? state.motherLocationModel.location
                                : state.motherLocationModel.Important_notes,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                 SizedBox(
                  // height: 20
                  height: screenheight/25,
                  ),
                ],
              );
            } else if (state is ChildLocationFailureState) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

