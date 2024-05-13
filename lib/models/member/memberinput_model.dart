import 'dart:typed_data';
import 'dart:convert';

class MemberInputModel {
  String memberId = "";
  String nama = "";
  String hp = "";
  String alamat1 = "";
  String? alamat2;
  String? propinsiId;
  String? propinsiDesc;
  DateTime? joinDate;
  DateTime? dob;
  String? pob;
  String? referral;
  Uint8List? memberFoto;
  String? jnskelId;
  String? jnskelDesc;
  String? email;
  String? jabatanId;
  String? jabatanDesc;

  MemberInputModel(
      {required this.memberId,
      required this.nama,
      required this.hp,
      required this.alamat1,
      this.alamat2,
      this.propinsiId,
      this.propinsiDesc,
      this.joinDate,
      this.memberFoto,
      this.dob,
      this.pob,
      this.referral,
      this.jnskelId,
      this.jnskelDesc,
      this.email,
      this.jabatanId,
      this.jabatanDesc});

  factory MemberInputModel.fromJson(Map<String, dynamic> data) =>
      MemberInputModel(
          memberId: data['memberId'],
          nama: data['nama'],
          hp: data['hp'],
          alamat1: data['alamat1'],
          alamat2: data['alamat2'],
          propinsiId: data['propinsiId'],
          propinsiDesc: data['propinsiDesc'],
          joinDate: DateTime.parse(data['joinDate']),
          //joinDate: data['joinDate'],
          //dob: data['dob'],
          dob: DateTime.parse(data['dob']),
          pob: data['pob'],
          referral: data['referral'],
          email: data['email'],
          memberFoto: data['memberFoto'] != ''
              ? base64.decode(data['memberFoto'])
              : null,
          jnskelId: data['jnskelId'],
          jnskelDesc: data['jnskelDesc'],
          jabatanId: data['jabatanId'],
          jabatanDesc: data['jabatanDesc']);

  Map<String, dynamic> toJson() => {
        "memberId": memberId,
        "nama": nama,
        "hp": hp,
        "alamat1": alamat1,
        "alamat2": alamat2,
        "propinsiId": propinsiId,
        "propinsiDesc": propinsiDesc,
        "joinDate": joinDate?.toIso8601String(),
        "dob": dob?.toIso8601String(),
        "pob": pob,
        "referral": referral,
        "memberFoto": memberFoto != null ? base64.encode(memberFoto!) : "",
        "jnskelId": jnskelId,
        "jnskelDesc": jnskelDesc,
        "email": email,
        "jabatanId": jabatanId,
        "jabatanDesc": jabatanDesc
      };
}
