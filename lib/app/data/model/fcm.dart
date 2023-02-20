class FcmUpdateRes {
  FcmUpdateRes({
    this.status,
    this.message,
    this.data,
  });

  dynamic status;
  dynamic message;
  Data? data;

  factory FcmUpdateRes.fromMap(Map<String, dynamic> json) => FcmUpdateRes(
        status: json["status"],
        message: json["Message"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "Message": message,
        "data": data!.toMap(),
      };
}

class Data {
  Data({
    this.indexId,
    this.adminId,
    this.academicYear,
    this.registerNumber,
    this.logos,
    this.name,
    this.nameTamil,
    this.department,
    this.section,
    this.fname,
    this.mname,
    this.foccupation,
    this.moccupation,
    this.contact1,
    this.contact2,
    this.contact3,
    this.email,
    this.password,
    this.address,
    this.state,
    this.city,
    this.category,
    this.groups,
    this.pincode,
    this.bloodGroup,
    this.motherTongue,
    this.caste,
    this.subCaste,
    this.community,
    this.annualIncome,
    this.dob,
    this.gender,
    this.aadhaar,
    this.fnameTamil,
    this.mnameTamil,
    this.gname,
    this.gnameTamil,
    this.goccupation,
    this.joiningDate,
    this.joiningClass,
    this.emisNumber,
    this.nationality,
    this.religion,
    this.medium,
    this.createdOn,
    this.createdBy,
    this.createdStaff,
    this.appToken,
  });

  dynamic indexId;
  dynamic adminId;
  dynamic academicYear;
  dynamic registerNumber;
  dynamic logos;
  dynamic name;
  dynamic nameTamil;
  dynamic department;
  dynamic section;
  dynamic fname;
  dynamic mname;
  dynamic foccupation;
  dynamic moccupation;
  dynamic contact1;
  dynamic contact2;
  dynamic contact3;
  dynamic email;
  dynamic password;
  dynamic address;
  dynamic state;
  dynamic city;
  dynamic category;
  dynamic groups;
  dynamic pincode;
  dynamic bloodGroup;
  dynamic motherTongue;
  dynamic caste;
  dynamic subCaste;
  dynamic community;
  dynamic annualIncome;
  dynamic dob;
  dynamic gender;
  dynamic aadhaar;
  dynamic fnameTamil;
  dynamic mnameTamil;
  dynamic gname;
  dynamic gnameTamil;
  dynamic goccupation;
  dynamic joiningDate;
  dynamic joiningClass;
  dynamic emisNumber;
  dynamic nationality;
  dynamic religion;
  dynamic medium;
  dynamic createdOn;
  dynamic createdBy;
  dynamic createdStaff;
  dynamic appToken;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        indexId: json["index_id"],
        adminId: json["admin_id"],
        academicYear: json["academic_year"],
        registerNumber: json["register_number"],
        logos: json["logos"],
        name: json["name"],
        nameTamil: json["name_tamil"],
        department: json["department"],
        section: json["section"],
        fname: json["fname"],
        mname: json["mname"],
        foccupation: json["foccupation"],
        moccupation: json["moccupation"],
        contact1: json["contact1"],
        contact2: json["contact2"],
        contact3: json["contact3"],
        email: json["email"],
        password: json["password"],
        address: json["address"],
        state: json["state"],
        city: json["city"],
        category: json["category"],
        groups: json["groups"],
        pincode: json["pincode"],
        bloodGroup: json["blood_group"],
        motherTongue: json["mother_tongue"],
        caste: json["caste"],
        subCaste: json["sub_caste"],
        community: json["community"],
        annualIncome: json["annual_income"],
        dob: json["dob"],
        gender: json["gender"],
        aadhaar: json["aadhaar"],
        fnameTamil: json["fname_tamil"],
        mnameTamil: json["mname_tamil"],
        gname: json["gname"],
        gnameTamil: json["gname_tamil"],
        goccupation: json["goccupation"],
        joiningDate: json["joining_date"],
        joiningClass: json["joining_class"],
        emisNumber: json["emis_number"],
        nationality: json["nationality"],
        religion: json["religion"],
        medium: json["medium"],
        createdOn: DateTime.parse(json["created_on"]),
        createdBy: json["created_by"],
        createdStaff: json["created_staff"],
        appToken: json["app_token"],
      );

  Map<String, dynamic> toMap() => {
        "index_id": indexId,
        "admin_id": adminId,
        "academic_year": academicYear,
        "register_number": registerNumber,
        "logos": logos,
        "name": name,
        "name_tamil": nameTamil,
        "department": department,
        "section": section,
        "fname": fname,
        "mname": mname,
        "foccupation": foccupation,
        "moccupation": moccupation,
        "contact1": contact1,
        "contact2": contact2,
        "contact3": contact3,
        "email": email,
        "password": password,
        "address": address,
        "state": state,
        "city": city,
        "category": category,
        "groups": groups,
        "pincode": pincode,
        "blood_group": bloodGroup,
        "mother_tongue": motherTongue,
        "caste": caste,
        "sub_caste": subCaste,
        "community": community,
        "annual_income": annualIncome,
        "dob": dob,
        "gender": gender,
        "aadhaar": aadhaar,
        "fname_tamil": fnameTamil,
        "mname_tamil": mnameTamil,
        "gname": gname,
        "gname_tamil": gnameTamil,
        "goccupation": goccupation,
        "joining_date": joiningDate,
        "joining_class": joiningClass,
        "emis_number": emisNumber,
        "nationality": nationality,
        "religion": religion,
        "medium": medium,
        "created_on": createdOn.toIso8601String(),
        "created_by": createdBy,
        "created_staff": createdStaff,
        "app_token": appToken,
      };
}
