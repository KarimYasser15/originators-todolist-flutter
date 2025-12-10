import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/core/utils/assets_manager.dart';
import 'package:todo_list/core/utils/colors_manager.dart';
import 'package:todo_list/core/utils/strings_manager.dart';
import 'package:todo_list/core/widgets/circular_loading.dart';
import 'package:todo_list/features/friends/view/widgets/add_friend_bottom_sheet.dart';
import 'package:todo_list/features/friends/view/widgets/friends_item.dart';
import 'package:todo_list/features/friends/view_model/friends_view_model.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

FriendsViewModel viewModel = FriendsViewModel();

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    viewModel.getAllFriends();
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<FriendsViewModel>(
        builder: (context, viewModel, child) => Scaffold(
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add, size: 40),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) =>
                      AddFriendBottomSheet(viewModel: viewModel),
                );
              }),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          appBar: AppBar(
            title: Text(
              StringsManager.friends,
              style: AppStyles.h4MediumDMSans(color: ColorsManager.black),
            ),
            titleSpacing: 0,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10.r),
                child: Container(
                  padding: EdgeInsets.only(left: 15.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.bellIcon,
                        height: 25.h,
                      ),
                      SizedBox(width: 10.w),
                      CircleAvatar(
                        radius: 20.r,
                        backgroundColor: ColorsManager.choosenColor,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          body: Builder(
            builder: (context) {
              if (viewModel.isLoading) {
                return Center(
                  child: CircularLoading(),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "(${viewModel.allFriends.length}) ${StringsManager.friends}",
                          style: AppStyles.h4MediumDMSans(
                              color: ColorsManager.neutralGrey9),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 10.w,
                            mainAxisSpacing: 15.h),
                        itemBuilder: (context, index) => FriendsItem(
                          userName: viewModel.allFriends[index].username!,
                        ),
                        itemCount: viewModel.allFriends.length,
                      ),
                    )
                  ]),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
