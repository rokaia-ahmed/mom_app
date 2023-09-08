abstract class CommunityStates{}
 class InitialCommunityState extends CommunityStates{}
class ChangeCommunityState extends CommunityStates{}
class ImagePickedState extends CommunityStates{}
class ImagePickedErrorState extends CommunityStates{
 String errorMessage;
 ImagePickedErrorState(this.errorMessage);
}

class SendPublicPostLoading extends CommunityStates{}
class SendPublicPostSuccess extends CommunityStates{}
class SendPublicPostError extends CommunityStates{
 String errorMessage;
 SendPublicPostError(this.errorMessage);
}
class SendGroupPostLoading extends CommunityStates{}
class SendGroupPostSuccess extends CommunityStates{}
class SendGroupPostError extends CommunityStates{
 String errorMessage;
 SendGroupPostError(this.errorMessage);
}
class GetMyGroupsLoading extends CommunityStates{}
class GetMyGroupsSuccess extends CommunityStates{}
class GetMyGroupsError extends CommunityStates{
 String errorMessage;
 GetMyGroupsError(this.errorMessage);
}
class GetRecommendedGroupsLoading extends CommunityStates{}
class GetRecommendedGroupsSuccess extends CommunityStates{}
class GetRecommendedGroupsError extends CommunityStates{
 String errorMessage;
 GetRecommendedGroupsError(this.errorMessage);
}
class GetAllPostsLoading extends CommunityStates{}
class GetAllPostsSuccess extends CommunityStates{}
class GetAllPostsError extends CommunityStates{
 String errorMessage;
 GetAllPostsError(this.errorMessage);
}
class GetAllFriendsLoading extends CommunityStates{}
class GetAllFriendsSuccess extends CommunityStates{}
class GetAllFriendsError extends CommunityStates{
 String errorMessage;
 GetAllFriendsError(this.errorMessage);
}
class GetAllFriendsRequestsLoading extends CommunityStates{}
class GetAllFriendsRequestsSuccess extends CommunityStates{}
class GetAllFriendsRequestsError extends CommunityStates{
 String errorMessage;
 GetAllFriendsRequestsError(this.errorMessage);
}

class GetProfileLoading extends CommunityStates{}
class GetProfileSuccess extends CommunityStates{}
class GetProfileError extends CommunityStates{
 String errorMessage;
 GetProfileError(this.errorMessage);
}

class GetGroupLoading extends CommunityStates{}
class GetGroupSuccess extends CommunityStates{}
class GetGroupError extends CommunityStates{
 String errorMessage;
 GetGroupError(this.errorMessage);
}

class CreateGroupLoading extends CommunityStates{}
class CreateGroupSuccess extends CommunityStates{}
class CreateGroupError extends CommunityStates{
 String errorMessage;
 CreateGroupError(this.errorMessage);
}


class JoinGroupSuccess extends CommunityStates{}
class JoinGroupError extends CommunityStates{
 String errorMessage;
 JoinGroupError(this.errorMessage);
}

class LeaveGroupSuccess extends CommunityStates{}
class LeaveGroupError extends CommunityStates{
 String errorMessage;
 LeaveGroupError(this.errorMessage);
}

class LikeSuccess extends CommunityStates{}
class LikeError extends CommunityStates{
 String errorMessage;
 LikeError(this.errorMessage);
}

class UnLikeSuccess extends CommunityStates{}
class UnLikeError extends CommunityStates{
 String errorMessage;
 UnLikeError(this.errorMessage);
}

class AddFriendSuccess extends CommunityStates{}
class AddFriendError extends CommunityStates{
 String errorMessage;
 AddFriendError(this.errorMessage);
}

class UnFriendSuccess extends CommunityStates{}
class UnFriendError extends CommunityStates{
 String errorMessage;
 UnFriendError(this.errorMessage);
}
class AcceptRequestLoading extends CommunityStates{}
class AcceptRequestSuccess extends CommunityStates{}
class AcceptRequestError extends CommunityStates{
 String errorMessage;
 AcceptRequestError(this.errorMessage);
}
class RejectRequestLoading extends CommunityStates{}
class RejectRequestSuccess extends CommunityStates{}
class RejectRequestError extends CommunityStates{
 String errorMessage;
 RejectRequestError(this.errorMessage);
}

class UpdateProfileImageLoading extends CommunityStates{}
class UpdateProfileImageSuccess extends CommunityStates{}
class UpdateProfileImageError extends CommunityStates{
 String errorMessage;
 UpdateProfileImageError(this.errorMessage);
}

class UpdateProfileCoverLoading extends CommunityStates{}
class UpdateProfileCoverSuccess extends CommunityStates{}
class UpdateProfileCoverError extends CommunityStates{
 String errorMessage;
 UpdateProfileCoverError(this.errorMessage);
}

class UpdateGroupImageLoading extends CommunityStates{}
class UpdateGroupImageSuccess extends CommunityStates{}
class UpdateGroupImageError extends CommunityStates{
 String errorMessage;
 UpdateGroupImageError(this.errorMessage);
}

class UpdateGroupCoverLoading extends CommunityStates{}
class UpdateGroupCoverSuccess extends CommunityStates{}
class UpdateGroupCoverError extends CommunityStates{
 String errorMessage;
 UpdateGroupCoverError(this.errorMessage);
}