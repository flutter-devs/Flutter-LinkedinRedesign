import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linked_redesign/src/bloc/state_bloc.dart';
import 'package:linked_redesign/src/styles/app_colors.dart';

class JobsScreen extends StatefulWidget {
  @override
  _JobsScreenState createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  List<JobsModel> activeJobsModelList;
  List<JobsModel> allJobsModelList;
  List<JobsModel> savedJobsModelList;
  BaseStateBloc<int> baseStateBloc;

  @override
  void initState() {
    baseStateBloc = BaseStateBloc<int>(0);
    loadData();
    super.initState();
  }

  void loadData() {
    activeJobsModelList = List();
    allJobsModelList = List();
    savedJobsModelList = List();
    List.generate(10, (index) {
      activeJobsModelList.add(JobsModel(
          "https://media-exp1.licdn.com/dms/image/C4D0BAQHiNSL4Or29cg/company-logo_200_200/0?e=1587600000&v=beta&t=2kOIcxiy7N15P9rUtQ96jTnwGlhwIQTAAVRawIu7ndY",
          "Head of Design",
          "As a UX Engineer, you will be passionate about developing powerful Android apps that work efficiently across a range of devices. With a keen interest in mobile development and building delightful user interfaces, you will work effectively in a fast-paced and startup-like environment. In addition, you’re motivated and excited about making a positive social impact through your work.",
          "Google"));
    });
    List.generate(10, (index) {
      allJobsModelList.add(JobsModel(
          "https://media-exp1.licdn.com/dms/image/C4D0BAQHiNSL4Or29cg/company-logo_200_200/0?e=1587600000&v=beta&t=2kOIcxiy7N15P9rUtQ96jTnwGlhwIQTAAVRawIu7ndY",
          "Lead UX Engineer",
          "As a UX Engineer, you will be passionate about developing powerful Android apps that work efficiently across a range of devices. With a keen interest in mobile development and building delightful user interfaces, you will work effectively in a fast-paced and startup-like environment. In addition, you’re motivated and excited about making a positive social impact through your work.",
          "Google"));
    });
    List.generate(10, (index) {
      savedJobsModelList.add(JobsModel(
          "https://media-exp1.licdn.com/dms/image/C4D0BAQHiNSL4Or29cg/company-logo_200_200/0?e=1587600000&v=beta&t=2kOIcxiy7N15P9rUtQ96jTnwGlhwIQTAAVRawIu7ndY",
          "UX Engineer",
          "As a UX Engineer, you will be passionate about developing powerful Android apps that work efficiently across a range of devices. With a keen interest in mobile development and building delightful user interfaces, you will work effectively in a fast-paced and startup-like environment. In addition, you’re motivated and excited about making a positive social impact through your work.",
          "Google"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.linkedinLightGray,
      appBar: AppBar(
        title: Text("Jobs",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
        elevation: 0,
        centerTitle: false,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search, color: AppColors.linkedinBlue,),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 50,
            child: baseStateBloc.blocWidget(widget: (value) {
              return CupertinoSegmentedControl<int>(
                //\ padding: EdgeInsets.all(10),
                selectedColor: AppColors.linkedinBlue,
                unselectedColor: AppColors.white,
                pressedColor: AppColors.linkedinDarkGray,
                children: {
                  0: Text("Active"),
                  1: Text("All"),
                  2: Text("Saved"),
                },
                groupValue: value,
                onValueChanged: (value) {
                  baseStateBloc.changeStateWithoutValueProvided(value);
                },
                borderColor: AppColors.linkedinBlue,
              );
            }),
          ),
          baseStateBloc.blocWidget(widget: (value) {
            return Expanded(
              child: IndexedStack(
                sizing: StackFit.loose,
                index: value,
                children: <Widget>[
                  jobsBody(activeJobsModelList),
                  jobsBody(allJobsModelList),
                  jobsBody(savedJobsModelList),
                ],
              ),
            );
          })
        ],
      ),
    );
  }

  Widget jobsBody(List<JobsModel> jobModel) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: jobModel.length,
        itemBuilder: (context, index) {
          return JobsItemCard(jobModel[index]);
        });
  }
}

class JobsItemCard extends StatelessWidget {
  final JobsModel jobsModel;

  JobsItemCard(this.jobsModel);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Column(
        children: <Widget>[
          ListTile(
            enabled: true,
            title: Text(
              jobsModel.designation,
              style: TextStyle(
                  color: AppColors.linkedinBlack, fontWeight: FontWeight.w500),
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                jobsModel.avatarUrl,
                height: 40,
                width: 40,
              ),
            ),
            subtitle: Text(
              jobsModel.company,
              style: TextStyle(color: AppColors.linkedinBlue),
            ),
            trailing: Icon(
              Icons.star_border,
              color: AppColors.linkedinBlue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              jobsModel.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class JobsModel {
  String avatarUrl;
  String designation;
  String description;
  String company;

  JobsModel(this.avatarUrl, this.designation, this.description, this.company);
}
