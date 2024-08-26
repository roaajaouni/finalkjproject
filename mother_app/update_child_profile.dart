// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_childhood/blocs/mother_blocs/child_UD_bloc/child_ud_prof_bloc.dart';
// import 'package:flutter_childhood/core/constant/color.dart';
// import 'package:flutter_childhood/core/constant/imageasset.dart';
// import 'package:flutter_childhood/model/mother_app_model/child_info_model.dart';
// import 'package:flutter_childhood/view/widget/customcarttextfield.dart';

// class UpdateChildProfilePage extends StatefulWidget {
//    final int id;
//   // final String childname;
//   // final String childage;
//   // final String gender;
//   // final String health;



//   UpdateChildProfilePage({super.key, required this.id, });

//   @override
//   State<UpdateChildProfilePage> createState() => _UpdateChildProfilePageState();
// }

// class _UpdateChildProfilePageState extends State<UpdateChildProfilePage> {
//   TextEditingController name = TextEditingController();

//   TextEditingController age = TextEditingController();

//   TextEditingController child_gender = TextEditingController();

//   TextEditingController state_health = TextEditingController();

//   final formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//      context.read<ChildUdProfBloc>().add(GetChildPreviousInfoEvent(childId:widget.id ));
//     super.initState();
//   }

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        appBar: AppBar(
//         centerTitle: true,
//          title: const Text(
//           "Edit child's profile",
//           style: TextStyle(color: AppColor.fairuz),
//         ),
//               backgroundColor: AppColor.terqaz,
//               leading: IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: const Icon(
//                   Icons.arrow_back,
//                   color: AppColor.fairuz,
//                 ),
//               )),
//       body: BlocProvider(
//         create: (context) => ChildUdProfBloc()..add(GetChildPreviousInfoEvent(childId:widget.id )),
//         child: BlocBuilder<ChildUdProfBloc, ChildUdProfState>(
//           builder: (context, state) {
//             if (state is GetChildPreviousInfoState) {
//               return SingleChildScrollView(
//                 child: Form(
//                   key: formKey,
//                   child: Column(children: [
//                     const SizedBox(height: 30),
//                      Container(
//                   decoration:
//                       BoxDecoration(borderRadius: BorderRadius.circular(100)),
//                   height: 200,
//                   width: 100,
//                   child: ClipOval(
//                     child: 
//                     Image.asset(
//                       AppImageAsset.girl,
//                     ),
//                   ),
//                 ),
//                     const SizedBox(height: 10),
//                     //!put the previous name
//                     CustomCartTextField(
//                         hintText:state.childInfo.name,
//                         iconData: Icons.person_3_outlined,
//                         mycontroller: name,
//                         valid: (val) {
//                           if (val!.isEmpty) {
//                             return "Please this field is required";
//                           }
//                           return null;
//                         }),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     CustomCartTextField(
//                         //!put the previous age
//                         hintText: state.childInfo.age,
//                         iconData: Icons.cake,
//                         mycontroller: age,
//                         valid: (val) {
//                           if (val!.isEmpty) {
//                             return "Please this field is required";
//                           }
//                           return null;
//                         }),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     CustomCartTextField(
//                         //!put the previous gender
//                         hintText:state.childInfo.child_gender,
//                         iconData: Icons.girl,
//                         mycontroller: child_gender,
//                         valid: (val) {
//                           if (val!.isEmpty) {
//                             return "Please this field is required";
//                           }
//                           return null;
//                         }),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     CustomCartTextField(
//                         //!put the previous health
//                         hintText: state.childInfo.state_health,
//                         iconData: Icons.health_and_safety_outlined,
//                         mycontroller: state_health,
//                         valid: (val) {
//                           if (val!.isEmpty) {
//                             return "Please this field is required";
//                           }
//                           return null;
//                         }),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     MaterialButton(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(100)),
//                       color: AppColor.terqaz,
//                       textColor: AppColor.fairuz,
//                       onPressed: () {
//                         if (formKey.currentState!.validate()) {
//                           context.read<ChildUdProfBloc>().add(
//                                 UpdateChildEvent(
//                                     childId: widget.id,
//                                     childInfoModel: ChildInfoModel(
//                                         name: name.text,
//                                         age: age.text,
//                                         child_gender: child_gender.text,
//                                         state_health: state_health.text)),
//                               );
//                                            ScaffoldMessenger.of(context)
//                     .showSnackBar(const SnackBar(content: Text("the information has been successfully modified")));
                    
//                     Navigator.pop(context,true);
//                         }
//                       },
//                       child: const Text('Edit'),
//                     )
//                   ]),
//                 ),
//               );
//             } else if (state is ChildUpdatedFailureState) {
//               return Center(child: Text(state.errorMessage));
//             } else {
//               return const Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//       ),
//     );
//   }
// }



///////////////////////////////////////////////////////////////////////////////////////////////



// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_childhood/blocs/mother_blocs/child_UD_bloc/child_ud_prof_bloc.dart';
// import 'package:flutter_childhood/blocs/mother_blocs/mother_home_bloc/mother_home_bloc.dart';
// import 'package:flutter_childhood/core/constant/color.dart';
// import 'package:flutter_childhood/core/constant/imageasset.dart';
// import 'package:flutter_childhood/model/mother_app_model/child_info_model.dart';
// import 'package:flutter_childhood/view/widget/customcarttextfield.dart';

// class UpdateChildProfilePage extends StatefulWidget {
//   final int id;

//   UpdateChildProfilePage({super.key, required this.id});

//   @override
//   State<UpdateChildProfilePage> createState() => _UpdateChildProfilePageState();
// }

// class _UpdateChildProfilePageState extends State<UpdateChildProfilePage> {
//   TextEditingController name = TextEditingController();
//   TextEditingController age = TextEditingController();
//   TextEditingController child_gender = TextEditingController();
//   TextEditingController state_health = TextEditingController();
//   final formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     context.read<ChildUdProfBloc>().add(GetChildPreviousInfoEvent(childId: widget.id));
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenheight = MediaQuery.of(context).size.height;
//     // double screenwidth= MediaQuery.of(context).size.width;
//     return WillPopScope(
//       onWillPop: () async{
//  context.read<MotherHomeBloc>().add(GetAllMyKidsEvent());

//         return true;

//       },
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text(
//             "Edit Child's Profile",
//             style: TextStyle(color: AppColor.fairuz),
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
//         body: BlocProvider(
//           create: (context) => ChildUdProfBloc()..add(GetChildPreviousInfoEvent(childId: widget.id)),
//           child: BlocBuilder<ChildUdProfBloc, ChildUdProfState>(
//             builder: (context, state) {
//               if (state is GetChildPreviousInfoState) {
//                 return SingleChildScrollView(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Form(
//                     key: formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                          SizedBox(
//                           // height: 20
//                           height: screenheight/150,
//                           ),
//                         const CircleAvatar(
//                           radius: 60,
//                           backgroundImage: AssetImage(AppImageAsset.girl),
//                         ),
//                         const SizedBox(height: 20),
//                         Text(
//                           "Edit Details for ${state.childInfo.name}",
//                           style: const TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: AppColor.terqaz,
//                           ),
//                         ),
//                          SizedBox(
//                           // height: 20
//                           height: screenheight * 0.02,
//                           ),
//                         CustomCartTextField(
//                           hintText: state.childInfo.name,
//                           iconData: Icons.person_3_outlined,
//                           mycontroller: name,
//                           valid: (val) {
//                             if (val!.isEmpty) {
//                               return "Please fill in this field";
//                             }
//                             return null;
//                           },
//                         ),
//                          SizedBox(
//                           // height: 15
//                           height: screenheight/80,
//                           ),
//                         CustomCartTextField(
//                           hintText: state.childInfo.age,
//                           iconData: Icons.cake,
//                           mycontroller: age,
//                           valid: (val) {
//                             if (val!.isEmpty) {
//                               return "Please fill in this field";
//                             }
//                             return null;
//                           },
//                         ),
//                          SizedBox(
//                           // height: 15
//                           height: screenheight/80,
//                           ),
//                         CustomCartTextField(
//                           hintText: state.childInfo.child_gender,
//                           iconData: Icons.transgender,
//                           mycontroller: child_gender,
//                           valid: (val) {
//                             if (val!.isEmpty) {
//                               return "Please fill in this field";
//                             }
//                             return null;
//                           },
//                         ),
//                        SizedBox(
//                         // height: 15
//                         height: screenheight/80,
//                         ),
//                         CustomCartTextField(
//                           hintText: state.childInfo.state_health,
//                           iconData: Icons.health_and_safety_outlined,
//                           mycontroller: state_health,
//                           valid: (val) {
//                             if (val!.isEmpty) {
//                               return "Please fill in this field";
//                             }
//                             return null;
//                           },
//                         ),
//                          SizedBox(
//                           // height: 20
//                           height: screenheight/32,
//                           ),
//                         MaterialButton(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(100),
//                           ),
//                           color: AppColor.terqaz,
//                           textColor: AppColor.fairuz,
//                           onPressed: () {
//                             if (formKey.currentState!.validate()) {
//                               context.read<ChildUdProfBloc>().add(
//                                 UpdateChildEvent(
//                                   childId: widget.id,
//                                   childInfoModel: ChildInfoModel(
//                                     name: name.text,
//                                     age: age.text,
//                                     child_gender: child_gender.text,
//                                     state_health: state_health.text,
//                                   ),
//                                 ),
//                               );
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(content: Text("Information has been successfully modified")),
//                               );
//                                setState(() {
//          context.read<MotherHomeBloc>().add(GetAllMyKidsEvent());
        
//       });
//                               Navigator.pop(context, true);
                               
//                             }
//                           },
//                           child: const Text('Edit'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               } else if (state is ChildUpdatedFailureState) {
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

/////////////////////////////////////////////////////////////////////////////////////////


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_childhood/blocs/mother_blocs/child_UD_bloc/child_ud_prof_bloc.dart';
import 'package:flutter_childhood/blocs/mother_blocs/mother_home_bloc/mother_home_bloc.dart';
import 'package:flutter_childhood/core/constant/color.dart';
import 'package:flutter_childhood/core/constant/imageasset.dart';
import 'package:flutter_childhood/model/mother_app_model/child_info_model.dart';
import 'package:flutter_childhood/view/widget/customcarttextfield.dart';

class UpdateChildProfilePage extends StatefulWidget {
  final int id;
final String gender;
  UpdateChildProfilePage({super.key, required this.id, required this.gender});

  @override
  State<UpdateChildProfilePage> createState() => _UpdateChildProfilePageState();
}

class _UpdateChildProfilePageState extends State<UpdateChildProfilePage> {
  File? _image;
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController child_gender = TextEditingController();
  TextEditingController state_health = TextEditingController();
  
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<ChildUdProfBloc>().add(GetChildPreviousInfoEvent(childId: widget.id));
    super.initState();
  }

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
   ImageProvider _getDefaultImage() {
    if (widget.gender.toLowerCase() == 'female') {
      return const AssetImage(AppImageAsset.girl);
    } else {
      return const AssetImage(AppImageAsset.boy); // Use the appropriate image for boys here
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    // double screenwidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        context.read<MotherHomeBloc>().add(GetAllMyKidsEvent());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Edit Child's Profile",
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
          create: (context) => ChildUdProfBloc()..add(GetChildPreviousInfoEvent(childId: widget.id)),
          child: BlocBuilder<ChildUdProfBloc, ChildUdProfState>(
            builder: (context, state) {
              if (state is GetChildPreviousInfoState) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: screenheight / 150,
                        ),
                       InkWell(
  onTap: pickImage,
  child: Stack(
    children: [
      CircleAvatar(
        radius: 60,
        backgroundImage: _image != null
            ? FileImage(_image!)
            : _getDefaultImage()
            // const AssetImage(AppImageAsset.girl) as ImageProvider,
      ),
      Positioned(
        bottom: 0, 
        right: 0, 
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(0.6), 
          ),
          padding: EdgeInsets.all(8),
          child: const Icon(
            Icons.camera_alt,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    ],
  ),
),
                        const SizedBox(height: 20),
                        Text(
                          "Edit Details for ${state.childInfo.name}",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColor.terqaz,
                          ),
                        ),
                        SizedBox(
                          height: screenheight * 0.02,
                        ),
                        CustomCartTextField(
                          hintText: state.childInfo.name,
                          iconData: Icons.person_3_outlined,
                          mycontroller: name,
                          valid: (val) {
                            if (val!.isEmpty) {
                              return "Please fill in this field";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: screenheight / 80,
                        ),
                        CustomCartTextField(
                          hintText: state.childInfo.age,
                          iconData: Icons.cake,
                          mycontroller: age,
                          valid: (val) {
                            if (val!.isEmpty) {
                              return "Please fill in this field";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: screenheight / 80,
                        ),
                        CustomCartTextField(
                          hintText: state.childInfo.child_gender,
                          iconData: Icons.transgender,
                          mycontroller: child_gender,
                          valid: (val) {
                            if (val!.isEmpty) {
                              return "Please fill in this field";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: screenheight / 80,
                        ),
                        CustomCartTextField(
                          hintText: state.childInfo.state_health,
                          iconData: Icons.health_and_safety_outlined,
                          mycontroller: state_health,
                          valid: (val) {
                            if (val!.isEmpty) {
                              return "Please fill in this field";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: screenheight / 32,
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          color: AppColor.terqaz,
                          textColor: AppColor.fairuz,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<ChildUdProfBloc>().add(
                                UpdateChildEvent(
                                  childId: widget.id,
                                  childInfoModel: ChildInfoModel(
                                    name: name.text,
                                    age: age.text,
                                    child_gender: child_gender.text,
                                    state_health: state_health.text,
                                    // featured_image: _image!.path,
                                  ),
                                ),
                              );
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(content: Text("Information has been successfully modified")),
                              // );
                              setState(() {
                                context.read<MotherHomeBloc>().add(GetAllMyKidsEvent());
                              });
                              Navigator.pop(context, true);
                            }
                          },
                          child: const Text('Edit'),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is ChildUpdatedFailureState) {
                return Center(child: Text(state.errorMessage));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
