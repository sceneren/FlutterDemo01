import 'package:flutter_demo/common/app_ext.dart';
import 'package:get/get.dart';

import '../../data/models/project_category_mo.dart';
import '../../data/repositories/wan_repository.dart';
import 'project_state.dart';

class ProjectLogic extends GetxController {
  final ProjectState state = ProjectState();

  @override
  void onReady() {
    super.onReady();
    requestData();
  }

  void requestData() async {
    asyncRequest(
      () => WanRepository.to.projectTree(),
      onSuccess: (data) {
        ProjectCategoryMoList listMo = ProjectCategoryMoList.fromJson(data);
        state.list.assignAll(listMo.list ?? []);
        update();
      },
      onFailure: (error, code, msg) {

      },
    );
  }
}
