class OrganizationDonation {
  final List<String> images;
  final String date;
  final String location;
  final String time;
  final String eventPurpose;
  final String eventTheme;
  final String sponsorshipsAndPartnerships;
  final String volunteerCoordination;
  final String publicityAndPromotions;
  final String fundraisingActivities;
  final String eventProgram;
  final String eventDescription;

  OrganizationDonation({
    required this.images,
    required this.date,
    required this.location,
    required this.time,
    required this.eventPurpose,
    required this.eventTheme,
    required this.sponsorshipsAndPartnerships,
    required this.volunteerCoordination,
    required this.publicityAndPromotions,
    required this.fundraisingActivities,
    required this.eventProgram,
    required this.eventDescription,
  });
  //tomap method
  Map<String, dynamic> toMap() {
    return {
      'images': images,
      'date': date,
      'location': location,
      'time': time,
      'eventPurpose': eventPurpose,
      'eventTheme': eventTheme,
      'sponsorshipsAndPartnerships': sponsorshipsAndPartnerships,
      'volunteerCoordination': volunteerCoordination,
      'publicityAndPromotions': publicityAndPromotions,
      'fundraisingActivities': fundraisingActivities,
      'eventProgram': eventProgram,
      'eventDescription': eventDescription,
    };
  }

  //frommap method
  factory OrganizationDonation.fromMap(Map<String, dynamic> map) {
    return OrganizationDonation(
      images: List<String>.from(map['images']),
      date: map['date'],
      location: map['location'],
      time: map['time'],
      eventPurpose: map['eventPurpose'],
      eventTheme: map['eventTheme'],
      sponsorshipsAndPartnerships: map['sponsorshipsAndPartnerships'],
      volunteerCoordination: map['volunteerCoordination'],
      publicityAndPromotions: map['publicityAndPromotions'],
      fundraisingActivities: map['fundraisingActivities'],
      eventProgram: map['eventProgram'],
      eventDescription: map['eventDescription'],
    );
  }
}
