// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_childhood/blocs/teacher_blocs/home_bloc/teacher_home_bloc.dart';
// import 'package:flutter_childhood/core/constant/imageasset.dart';
// import 'package:flutter_childhood/model/teacher_app_model/teacher_home_model.dart';
// import 'package:flutter_childhood/service/teacher_service/notification_teacher_service.dart';

// import '../../../core/constant/color.dart';

// import 'teacher_child_profile.dart';

// class TeacherHome extends StatefulWidget {
//   const TeacherHome({super.key});

//   @override
//   State<TeacherHome> createState() => _TeacherHomeState();
// }

// class _TeacherHomeState extends State<TeacherHome> {
//    final NotificationTeacherService _notificationTeacherService = NotificationTeacherService();

//  late List <TeacherHomeModel> allChild ;
// late List <TeacherHomeModel>  serchedForChild;
//   final searchTextController=TextEditingController();
//   void  addSearchedForItemsToSearchedList(String searchedChild){
//     serchedForChild=allChild.where((child) => child.name.toLowerCase().startsWith(searchedChild)).toList();
//   setState(() {
//     context.read<TeacherHomeBloc>().add(GetAllTeacherKidsEvent());
//   });
//   }
// @override
//   void initState() {
     
// _notificationTeacherService.fetchTeacherNotifications().catchError((error) {
      
//       print('Error fetching notifications: $error');
//     });
     
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,

