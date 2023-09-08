
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mom_app/core/network/cache_helper.dart';
import 'package:mom_app/core/network/dio_helper.dart';
import 'package:mom_app/core/utils/component.dart';
import 'package:mom_app/view/community/cubit/states.dart';
import '../../../core/network/end_points.dart';
import '../models/all_posts.dart';
import '../models/group_details.dart';
import '../models/my_groups.dart';
import '../models/profile_details.dart';
import '../models/recommended_group.dart';
import '../models/request_friend.dart';

class CommunityCubit extends Cubit<CommunityStates>{
  CommunityCubit() :super(InitialCommunityState());

  static CommunityCubit get(context)=>BlocProvider.of(context);
  int  communityIndex =0;
  void changeCommunity(int index){
    communityIndex=index;
    emit(ChangeCommunityState());
  }

  ImagePicker picker = ImagePicker();
  XFile? image;
  File? imageShow;
  Future<void> addImage() async {
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = pickedFile;
      imageShow = File(image!.path);
      print('image done');
      emit(ImagePickedState());
    } else {
      emit(ImagePickedErrorState('No image selected.'));
    }
  }

  void sendPublicPost({
    required text ,
})async{
    emit(SendPublicPostLoading());
    FormData formData =FormData.fromMap({
     'images': image != null?
     await MultipartFile.fromFile(image!.path) :'',
     'caption':text,
    });
   await DioHelper.postFormData(
        url: SENDPUBLICPOST,
        data: formData,
        token:await getToken()
      ).then((value) {
        print(value.data);
        getAllPosts();
        emit(SendPublicPostSuccess());
   }
      ).catchError((error){
       emit(SendPublicPostError(error.toString()));
       print(error.toString());
   });
  }

  void sendGroupPost({
    required text ,
    required id ,
  })async{
    emit(SendGroupPostLoading());
    FormData formData =FormData.fromMap({
      'images': image != null?
      await MultipartFile.fromFile(image!.path):'',
      'caption':text,
    });
    await DioHelper.postFormData(
        url: SENDGROUPPOST+id,
        data: formData,
        token:await getToken()
    ).then((value) {
      print(value.data);
      emit(SendGroupPostSuccess());
    }
    ).catchError((error){
      emit(SendGroupPostError(error.toString()));
      print(error.toString());
    });
  }


  MyGroupsModel? myGroupsModel ;
   
  void getMyGroups()async{
    emit(GetMyGroupsLoading());
   await DioHelper.getData(
        url: MYGROUPS,
        token: await getToken(),
    ).then((value){
      myGroupsModel = MyGroupsModel.fromJson(value.data);
      print('get my groups done');
    emit(GetMyGroupsSuccess());
    }).catchError((error){
      print('error when get my group ${error.toString()}');
      emit(GetMyGroupsError(error.toString()));
    });
  }

  List<RecommendedGroupModel> recommendedGroups=[];
  void getRecommendedGroups()async{
    emit(GetRecommendedGroupsLoading());
    await DioHelper.getData(
      url: RECOMMENDEDGROUPS,
      token: await getToken(),
    ).then((value){
      value.data['groups'].forEach((element){
        recommendedGroups.add(
            RecommendedGroupModel.fromJson(element));
      });
      print('recommended groups done');
      emit(GetRecommendedGroupsSuccess());
    }).catchError((error){
      print(error.toString());
      emit(GetRecommendedGroupsError(error.toString()));
    });
  }
  GroupDetailsModel ? groupDetailsModel ;
  void getGroupDetails({required id})async{
    emit(GetGroupLoading());
    await DioHelper.getData(
      url: GROUPBYID+id,
      token: await getToken(),
    ).then((value){
      groupDetailsModel =
          GroupDetailsModel.fromJson(value.data);
      print('group done');
      emit(GetGroupSuccess());
    }).catchError((error){
      print("error when get group ${error.toString()}");
      emit(GetGroupError(error.toString()));
    });
  }

  void createGroup({
    required String groupName,
})async{
    emit(CreateGroupLoading());
   await DioHelper.postData(
        url: CREATEGROUP,
        token:await getToken() ,
        data: {
          'groupName':groupName,
        } ,
   ).then((value){
     getMyGroups();
     emit(CreateGroupSuccess());
     print('create group done');
   }).catchError((error){
     print(error.toString());
     emit(CreateGroupError(error.toString()));
   });
  }


  void joinGroup({
    required String id,
  })async{
    await DioHelper.postDataWithToken(
        url: JOINGROUP+id,
        token:await getToken(),
    ).then((value){
      getGroupDetails(id: id);
      emit(JoinGroupSuccess());
      print(value.data);
    }).catchError((error){
      print(error.toString());
      emit(JoinGroupError(error.toString()));
    });
  }

  void leaveGroup({
    required String id,
  })async{
    await DioHelper.postDataWithToken(
      url: LEAVEGROUP+id,
      token:await getToken(),
    ).then((value){
      getGroupDetails(id: id);
      emit(LeaveGroupSuccess());
      print(value.data);
    }).catchError((error){
      print(error.toString());
      emit(LeaveGroupError(error.toString()));
    });
  }

  void addFriend({
    required String id,
  })async{
    await DioHelper.postDataWithToken(
      url: ADDFRIEND+id,
      token:await getToken(),
    ).then((value){
      getProfileDetails(id: id);
      emit(AddFriendSuccess());
      print(value.data);
    }).catchError((error){
      print(error.toString());
      emit(AddFriendError(error.toString()));
    });
  }
  void unFriend({
    required String id,
  })async{
    await DioHelper.postDataWithToken(
      url: UNFRIEND+id,
      token:await getToken(),
    ).then((value){
      getProfileDetails(id: id);
      emit(UnFriendSuccess());
      print(value.data);
    }).catchError((error){
      print(error.toString());
      emit(UnFriendError(error.toString()));
    });
  }

  List<AllPostsModel> allPosts = [];
  void getAllPosts()async{
    emit(GetAllPostsLoading());
     allPosts = [];
    await DioHelper.getData(
      url: AllPosts,
      token: await getToken(),
    ).then((value){
      value.data['posts'].forEach((element){
        allPosts.add(
            AllPostsModel.fromJson(element));
      });
      print('all posts done');
      emit(GetAllPostsSuccess());
    }).catchError((error){
      print("error when get all posts ${error.toString()}");
      emit(GetAllPostsError(error.toString()));
    });
  }

   ProfileDetailsModel? profileDetails ;
  void getProfileDetails({required id})async{
    emit(GetProfileLoading());
    await DioHelper.getData(
      url: PROFILEBYID+id,
      token: await getToken(),
    ).then((value){
      profileDetails = ProfileDetailsModel.fromJson(value.data);
      print('profile done');
      emit(GetProfileSuccess());
    }).catchError((error){
      print("error when get profile ${error.toString()}");
      emit(GetProfileError(error.toString()));
    });
  }


  void postLike({
    required String id,
  })async{
    await DioHelper.postDataWithToken(
      url: LIKE+id,
      token:await getToken(),
    ).then((value){
      getAllPosts();
      emit(LikeSuccess());
      print(value.data);
    }).catchError((error){
      print('post like error ${error.toString()}');
      emit(LikeError(error.toString()));
    });
  }

  void postUnLike({
    required String id,
  })async{
    await DioHelper.postDataWithToken(
      url: UNLIKE+id,
      token:await getToken(),
    ).then((value){
       getAllPosts();
      emit(UnLikeSuccess());
      print('un like ${value.data}');
    }).catchError((error){
      print('post unlike error ${error.toString()}');
      emit(UnLikeError(error.toString()));
    });
  }
    List<Users>  allFriends =[];
  void getAllFriends()async{
    allFriends = [];
    emit(GetAllFriendsLoading());
    await DioHelper.getData(
      url: ALLFRIENDS,
      token: await getToken(),
    ).then((value){
      value.data['friendList'].forEach((element){
        allFriends.add(Users.fromJson(element));
      });
      print('get all friends done');
      emit(GetAllFriendsSuccess());
    }).catchError((error){
      print('error when get all friends ${error.toString()}');
      emit(GetAllFriendsError(error.toString()));
    });
  }
  List<RequestFriendModel>  allFriendsRequests =[];
  void getAllFriendsRequests()async{
    emit(GetAllFriendsRequestsLoading());
    allFriendsRequests = [];
    await DioHelper.getData(
      url: ALLFRIENDSRequests,
      token: await getToken(),
    ).then((value){
      value.data['allFriendRequests'].forEach((element){
        allFriendsRequests.add(RequestFriendModel.fromJson(element));
      });
      print('get all friends Requests done');
      emit(GetAllFriendsRequestsSuccess());
    }).catchError((error){
      print('error when get all friends Requests ${error.toString()}');
      emit(GetAllFriendsRequestsError(error.toString()));
    });
  }

  void acceptFriend({
    required String id,
  })async{
    emit(AcceptRequestLoading());
    await DioHelper.postDataWithToken(
      url: ACCEPTREQUEST+id,
      token:await getToken(),
    ).then((value){
      getAllFriendsRequests();
      getAllFriends();
      emit(AcceptRequestSuccess());
      print('accepted ${value.data}');
    }).catchError((error){
      print('accept error ${error.toString()}');
      emit(AcceptRequestError(error.toString()));
    });
  }

  void rejectFriend({
    required String id,
  })async{
    emit(RejectRequestLoading());
    await DioHelper.postDataWithToken(
      url: REJECTREQUEST+id,
      token:await getToken(),
    ).then((value){
      getAllFriendsRequests();
      emit(RejectRequestSuccess());
      print('rejected ${value.data}');
    }).catchError((error){
      print('rejected error ${error.toString()}');
      emit(RejectRequestError(error.toString()));
    });
  }

   bool isImageProfile = false ;
  void updateProfileImage()async{
    emit(UpdateProfileImageLoading());
    FormData formData = FormData.fromMap({
      'images': image != null?
      await MultipartFile.fromFile(image!.path) :'',
    });
    await DioHelper.postFormData(
      url: UPDATEPROFILEIMAGE,
      token:await getToken() ,
      data: formData ,
    ).then((value){
      getProfileDetails(id:CacheHelper.getData()!.id);
      emit(UpdateProfileImageSuccess());
      print('image profile done');
    }).catchError((error){
      print('error when update profile image ${error.toString()}');
      emit(UpdateProfileImageError(error.toString()));
    });
  }

  void updateProfileCover()async{
    emit(UpdateProfileCoverLoading());
    FormData formData = FormData.fromMap({
      'images': image != null?
      await MultipartFile.fromFile(image!.path) :'',
    });
    await DioHelper.postFormData(
      url: UPDATEPROFILECOVER,
      token:await getToken() ,
      data: formData ,
    ).then((value){
      getProfileDetails(id:CacheHelper.getData()!.id);
      emit(UpdateProfileCoverSuccess());
      print('cover profile done');
    }).catchError((error){
      print('error when update profile cover ${error.toString()}');
      emit(UpdateProfileCoverError(error.toString()));
    });
  }

  bool isImageGroup = false ;
  void updateGroupImage({required String id})async{
    emit(UpdateGroupImageLoading());
    FormData formData = FormData.fromMap({
      'images': image != null?
      await MultipartFile.fromFile(image!.path) :'',
    });
    await DioHelper.postFormData(
      url: UPDATEGROUPIMAGE+id,
      token:await getToken() ,
      data: formData ,
    ).then((value){
      getGroupDetails(id: id);
      emit(UpdateGroupImageSuccess());
      print('image group done');
    }).catchError((error){
      print('error when update group image ${error.toString()}');
      emit(UpdateGroupImageError(error.toString()));
    });
  }

  void updateGroupCover({required String id})async{
    emit(UpdateGroupCoverLoading());
    FormData formData = FormData.fromMap({
      'images': image != null?
      await MultipartFile.fromFile(image!.path) :'',
    });
    await DioHelper.postFormData(
      url: UPDATEGROUPCOVER+id,
      token:await getToken() ,
      data: formData ,
    ).then((value){
      getGroupDetails(id: id);
      emit(UpdateGroupCoverSuccess());
      print('cover group done');
    }).catchError((error){
      print('error when update group cover ${error.toString()}');
      emit(UpdateGroupCoverError(error.toString()));
    });
  }

}