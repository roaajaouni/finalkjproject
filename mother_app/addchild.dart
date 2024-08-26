// import 'dart:developer';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_childhood/blocs/mother_blocs/child_info_bloc/child_bloc.dart';

// import 'package:flutter_childhood/model/mother_app_model/child_info_model.dart';

// import 'package:flutter_childhood/view/widget/customchildselec.dart';
// import 'package:flutter_childhood/view/widget/main_bottom_navigation_bar_page.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../../core/constant/color.dart';
// import '../../../core/constant/imageasset.dart';

// import '../../widget/customcarttextfield.dart';
// //  import 'package:image_picker/image_picker.dart';

// class CreateClildProfile extends StatefulWidget {
//   CreateClildProfile({super.key});

//   @override
//   State<CreateClildProfile> createState() => _CreateClildProfileState();
// }

// class _CreateClildProfileState extends State<CreateClildProfile> {
//   File? image;

//   upoloadImage() async {
//     var pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedImage != null) {
//         image = File(pickedImage.path);
//         log(image!.path.toString());
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

// //  final _formKey = GlobalKey<FormState>();

//   TextEditingController name = TextEditingController();

//   TextEditingController age = TextEditingController();

//   TextEditingController gender = TextEditingController();

//   TextEditingController state_health = TextEditingController();
//   String? gendervalue = 'select gender';
//   String? agevalue = 'select age';
//   //final int selectedindex = 0;
//   Widget build(BuildContext context) {
//     double screenheight = MediaQuery.of(context).size.height;
//     double screenwidth = MediaQuery.of(context).size.width;
//     return BlocProvider(
//       create: (context) => ChildBloc(),
//       child: Scaffold(
//         // appBar: AppBar(
//         //   backgroundColor: AppColor.terqaz,
//         //   title: const Text(
//         //     "Craete child's profile",
//         //     style: TextStyle(color: AppColor.fairuz),
//         //   ),
//         // ),
//         appBar: AppBar(
//             centerTitle: true,
//             title: const Text(
//               "Craete child's profile",
//               style: TextStyle(color: AppColor.fairuz),
//             ),
//             backgroundColor: AppColor.terqaz,
//             leading: IconButton(
//               onPressed: () {
//                 Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) =>
//                             const MainBottomNavigationBarPage()));
//               },
//               icon: const Icon(
//                 Icons.arrow_back,
//                 color: AppColor.fairuz,
//               ),
//             )),
//         body: SafeArea(
//           child: Container(
//             // color: AppColor.backgroundColor,
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//               child: ListView(
//                 children: [
//                   SizedBox(
//                     // height: 30
//                     height: screenheight / 80,
//                   ),
//                   Container(
//                     decoration:
//                         BoxDecoration(borderRadius: BorderRadius.circular(100)),
//                     // height: 100,
//                     height: screenheight / 7,
//                     // width: 50,
//                     width: screenwidth / 25,
//                     child: InkWell(
//                       onTap: () {
//                         upoloadImage();
//                       },
//                       child: ClipOval(
//                           child: Image(image: 
//                         image == null
//                             ?AssetImage (AppImageAsset.selectimage,)
//                             : FileImage( File(image!.path)),
//                       )

//                            Image.asset(
//                             AppImageAsset.selectimage,
//                           ),
//                           ),
//                     ),
//                   ),

//                   const Center(
//                       child: Text(
//                     'Select image',
//                     style: TextStyle(
//                         color: AppColor.terqaz,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold),
//                   )),

//                   SizedBox(
//                     // height: 20
//                     height: screenheight / 25,
//                   ),

//                   //fullname

//                   CustomCartTextField(
//                       hintText: 'Full Name',
//                       iconData: Icons.person,
//                       mycontroller: name,
//                       valid: (val) {
//                         if (val!.isEmpty) {
//                           return "Please this field is required";
//                         }
//                         return null;
//                       }),

//                   //birthday

//                   CustomSelectTextField(
//                     hintText: 'Select  age',
//                     iconData: Icons.person,
//                     genderOptions: ['select age', '5', '6'],
//                     selectedGender: agevalue,
//                     onChanged: (age) {
//                       setState(() {
//                         agevalue = age;
//                       });
//                       // print('Selected gender: $age');
//                     },
//                   ),

