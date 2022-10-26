import 'package:flutter_demo/common/app_ext.dart';
import 'package:flutter_demo/data/models/project_mo.dart';
import 'package:flutter_demo/data/repositories/wan_repository.dart';
import 'package:flutter_demo/widget/refresh/refresh_ext.dart';

import '../../../common/controllers/base_page_controller.dart';
import '../../../data/base/base_page_mo.dart';
import 'project_detail_state.dart';

class ProjectDetailLogic extends BasePageController {
  final state = ProjectDetailState();

  @override
  void onReady() {
    super.onReady();
    requestData(Refresh.first, BasePageController.defaultPage);
  }

  @override
  void requestData(Refresh refresh, int page, [bool isFirst = true]) async {
    asyncRequest(
      () => WanRepository.to.projectList(page, state.cid),
      onSuccess: (data) {
        BasePageMo<ProjectMo> basePageMo = BasePageMo.fromJson(data, (json) {
          return ProjectMo.fromJson(json);
        });
        if (refresh == Refresh.down) {
          state.list.clear();
        }
        if (basePageMo.datas != null) {
          state.list.addAll(basePageMo.datas!);
        }
        updatePage(page);
        RefreshExt.onSuccess(refreshController, refresh,
            basePageMo.curPage! >= basePageMo.pageCount!);
        if (isFirst) {
          showSuccess(state.list.isEmpty);
        }
        update();
      },
      onFailure: (error, code, msg) {
        if (isFirst) {
          showError();
        } else {
          RefreshExt.onError(refreshController, refresh);
        }
      },
    );
  }
}
