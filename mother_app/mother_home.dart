import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/mother_blocs/child_UD_bloc/child_ud_prof_bloc.dart';
import 'package:flutter_childhood/blocs/mother_blocs/mother_home_bloc/mother_home_bloc.dart';
import 'package:flutter_childhood/core/constant/imageasset.dart';
import 'package:flutter_childhood/service/base_service.dart';
import 'package:flutter_childhood/view/screen/mother_app/addchild.dart';
import 'package:flutter_childhood/view/screen/mother_app/childprofile.dart';

import '../../../core/constant/color.dart';

class MotherHome extends StatefulWidget {
  const MotherHome({super.key});

  @override
  State<MotherHome> createState() => _MotherHomeState();
}

class _MotherHomeState extends State<MotherHome> {
  // final NotificationService _notificationService = NotificationService();
  @override
  @override
  void initState() {
    context.read<MotherHomeBloc>().add(GetAllMyKidsEvent());

    //  _notificationService.fetchNotifications().catchError((error) {

    //   print('Error fetching notifications: $error');
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth= MediaQuery.of(context).size.width;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          clipBehavior: Clip.none,
          backgroundColor: AppColor.terqaz,
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateClildProfile(),
                ));
            // .then((_) {
            //   // This will rebuild the MotherHome widget when the new child is added
            //   context.read<MotherHomeBloc>().add(GetAllMyKidsEvent());
            // });
            // setState(() {

            // });
          },
          child: const Text(
            'Add \n new child',
            style: TextStyle(
              color: AppColor.fairuz,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.white,
        body: BlocListener<ChildUdProfBloc, ChildUdProfState>(
          listener: (context, state) {
            if ( state is ChildUpdatedIsSuccess) {
                    context.read<MotherHomeBloc>().add(GetAllMyKidsEvent());
          }},
          child: BlocBuilder<MotherHomeBloc, MotherHomeState>(
              builder: (context, state) {
            if (state is MotherHomeNoKidsAddedState) {
              return Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      // height: 50,
                      height: screenheight/15,
                    ),
                   
                    const Center(
                      child: Text(
                        '   Hi !  ',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: AppColor.terqaz),
                      ),
                    ),
                     SizedBox(
                      // height: 50,
                      height: screenheight/18,
                    ),
                    const Center(
                      child: Text(
                        '    No children added yet ',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: AppColor.terqaz),
                      ),
                    ),
                      SizedBox(
                      // height: 50,
                      height: screenheight/5,
                    ),
                     Image.asset(
                      AppImageAsset.magic,
                      // height: 200,
                      height: screenheight/4,
                    ),
                     SizedBox(
                      // height: 200,
                      height: screenheight/20,
                    ),
                    // SizedBox(
                    //   width: 300,
                    //   child: MaterialButton(
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(100)),
                    //     color: AppColor.terqaz,
                    //     textColor: AppColor.fairuz,
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => CreateClildProfile(),
                    //         ),
                    //       );
                    //     },
                    //     child: const Text(
                    //       'Add child',
                    //       style: TextStyle(fontSize: 18),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              );
            } else if (state is MotherHomeGetAllMyKidsSuccessState) {
              return Container(
                color: Colors.white,
                margin: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Container(
                        decoration: const BoxDecoration(
                            color: AppColor.terqaz,
                            borderRadius:
                                BorderRadius.all(Radius.circular(60))),
                        padding: const EdgeInsets.all(22),
                        alignment: Alignment.topLeft,
                        // width: 375,
                        width: screenwidth/0.3,
                        // height: 130,
                        height: screenheight/5,
                        child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Column(children: [
                                Text(
                                  'Follow your child \n and pay attention  ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.fairuz),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'to his daily details',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.fairuz),
                                ),
                              ]),
                               SizedBox(
                                // width: 40,
                                width: screenwidth/15,
                              ),
                              ClipOval(
                                  child: Image.asset(
                                AppImageAsset.kids,
                                fit: BoxFit.cover,
                              )),
                            ])),

                     SizedBox(
                      // height: 10,
                      height: screenheight/200,
                    ),

                    Expanded(
                      child: ListView.builder(
                        itemCount: state.motherHomeKids.length,
                        //controller.listchild.length,

                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.only(
                              top: 15,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(150),
                                side: const BorderSide(color: AppColor.terqaz)),
                            child: ListTile(
                       
                                //  leading: ClipOval(child: Image.network(BaseService.imageurl +state.motherHomeKids[index].featured_image,height: 5,width: 5,)),
                               
                                leading:
                                    state.motherHomeKids[index].child_gender ==
                                            'female'
                                        ? Image.asset(AppImageAsset.girl)
                                        : Image.asset(AppImageAsset.boy),
                                title: Text(state.motherHomeKids[index].name),
                                trailing: InkWell(
                                  onTap: () async {
                                    final result = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ChildProfile(
                                              homeMotherModel:
                                                  state.motherHomeKids[index]),
                                        ));
                                    if (result == true) {
                                      setState(() {
                                        // context
                                        //     .read<MotherHomeBloc>()
                                        //     .add(GetAllMyKidsEvent());
                                      });
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: AppColor.terqaz,
                                    ),
                                    
                                    // height: 30,
                                    // width: 70,
                                    height: screenheight/20,
                                    width: screenwidth/5,
                                    child: const Text(
                                      'Follow',
                                      style: TextStyle(
                                          color: AppColor.fairuz, fontSize: 15),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                                //  Text(
                                //      ' ${state. motherHomeKids[index].age} years old'
                                //     ),
                                ),
                          );
                        },
                      ),
                    ),
                     SizedBox(
                      // height: 50,
                      height: screenheight/30,
                    ),
                    // SizedBox(
                    //   width: 300,
                    //   child: MaterialButton(
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(100)),
                    //     color: AppColor.terqaz,
                    //     textColor: AppColor.fairuz,
                    //     onPressed: () {
                    //      Navigator.push(context, MaterialPageRoute(builder: (context) =>CreateClildProfile (),));
                    //     },
                    //     child: const Text('Add child'),
                    //   ),
                    // )
                  ],
                ),
              );
            }
            //  else if( state is  MotherHomeGetAllMyKidsFailureState){
            //    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            //  }
            else if (state is MotherHomeGetAllMyKidsFailureState) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              // print(state.toString());
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ));
  }
}





// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_childhood/blocs/mother_blocs/child_UD_bloc/child_ud_prof_bloc.dart';
// import 'package:flutter_childhood/blocs/mother_blocs/mother_home_bloc/mother_home_bloc.dart';
// import 'package:flutter_childhood/core/constant/imageasset.dart';
// import 'package:flutter_childhood/model/mother_app_model/home_getkids_model.dart';
// import 'package:flutter_childhood/view/screen/mother_app/addchild.dart';
// import 'package:flutter_childhood/view/screen/mother_app/childprofile.dart';

// import '../../../core/constant/color.dart';

// class MotherHome extends StatefulWidget {
//   const MotherHome({super.key});

//   @override
//   State<MotherHome> createState() => _MotherHomeState();
// }

// class _MotherHomeState extends State<MotherHome> {
//   @override
//   void initState() {
//     context.read<MotherHomeBloc>().add(GetAllMyKidsEvent());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: AppColor.terqaz,
//         onPressed: () {
//           Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => CreateClildProfile(),
//               ));
//         },
//         child: const Text(
//           'Add \n new child',
//           style: TextStyle(color: AppColor.fairuz),
//           textAlign: TextAlign.center,
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: MultiBlocListener(
//         listeners: [
//           BlocListener<ChildUdProfBloc, ChildUdProfState>(
//             listener: (context, state) {
//               if (state is ChildUpdatedIsSuccess) {
//                 context.read<MotherHomeBloc>().add(GetAllMyKidsEvent());
//               }
//             },
//           ),
//         ],
//         child: BlocBuilder<MotherHomeBloc, MotherHomeState>(
//           builder: (context, state) {
//             if (state is MotherHomeNoKidsAddedState) {
//               return _buildNoKidsView();
//             } else if (state is MotherHomeGetAllMyKidsSuccessState) {
//               return _buildKidsListView(context, state);
//             } else if (state is MotherHomeGetAllMyKidsFailureState) {
//               return Center(child: Text(state.errorMessage));
//             } else {
//               return const Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildNoKidsView() {
//     return Container(
//       padding: const EdgeInsets.all(15),
//       margin: const EdgeInsets.all(10),
//       child: Column(
//         children: [
//           Image.asset(AppImageAsset.magic, height: 200),
//           const SizedBox(height: 50),
//           const Center(
//             child: Text(
//               '   Hi !  ',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.w500,
//                 color: AppColor.terqaz,
//               ),
//             ),
//           ),
//           const SizedBox(height: 50),
//           const Center(
//             child: Text(
//               '    No children added yet ',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.w500,
//                 color: AppColor.terqaz,
//               ),
//             ),
//           ),
//           const SizedBox(height: 200),
//         ],
//       ),
//     );
//   }

//   Widget _buildKidsListView(BuildContext context, MotherHomeGetAllMyKidsSuccessState state) {
//     return Container(
//       margin: const EdgeInsets.only(top: 50),
//       child: Column(
//         children: [
//           _buildHeader(),
//           const SizedBox(height: 10),
//           Expanded(
//             child: ListView.builder(
//               itemCount: state.motherHomeKids.length,
//               itemBuilder: (context, index) {
//                 return _buildKidCard(context, state.motherHomeKids[index]);
//               },
//             ),
//           ),
//           const SizedBox(height: 50),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Container(
//       decoration: const BoxDecoration(
//         color: AppColor.terqaz,
//         borderRadius: BorderRadius.all(Radius.circular(60)),
//       ),
//       padding: const EdgeInsets.all(22),
//       alignment: Alignment.topLeft,
//       width: 375,
//       height: 130,
//       child: Row(
//         children: [
//           const Column(
//             children: [
//               Text(
//                 'Follow your child \n and pay attention  ',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.fairuz,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 'to his daily details',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                   color: AppColor.fairuz,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(width: 40),
//           ClipOval(
//             child: Image.asset(AppImageAsset.kids, fit: BoxFit.cover),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildKidCard(BuildContext context, HomeMotherModel kid) {
//     return Card(
//       margin: const EdgeInsets.only(top: 15),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(150),
//         side: const BorderSide(color: AppColor.terqaz),
//       ),
//       child: ListTile(
//         leading: kid.child_gender == 'female'
//             ? Image.asset(AppImageAsset.girl)
//             : Image.asset(AppImageAsset.boy),
//         title: Text(kid.name),
//         trailing: InkWell(
//           onTap: () async {
//             final result = await Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ChildProfile(homeMotherModel: kid),
//               ),
//             );
//             if (result == true) {
//               setState(() {
//                  context.read<MotherHomeBloc>().add(GetAllMyKidsEvent());
//               });
//             }
//           },
//           child: Container(
//             padding: const EdgeInsets.only(top: 4),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(100),
//               color: AppColor.terqaz,
//             ),
//             height: 30,
//             width: 70,
//             child: const Text(
//               'Follow',
//               style: TextStyle(color: AppColor.fairuz, fontSize: 15),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