//                   // CustomCartTextField(
//                   //     hintText: 'Age',
//                   //     iconData: Icons.cake,
//                   //     mycontroller: age,
//                   //     valid: (val) {
//                   //       if (val!.isEmpty) {
//                   //         return "Please this field is required";
//                   //       }
//                   //     }),

//                   CustomSelectTextField(
//                     hintText: 'Select  gender',
//                     iconData: Icons.person,
//                     genderOptions: ['select gender', 'female', 'male'],
//                     selectedGender: gendervalue,
//                     onChanged: (gender) {
//                       setState(() {
//                         gendervalue = gender;
//                       });
//                       // print('Selected gender: $gender');
//                     },
//                   ),
//                   ////////////////////////

//                   // CustomCartTextField(
//                   //     hintText: 'Gender',
//                   //     iconData: Icons.girl,
//                   //     mycontroller: gender,
//                   //     valid: (val) {
//                   //       if (val!.isEmpty) {
//                   //         return "Please this field is required";
//                   //       }
//                   //     }),

//                   // //healthy

//                   CustomCartTextField(
//                       hintText: 'Health Status ',
//                       iconData: Icons.health_and_safety_outlined,
//                       mycontroller: state_health,
//                       valid: (val) {
//                         if (val!.isEmpty) {
//                           return "Please this field is required";
//                         }
//                       }),
//                   SizedBox(
//                     // height: 60
//                     height: screenheight / 25,
//                   ),

//                   SizedBox(
//                     // width: 100,
//                     width: screenwidth / 25,
//                     child: BlocConsumer<ChildBloc, ChildState>(
//                       listener: (context, state) {
//                         if (state is ChildAddedState) {
//                           Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       const MainBottomNavigationBarPage()));
//                         }

// // else if (state is ChildFailuerState) {
// //                             ScaffoldMessenger.of(context).showSnackBar(
// //                               SnackBar(
// //                                 content: Text(state.errorMessage),
// //                               ),
// //                             );
// //                           }
//                       },
//                       builder: (context, state) {
//                         if (state is ChildAddedState) {
//                           return MaterialButton(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(100)),
//                             color: AppColor.terqaz,
//                             textColor: AppColor.fairuz,
//                             onPressed: () {
//                               context.read<ChildBloc>().add(
//                                     AddNewChild(
//                                       childInfoModel: ChildInfoModel(
//                                         name: name.text,
//                                         age: agevalue.toString(),
//                                         child_gender: gendervalue.toString(),
//                                         state_health: state_health.text,
//                                       ),
//                                     ),
//                                   );
//                             },
//                             child: const Text('Submit'),
//                           );
//                         } else if (state is ChildLoadingState) {
//                           return const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         }
//                         /////////////////////////////////
//                         // else {
//                         //       return MaterialButton(
//                         //         shape: RoundedRectangleBorder(
//                         //             borderRadius: BorderRadius.circular(100)),
//                         //         color: AppColor.terqaz,
//                         //         textColor: AppColor.fairuz,
//                         //         onPressed: () {
//                         //           if (_formKey.currentState!.validate()) {
//                         //             if (agevalue == 'select age' ||
//                         //                 gendervalue == 'select gender') {
//                         //               ScaffoldMessenger.of(context).showSnackBar(
//                         //                 const SnackBar(
//                         //                   content: Text(
//                         //                       'Please select a valid age and gender'),
//                         //                 ),
//                         //               );
//                         //             } else {
//                         //               context.read<ChildBloc>().add(
//                         //                     AddNewChild(
//                         //                       childInfoModel: ChildInfoModel(
//                         //                         name: name.text,
//                         //                         age: agevalue.toString(),
//                         //                         child_gender:
//                         //                             gendervalue.toString(),
//                         //                         state_health: state_health.text,
//                         //                       ),
//                         //                     ),
//                         //                   );
//                         //             }
//                         //           }
//                         //         },
//                         //         child: const Text('Submit'),
//                         //       );
//                         //     }
//                         ////////////////////////////////////