//         body: 
//         SingleChildScrollView(
//           child: Column(children: [
//             Container(
//               margin: const EdgeInsets.only(top: 10),
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Row(children: [
//                 Expanded(
//                     child: TextFormField(
//                       controller: searchTextController,
//                   decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.search),
//                       hintText: "Find Child",
//                       hintStyle: const TextStyle(fontSize: 18),
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide.none,
//                           borderRadius: BorderRadius.circular(10)),
//                       filled: true,
//                       fillColor: Colors.grey[200]),
//                       onChanged: (searchedChild){
//                         addSearchedForItemsToSearchedList(searchedChild);
//                       },
//                 )),
//                 const SizedBox(width: 10),
//                 // Container(
//                 //   decoration: BoxDecoration(
//                 //     //color: Colors.grey[200],
//                 //     borderRadius: BorderRadius.circular(10),
//                 //   ),
//                 //   width: 60,
//                 //   padding: const EdgeInsets.symmetric(vertical: 8),
//                 //   child: IconButton(
//                 //       onPressed: () {
//                 //         Navigator.push(context, MaterialPageRoute(builder: (context)=> const FoodPage()));
//                 //       },
//                 //       icon: const Icon(
//                 //         Icons.food_bank_outlined,
//                 //         size: 40,
//                 //         color: AppColor.terqaz,
//                 //       )),
//                 // )
//               ]),
//             ),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//               child: Stack(children: [
//                 Container(
//                   alignment: Alignment.center,
//                   height: 150,
//                   decoration: BoxDecoration(
//                       color: AppColor.terqaz,
//                       borderRadius: BorderRadius.circular(20)),
//                   child: const ListTile(
//                     title: Text("Managing children's profiles",
//                         style: TextStyle(color: Colors.white, fontSize: 15)),
//                     subtitle: Text("Writing daily reports",
//                         style: TextStyle(color: Colors.white, fontSize: 25)),
//                   ),
//                 ),
//                 Positioned(
//                   top: -20,
//                   right: -20,
//                   child: Container(
//                     height: 160,
//                     width: 160,
//                     decoration: BoxDecoration(
//                         color: AppColor.fairuz,
//                         borderRadius: BorderRadius.circular(160)),
//                   ),
//                 )
//               ]),
//             ),
//             BlocBuilder<TeacherHomeBloc, TeacherHomeState>(
//               builder: (context, state) {
//                 if (state is GetAllTeacherKidsSuccessState){
//                   allChild=(state).teacherHomeKids;
//            return Expanded(
//              child: ListView.builder(
//                  // ! put item count
//                  itemCount: searchTextController.text.isEmpty? allChild.length:serchedForChild.length,
//                  itemBuilder: (context, index) {
//            return Container(
//              decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(30),
//                  border: Border.all(
//                      color: index % 2 == 0
//                          ? AppColor.fairuz
//                          : AppColor.terqaz,
//                      width: 6)),
//              alignment: Alignment.center,
//              height: 100,
//              margin: const EdgeInsets.only(
//                top: 15,
//              ),
//              child: ListTile(
//                onTap: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) =>
//                          // TeacherChildProfile(teacherHomeModel:state.teacherHomeKids[index]),
//                TeacherChildProfile(teacherHomeModel:searchTextController.text.isEmpty? allChild[index]:serchedForChild[index]),
//                    ),
//                  );
//                },
//                leading: SizedBox(
//                    height: 100,
//                    width: 70,
//                    child: ClipOval(
//                        child: state.teacherHomeKids[index].child_gender=='female'?   Image.asset(
//                      // ! put image path
//                      AppImageAsset.girl,
//                      width: 70,
//                      height: 100,
//                      fit: BoxFit.cover,
//                    ):
//                        Image.asset(
//                      // ! put image path
//                      AppImageAsset.boy,
//                      width: 70,
//                      height: 100,
//                      fit: BoxFit.cover,
//                    )
//                    )
//                    ),
//                title:Text(searchTextController.text.isEmpty? allChild[index].name:serchedForChild[index].name),
//                // Text(state.teacherHomeKids[index].name),
//                trailing: const Icon(Icons.arrow_forward_ios_rounded),
//              ),
//            );
//                  },
//                ),
//            );
           
//                 }
//                 else if(state is GetAllTeacherKidsFailureState){
//                   return Center( child: Text(state.errorMessage),);
//                 }
//                 else{
//                   return const Center( child: CircularProgressIndicator(),);
//                 }
               
//               },
//             )
//           ]),
//         ));
//   }
// }

/////////////////////////////////////////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_childhood/blocs/teacher_blocs/home_bloc/teacher_home_bloc.dart';
// import 'package:flutter_childhood/core/constant/imageasset.dart';
// import 'package:flutter_childhood/model/teacher_app_model/teacher_home_model.dart';
// import 'package:flutter_childhood/service/teacher_service/notification_teacher_service.dart';

// import '../../../core/constant/color.dart';
// import 'teacher_child_profile.dart';

// class TeacherHome extends StatefulWidget {
//   const TeacherHome({super.key});

//   @override
//   State<TeacherHome> createState() => _TeacherHomeState();
// }

// class _TeacherHomeState extends State<TeacherHome> {
//   final NotificationTeacherService _notificationTeacherService = NotificationTeacherService();
//   late List<TeacherHomeModel> allChild;
//   late List<TeacherHomeModel> serchedForChild;
//   final searchTextController = TextEditingController();

//   void addSearchedForItemsToSearchedList(String searchedChild) {
//     serchedForChild = allChild
//         .where((child) => child.name.toLowerCase().startsWith(searchedChild))
//         .toList();
//     // setState(() {
//     //   context.read<TeacherHomeBloc>().add(GetAllTeacherKidsEvent());
//     // });
//   }

//   @override
//   void initState() {
//     // context.read<TeacherHomeBloc>().add(GetAllTeacherKidsEvent());
//     context.read<TeacherHomeBloc>().add(RefreshTeacherKidsEvent());
//     _notificationTeacherService.fetchTeacherNotifications().catchError((error) {
//       print('Error fetching notifications: $error');
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Container(
            
//             margin: const EdgeInsets.only(top: 10),
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     controller: searchTextController,
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.search),
//                       hintText: "Find Child",
//                       hintStyle: const TextStyle(fontSize: 18),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       filled: true,
//                       fillColor: Colors.grey[200],
//                     ),
//                     onChanged: (searchedChild) {
//                       addSearchedForItemsToSearchedList(searchedChild);
//                     },
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//               ],
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//             child: Stack(
//               children: [
//                 Container(
//                   alignment: Alignment.center,
//                   height: 150,
//                   decoration: BoxDecoration(
//                     color: AppColor.terqaz,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: const ListTile(
//                     title: Text(
//                       "Managing children's profiles",
//                       style: TextStyle(color: Colors.white, fontSize: 15),
//                     ),
//                     subtitle: Text(
//                       "Writing daily reports",
//                       style: TextStyle(color: Colors.white, fontSize: 25),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: -20,
//                   right: -20,
//                   child: Container(
//                     height: 160,
//                     width: 160,
//                     decoration: BoxDecoration(
//                       color: AppColor.fairuz,
//                       borderRadius: BorderRadius.circular(160),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           BlocBuilder<TeacherHomeBloc, TeacherHomeState>(
//               builder: (context, state) {
//                 if (state is GetAllTeacherKidsSuccessState) {
//                   allChild = state.teacherHomeKids;
//                   return Expanded(
//                     child: ListView.builder(
                       
//                       itemCount: searchTextController.text.isEmpty
//                           ? allChild.length
//                           : serchedForChild.length,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(30),
//                             border: Border.all(
//                               color: index % 2 == 0
//                                   ? AppColor.fairuz
//                                   : AppColor.terqaz,
//                               width: 6,
//                             ),
//                           ),
//                           alignment: Alignment.center,
//                           height: 100,
//                           margin: const EdgeInsets.only(top: 15),
//                           child: ListTile(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => TeacherChildProfile(
//                                     teacherHomeModel: searchTextController.text.isEmpty
//                                         ? allChild[index]
//                                         : serchedForChild[index],
//                                   ),
//                                 ),
//                               );
//                             },
//                             leading: SizedBox(
//                               height: 100,
//                               width: 70,
//                               child: ClipOval(
//                                 child: state.teacherHomeKids[index].child_gender == 'female'
//                                     ? Image.asset(
//                                         AppImageAsset.girl,
//                                         width: 70,
//                                         height: 100,
//                                         fit: BoxFit.cover,
//                                       )
//                                     : Image.asset(
//                                         AppImageAsset.boy,
//                                         width: 70,
//                                         height: 100,
//                                         fit: BoxFit.cover,
//                                       ),
//                               ),
//                             ),
//                             title: Text(searchTextController.text.isEmpty
//                                 ? allChild[index].name
//                                 : serchedForChild[index].name),
//                             trailing: const Icon(Icons.arrow_forward_ios_rounded),
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 } else if (state is GetAllTeacherKidsFailureState) {
//                   return Center(
//                     child: Text(state.errorMessage),
//                   );
//                 } else {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               },
//             ),
          
//         ],
//       ),
//     );
//   }
// }
