import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/teacher_blocs/location_bloc/location_teacher_bloc.dart';
import 'package:flutter_childhood/core/constant/color.dart';

class TeacherDetailLocationPage extends StatelessWidget {
  final int id ;
  final String name;
  const TeacherDetailLocationPage({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LocationTeacherBloc()..add(FetchChildLocationEvent(childId: id)),
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(8),
          child: BlocBuilder<LocationTeacherBloc, LocationTeacherState>(
            builder: (context, state) {
              if (state is ChildLocationIsFetchedState) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const Icon(
                      Icons.location_on_outlined,
                      color: AppColor.terqaz,
                      size: 90,
                    ),
                     const SizedBox(
                      height: 20,
                    ),
                    Text( "$name 's location",style:const TextStyle(fontSize: 23,color: AppColor.terqaz),),
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.fairuz,
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.only(
                              top: 20, left: 15, right: 15),
                          height: 200,
                          width: 300,
                          child: state.teacherLocationModel.Important_notes.isEmpty
     ? Text(
          "${state.teacherLocationModel.location} \n",
          textAlign: TextAlign.center,style: const TextStyle(fontSize: 20),
        )
      : Text(
          "${state.teacherLocationModel.Important_notes} \n",
          textAlign: TextAlign.center,style: const TextStyle(fontSize: 20),
        ),
                          ),
                    ),
                  ],
                );
              } else if (state is ChildLocationFailureState) {
                return Center(child: Text(state.errorMessage),);
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
