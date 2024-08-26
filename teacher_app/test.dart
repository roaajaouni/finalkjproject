import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/teacher_blocs/home_bloc/teacher_home_bloc.dart';
import 'package:flutter_childhood/core/constant/imageasset.dart';
import 'package:flutter_childhood/model/teacher_app_model/teacher_home_model.dart';

import '../../../core/constant/color.dart';

import 'teacher_child_profile.dart';

class TeacherHomeTestPage extends StatefulWidget {
  const TeacherHomeTestPage({super.key});

  @override
  State<TeacherHomeTestPage> createState() => _TeacherHomeTestPageState();
}

class _TeacherHomeTestPageState extends State<TeacherHomeTestPage> {
  late List<TeacherHomeModel> allChild;
  late List<TeacherHomeModel> serchedForChild;
  final searchTextController = TextEditingController();
  void addSearchedForItemsToSearchedList(String searchedChild) {
    serchedForChild = allChild
        .where((child) => child.name.toLowerCase().startsWith(searchedChild))
        .toList();
    setState(() {});
  }

   void initState() {
     context.read<TeacherHomeBloc>().add(GetAllTeacherKidsEvent());
    // context.read<TeacherHomeBloc>().add(RefreshTeacherKidsEvent());
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     double screenheight = MediaQuery.of(context).size.height;
    double screenwidth= MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<TeacherHomeBloc, TeacherHomeState>(
          builder: (context, state) {
            if (state is TeacherHomeNoKidsAddedState ){
              return
             Container(
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
            }
            else if (state is GetAllTeacherKidsSuccessState){
 allChild = (state).teacherHomeKids;
   return ListView(children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(children: [
                  Expanded(
                      child: TextFormField(
                    controller: searchTextController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Find Child",
                        hintStyle: const TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Colors.grey[200]),
                    onChanged: (searchedChild) {
                      addSearchedForItemsToSearchedList(searchedChild);
                    },
                  )),
                  const SizedBox(width: 10),
               
                ]),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Stack(children: [
                  Container(
                    alignment: Alignment.center,
                    // height: 150,
                    height: screenheight/4.5,
                    decoration: BoxDecoration(
                        color: AppColor.terqaz,
                        borderRadius: BorderRadius.circular(20)),
                    child: const ListTile(
                      title: Text("Managing children's \n profiles.",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      subtitle: Text("Writing daily reports",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                  Positioned(
                    top: -20,
                    right: -20,
                    
                    child: Container(
                      height: 160,
                      width: 160,
                     
                      decoration: BoxDecoration(
                          color: AppColor.fairuz,
                          borderRadius: BorderRadius.circular(160)),
                    ),
                  )
                ]),
              ),
             
                  Container(
                        color: Colors.white,
                        margin: const EdgeInsets.all(5),
                        // height: 500,
                        height: screenheight/2,
                        padding: const EdgeInsets.all(15),
                        child: ListView.builder(
                          // ! put item count
                          itemCount: searchTextController.text.isEmpty
                              ? allChild.length
                              : serchedForChild.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color: index % 2 == 0
                                          ? AppColor.fairuz
                                          : AppColor.terqaz,
                                      width: 6)),
                              alignment: Alignment.center,
                              // height: 100,
                              height: screenheight/9,
                              margin: const EdgeInsets.only(
                                top: 15,
                              ),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          // TeacherChildProfile(teacherHomeModel:state.teacherHomeKids[index]),
                                          TeacherChildProfile(
                                              teacherHomeModel:
                                                  searchTextController
                                                          .text.isEmpty
                                                      ? allChild[index]
                                                      : serchedForChild[index]),
                                    ),
                                  );
                                },
                                leading: SizedBox(
                                    // height: 100,
                                    // width: 70,
                                    height: screenheight/10,
                                    width: screenwidth/5,
                                    child: ClipOval(
                                        child: state.teacherHomeKids[index]
                                                    .child_gender ==
                                                'female'
                                            ? Image.asset(
                                                // ! put image path
                                                AppImageAsset.girl,
                                                width: 70,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.asset(
                                                // ! put image path
                                                AppImageAsset.boy,
                                                // width: 70,
                                                // height: 100,
                                                fit: BoxFit.cover,
                                              ))),
                                title: Text(searchTextController.text.isEmpty
                                    ? allChild[index].name
                                    : serchedForChild[index].name),
                                // Text(state.teacherHomeKids[index].name),
                                trailing:
                                    const Icon(Icons.arrow_forward_ios_rounded),
                              ),
                            );
                          },
                        ))]);
            }
            else if (state is  GetAllTeacherKidsFailureState){
  return Center(child: Text(state.errorMessage),);
}
else{
 // print(state.toString());
  return const Center(child: CircularProgressIndicator(),);
}
          
                  } 
            )
          );}
        
  }

