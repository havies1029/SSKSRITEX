import 'dart:typed_data';
import 'dart:convert';

class MemberListModel {
  String memberId = "";
  String nama = "";
  Uint8List? memberFoto;
  /*
  String hp = "";
  String alamat1 = "";
  String? alamat2;
  String? propinsi;
  String? joinDate;
  String? dob;
  String? pob;
  String? referral;
  Uint8List? memberFoto;
  String jnskel = "";
  String email = "";
  */

  MemberListModel(
      {required this.memberId,
      required this.nama,
      this.memberFoto,
      /*
      required this.hp,
      required this.alamat1,
      this.alamat2,
      this.propinsi,
      required this.joinDate,
      this.dob,
      this.pob,
      this.referral,      
      required this.jnskel,
      required this.email
      */
      });

  factory MemberListModel.fromJson(Map<String, dynamic> data) =>
      MemberListModel(
          memberId: data['memberId'],
          nama: data['nama'],
          memberFoto: data['memberFoto'] != ''
              ? base64.decode(data['memberFoto'])
              : null,
          /*
          hp: data['hp'],
          alamat1: data['alamat1'],
          alamat2: data['alamat2'],
          propinsi: data['propinsi'],
          joinDate: data['joinDate'],
          dob: data['dob'],
          pob: data['pob'],
          referral: data['referral'],
          email: data['email'],
          jnskel: data['jnskel']
          */
          );

  Map<String, dynamic> toJson() => {
        "memberId": memberId,
        "nama": nama,        
        "memberFoto": base64.encode(memberFoto!),
        /*
        "hp": hp,
        "alamat1": alamat1,
        "alamat2": alamat2,
        "propinsi": propinsi,
        //"joinDate": joinDate.toIso8601String(),
        "joinDate": joinDate,
        "dob": dob,
        "pob": pob,
        "referral": referral,
        "jnskel": jnskel,
        "email": email
        */
      };
}