//                         else {
//                           return MaterialButton(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(100)),
//                             color: AppColor.terqaz,
//                             textColor: AppColor.fairuz,
//                             onPressed: () {
//                               context.read<ChildBloc>().add(
//                                     AddNewChild(
//                                       childInfoModel: ChildInfoModel(
//                                         name: name.text,
//                                         age: agevalue.toString(),
//                                         child_gender: gendervalue.toString(),
//                                         state_health: state_health.text,
//                                       ),
//                                     ),
//                                   );
//                             },
//                             child: const Text('Submit'),
//                           );
//                         }
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/mother_blocs/child_info_bloc/child_bloc.dart';
import 'package:flutter_childhood/model/mother_app_model/child_info_model.dart';
import 'package:flutter_childhood/view/widget/customchildselec.dart';
import 'package:flutter_childhood/view/widget/main_bottom_navigation_bar_page.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../widget/customcarttextfield.dart';

class CreateClildProfile extends StatefulWidget {
  CreateClildProfile({super.key});

  @override
  State<CreateClildProfile> createState() => _CreateClildProfileState();
}

class _CreateClildProfileState extends State<CreateClildProfile> {
  final formKey = GlobalKey<FormState>();
  File? image;

  Future<void> upoloadImage() async {
    var pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        image = File(pickedImage.path);
        log(image!.path.toString());
      } else {
        print('No image selected.');
      }
    });
  }

  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController state_health = TextEditingController();
  String? gendervalue = 'select gender';
  String? agevalue = 'select age';

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => ChildBloc(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Craete child's profile",
            style: TextStyle(color: AppColor.fairuz),
          ),
          backgroundColor: AppColor.terqaz,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainBottomNavigationBarPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.fairuz,
            ),
          ),
        ),
        body: SafeArea(
          child: Form(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: ListView(
                  children: [
                    SizedBox(height: screenheight / 80),
                    Center(
                      child: Stack(
                        children: [
                          ClipOval(
                            child: image == null
                                ? Image.asset(
                                    AppImageAsset.selectimage,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    image!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: upoloadImage,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Select image',
                        style: TextStyle(
                          color: AppColor.terqaz,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: screenheight / 25),
                    CustomCartTextField(
                      hintText: 'Full Name',
                      iconData: Icons.person,
                      mycontroller: name,
                      valid: (val) {
                        if (val!.isEmpty) {
                          return "Please this field is required";
                        }
                        return null;
                      },
                    ),
                    CustomSelectTextField(
                      hintText: 'Select age',
                      iconData: Icons.person,
                      genderOptions: ['select age', '5', '6'],
                      selectedGender: agevalue,
                      onChanged: (age) {
                        setState(() {
                          agevalue = age;
                        });
                      },
                    ),
                    CustomSelectTextField(
                      hintText: 'Select gender',
                      iconData: Icons.person,
                      genderOptions: ['select gender', 'female', 'male'],
                      selectedGender: gendervalue,
                      onChanged: (gender) {
                        setState(() {
                          gendervalue = gender;
                        });
                      },
                    ),
                    CustomCartTextField(
                      hintText: 'Health Status',
                      iconData: Icons.health_and_safety_outlined,
                      mycontroller: state_health,
                      valid: (val) {
                        if (val!.isEmpty) {
                          return "Please this field is required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenheight / 25),
                    SizedBox(
                      width: screenwidth / 25,
                      child: BlocConsumer<ChildBloc, ChildState>(
                        listener: (context, state) {
                          if (state is ChildAddedState) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MainBottomNavigationBarPage(),
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is ChildLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              color: AppColor.terqaz,
                              textColor: AppColor.fairuz,
                              onPressed: () {
                                
                                context.read<ChildBloc>().add(
                                      AddNewChild(
                                        childInfoModel: ChildInfoModel(
                                          name: name.text,
                                          age: agevalue.toString(),
                                          child_gender: gendervalue.toString(),
                                          state_health: state_health.text,
                                         
                                        ),
                                      ),
                                    );
                            
                              },
                              child: const Text('Submit'),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
