class ReminderModel{
  String? message;
  Reminder? reminder;
  ReminderModel.fromJson(Map<String,dynamic> json){
    message = json['message'];
    reminder =  Reminder.fromJson(json['reminder']);
  }
}

class Reminder {
  String? id;
  String? reminder;
  String? date;
  String? time;
  String? note;
  String? babyId;
  String? usersId;
  Reminder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    note = json['note'];
    babyId = json['babyId'];
    usersId = json['usersId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['activity'] = this.reminder;
    data['date'] = this.date;
    data['time'] = this.time;
    data['note'] = this.note;
    data['babyId'] = this.babyId;
    data['usersId'] = this.usersId;
    return data;
  }
}