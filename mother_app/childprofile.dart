import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/mother_blocs/child_UD_bloc/child_ud_prof_bloc.dart';
import 'package:flutter_childhood/blocs/mother_blocs/mother_home_bloc/mother_home_bloc.dart';
import 'package:flutter_childhood/model/mother_app_model/home_getkids_model.dart';
import 'package:flutter_childhood/view/screen/mother_app/detail_location.dart';

import 'package:flutter_childhood/view/screen/mother_app/mealspage.dart';

import 'package:flutter_childhood/view/screen/mother_app/note.dart';
import 'package:flutter_childhood/view/screen/mother_app/reports.dart';
import 'package:flutter_childhood/view/screen/mother_app/update_child_profile.dart';
import 'package:flutter_childhood/view/widget/main_bottom_navigation_bar_page.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

import '../../widget/custommealinkwel.dart';
import '../../widget/login/custombutton.dart';

class ChildProfile extends StatefulWidget {
  final HomeMotherModel homeMotherModel;
  // const ChildProfile({super.key});
  const ChildProfile({Key? key, required this.homeMotherModel})
      : super(key: key);

  @override
  State<ChildProfile> createState() => _ChildProfileState();
}

class _ChildProfileState extends State<ChildProfile> {


 
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth= MediaQuery.of(context).size.width;
    
    return Scaffold(
      //backgroundColor: AppColor.backgroundColor,

      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                // height: 300,
                height: screenheight/2.5,
                decoration: const BoxDecoration(
                    color: AppColor.fairuz,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(275),
                        bottomRight: Radius.circular(275))),
              ),
              Positioned(
                bottom: -20,
                child: Container(
                    // height: 90,
                    // width: 90,
                    height: screenheight/10,
                    width: screenwidth/5.5,
                    decoration: BoxDecoration(
                        color: AppColor.terqaz,
                        borderRadius: BorderRadius.circular(90)),
                    child: ClipOval(
                        child: widget.homeMotherModel.child_gender == 'female'
                            ? Image.asset(
                                AppImageAsset.girl,
                                // width: 90,
                                // height: 90,
                                width: screenwidth/5.5,
                                height: screenheight/10,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                AppImageAsset.boy,
                                // width: 90,
                                // height: 90,
                                width: screenwidth/5.5,
                                height: screenheight/10,
                                fit: BoxFit.cover,
                              ))),
              ),
              Positioned(
                  // top: 130,
                  height: screenheight/4.5,
                  child: Text(
                    widget.homeMotherModel.name,
                    //data[0],
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColor.grey),
                  )),
              Positioned(
                  // top: 160,
                   height: screenheight/6,
                  child: Text(
                    '${widget.homeMotherModel.age} years old',
                    style: const TextStyle(fontSize: 16, color: AppColor.grey),
                  )),
              Positioned(
                 top: 40,
                //  height: screenheight/18,
                 left: 20,
                
                child: Custombutton(
                  text: 'Edit',
                  onPressed: () async{
                   final result=await Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateChildProfilePage(
                                  id: widget.homeMotherModel.id,
                                  gender:widget.homeMotherModel.child_gender
                                )));
                     if (result == true) {
    
    setState(() {
       context.read<MotherHomeBloc>().add(GetAllMyKidsEvent());
      
    });
  }           
                  },
                ),
              ),
              Positioned(
                   top: 40,
                 
                  right: 20,
                  child: Custombutton(
                    text: 'Delete',
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Warring'),
                              content: const Text(' Are you sure ?'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      context.read<ChildUdProfBloc>().add(
                                          DeleteChildEvent(
                                              childId:
                                                  widget.homeMotherModel.id));
                                      Navigator.of(context)
                                          .popUntil((route) => route.isFirst);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MainBottomNavigationBarPage()),
                                      );
                                      //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MainBottomNavigationBarPage()));
                                    },
                                    child: const Text(
                                      'Delete',
                                      style: TextStyle(color: AppColor.terqaz),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancel',
                                        style:
                                            TextStyle(color: AppColor.terqaz)))
                              ],
                            );
                          });
                    },
                  ))
            ],
          ),
           SizedBox(
            // height: 130,
            height: screenheight/12,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Custominkwel(
                  text: 'Meals',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  MealsPage(id: widget.homeMotherModel.id)));
                  },
                  myimage: Image.asset(
                    AppImageAsset.burger,
                    // height: 70,
                    // width: 70,
                    height: screenheight/12,
                    width: screenheight/12,
                  ),
                ),
                SizedBox(
                  // width: 70,
                  width: screenwidth/10,
                ),
                Custominkwel(
                  text: 'Reports',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReportsPage(
                                  name: widget.homeMotherModel.name,
                                  id: widget.homeMotherModel.id,
                                  age: widget.homeMotherModel.age,
                                  gender: widget.homeMotherModel.child_gender,
                                )));
                  },
                  myimage: Image.asset(
                    AppImageAsset.report,
                    // height: 70,
                    // width: 70,
                    height: screenheight/12,
                    width: screenheight/12,
                  ),
                ),
              ],
            ),
          ),
           SizedBox(
            // height: 30,
            height: screenheight/20,
          ),
          // Custominkwel(
          //   text: 'Notes',
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) =>
          //                 CreateNotesPage(id: homeMotherModel.id)));
          //   },
          //   myimage: Image.asset(
          //     AppImageAsset.note,
          //     height: 70,
          //     width: 70,
          //   ),
          // ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Custominkwel(
                  text: 'Notes',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateNotesPage(
                                id: widget.homeMotherModel.id,
                                childname:widget.homeMotherModel.name
                                )));
                  },
                  myimage: Image.asset(
                    AppImageAsset.note,
                    // height: 70,
                    // width: 70,
                    height: screenheight/12,
                    width: screenheight/12,
                  ),
                ),
                 SizedBox(
                  // width: 70,
                  width: screenwidth/10,
                ),
                Custominkwel(
                  text: 'State',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailLocationPage(
                                   name:widget. homeMotherModel.name,
                                  id: widget.homeMotherModel.id,
                                  // age: homeMotherModel.age,
                                  // gender: homeMotherModel.child_gender,
                                )));
                  },
                  myimage: Image.asset(
                    AppImageAsset.location,
                    // height: 70,
                    // width: 70,
                    height: screenheight/12,
                    width: screenheight/12,
                  ),
                ),
              ],
            ),
          ),
           SizedBox(
            // height: 30,
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
          //       Navigator.pop(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => const MainBottomNavigationBarPage()));
          //     },
          //     child: const Text('Back'),
          //   ),
          // )
        ],
      ),
    );
  }
}
