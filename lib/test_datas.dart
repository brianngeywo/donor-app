import 'models/donation_model.dart';
import 'models/donation_request_model.dart';
import 'models/organization_donation_model.dart';

final List<OrganizationDonation> organizationDonations = [
  OrganizationDonation(
    images: [
      'https://images.pexels.com/photos/9826015/pexels-photo-9826015.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/2608517/pexels-photo-2608517.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/587741/pexels-photo-587741.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/16730715/pexels-photo-16730715/free-photo-of-blurred-people-on-event-in-black-and-white.jpeg?auto=compress&cs=tinysrgb&w=400',
      'https://images.pexels.com/photos/4262010/pexels-photo-4262010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ],
    date: '2023-07-12',
    location: 'Event Location 1',
    time: '10:00 AM',
    eventPurpose: 'Event Purpose 1',
    eventTheme: 'Event Theme 1',
    sponsorshipsAndPartnerships: 'Sponsorships and Partnerships 1',
    volunteerCoordination: 'Volunteer Coordination 1',
    publicityAndPromotions: 'Publicity and Promotions 1',
    fundraisingActivities: 'Fundraising Activities 1',
    eventProgram: 'Event Program 1',
    eventDescription:
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Commodo ullamcorper a lacus vestibulum sed. Nunc pulvinar sapien et ligula ullamcorper malesuada. Nisi scelerisque eu ultrices vitae auctor eu augue ut lectus. Laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean. Placerat vestibulum lectus mauris ultrices. Pharetra vel turpis nunc eget lorem dolor sed. Etiam non quam lacus suspendisse faucibus interdum posuere lorem. Ante in nibh mauris cursus mattis molestie a iaculis. Suspendisse faucibus interdum posuere lorem. Interdum consectetur libero id faucibus nisl tincidunt eget. Mattis aliquam faucibus purus in massa tempor nec feugiat nisl. Eget nulla facilisi etiam dignissim. Maecenas sed enim ut sem viverra aliquet eget sit. Eget mauris pharetra et ultrices neque ornare aenean euismod elementum. Enim sit amet venenatis urna cursus eget.

Cursus mattis molestie a iaculis. Et odio pellentesque diam volutpat. Arcu felis bibendum ut tristique et egestas quis ipsum suspendisse. Ac feugiat sed lectus vestibulum mattis. Quam lacus suspendisse faucibus interdum. Lacus vel facilisis volutpat est velit egestas dui id ornare. Ullamcorper malesuada proin libero nunc consequat. Laoreet sit amet cursus sit. Nisl purus in mollis nunc sed id semper risus in. Velit aliquet sagittis id consectetur purus. Lacinia quis vel eros donec ac odio tempor orci dapibus.

Elit pellentesque habitant morbi tristique senectus et. Parturient montes nascetur ridiculus mus mauris. Risus viverra adipiscing at in. Tincidunt id aliquet risus feugiat in ante. Id ornare arcu odio ut. Nunc vel risus commodo viverra. Sodales neque sodales ut etiam sit. Sodales ut eu sem integer vitae. Risus pretium quam vulputate dignissim suspendisse in est. Integer quis auctor elit sed vulputate. Mattis pellentesque id nibh tortor id aliquet lectus proin. Ornare arcu dui vivamus arcu felis. Sit amet purus gravida quis blandit turpis. Ullamcorper sit amet risus nullam eget felis eget nunc.

Nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque. Massa vitae tortor condimentum lacinia quis vel. Nam libero justo laoreet sit. Vel fringilla est ullamcorper eget. Luctus venenatis lectus magna fringilla urna porttitor. Malesuada proin libero nunc consequat. Purus non enim praesent elementum. Morbi tempus iaculis urna id volutpat lacus laoreet non. Sed id semper risus in hendrerit gravida rutrum quisque non. Id velit ut tortor pretium viverra suspendisse potenti nullam. Habitasse platea dictumst quisque sagittis purus. Nibh cras pulvinar mattis nunc sed blandit libero volutpat sed. Sed velit dignissim sodales ut eu sem integer vitae justo. Tortor at auctor urna nunc id cursus metus. Orci sagittis eu volutpat odio facilisis mauris sit amet. Aliquam vestibulum morbi blandit cursus risus at ultrices mi. Tristique magna sit amet purus gravida quis blandit. Condimentum vitae sapien pellentesque habitant morbi tristique senectus et.

Amet dictum sit amet justo. Tristique senectus et netus et malesuada. Consectetur a erat nam at lectus. Sagittis id consectetur purus ut faucibus pulvinar elementum. Eget mi proin sed libero. Ac felis donec et odio pellentesque. Mattis aliquam faucibus purus in massa tempor. Felis imperdiet proin fermentum leo vel orci porta non. Vulputate odio ut enim blandit. Turpis in eu mi bibendum neque egestas congue quisque egestas.''',
  ),
  OrganizationDonation(
    images: [
      'https://images.pexels.com/photos/9826015/pexels-photo-9826015.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/16730715/pexels-photo-16730715/free-photo-of-blurred-people-on-event-in-black-and-white.jpeg?auto=compress&cs=tinysrgb&w=400',
      'https://images.pexels.com/photos/4262010/pexels-photo-4262010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/2608517/pexels-photo-2608517.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/587741/pexels-photo-587741.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    ],
    date: '2023-07-15',
    location: 'Event Location 2',
    time: '2:00 PM',
    eventPurpose: 'Event Purpose 2',
    eventTheme: 'Event Theme 2',
    sponsorshipsAndPartnerships: 'Sponsorships and Partnerships 2',
    volunteerCoordination: 'Volunteer Coordination 2',
    publicityAndPromotions: 'Publicity and Promotions 2',
    fundraisingActivities: 'Fundraising Activities 2',
    eventProgram: 'Event Program 2',
    eventDescription:
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Commodo ullamcorper a lacus vestibulum sed. Nunc pulvinar sapien et ligula ullamcorper malesuada. Nisi scelerisque eu ultrices vitae auctor eu augue ut lectus. Laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean. Placerat vestibulum lectus mauris ultrices. Pharetra vel turpis nunc eget lorem dolor sed. Etiam non quam lacus suspendisse faucibus interdum posuere lorem. Ante in nibh mauris cursus mattis molestie a iaculis. Suspendisse faucibus interdum posuere lorem. Interdum consectetur libero id faucibus nisl tincidunt eget. Mattis aliquam faucibus purus in massa tempor nec feugiat nisl. Eget nulla facilisi etiam dignissim. Maecenas sed enim ut sem viverra aliquet eget sit. Eget mauris pharetra et ultrices neque ornare aenean euismod elementum. Enim sit amet venenatis urna cursus eget.

Cursus mattis molestie a iaculis. Et odio pellentesque diam volutpat. Arcu felis bibendum ut tristique et egestas quis ipsum suspendisse. Ac feugiat sed lectus vestibulum mattis. Quam lacus suspendisse faucibus interdum. Lacus vel facilisis volutpat est velit egestas dui id ornare. Ullamcorper malesuada proin libero nunc consequat. Laoreet sit amet cursus sit. Nisl purus in mollis nunc sed id semper risus in. Velit aliquet sagittis id consectetur purus. Lacinia quis vel eros donec ac odio tempor orci dapibus.

Elit pellentesque habitant morbi tristique senectus et. Parturient montes nascetur ridiculus mus mauris. Risus viverra adipiscing at in. Tincidunt id aliquet risus feugiat in ante. Id ornare arcu odio ut. Nunc vel risus commodo viverra. Sodales neque sodales ut etiam sit. Sodales ut eu sem integer vitae. Risus pretium quam vulputate dignissim suspendisse in est. Integer quis auctor elit sed vulputate. Mattis pellentesque id nibh tortor id aliquet lectus proin. Ornare arcu dui vivamus arcu felis. Sit amet purus gravida quis blandit turpis. Ullamcorper sit amet risus nullam eget felis eget nunc.

Nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque. Massa vitae tortor condimentum lacinia quis vel. Nam libero justo laoreet sit. Vel fringilla est ullamcorper eget. Luctus venenatis lectus magna fringilla urna porttitor. Malesuada proin libero nunc consequat. Purus non enim praesent elementum. Morbi tempus iaculis urna id volutpat lacus laoreet non. Sed id semper risus in hendrerit gravida rutrum quisque non. Id velit ut tortor pretium viverra suspendisse potenti nullam. Habitasse platea dictumst quisque sagittis purus. Nibh cras pulvinar mattis nunc sed blandit libero volutpat sed. Sed velit dignissim sodales ut eu sem integer vitae justo. Tortor at auctor urna nunc id cursus metus. Orci sagittis eu volutpat odio facilisis mauris sit amet. Aliquam vestibulum morbi blandit cursus risus at ultrices mi. Tristique magna sit amet purus gravida quis blandit. Condimentum vitae sapien pellentesque habitant morbi tristique senectus et.

Amet dictum sit amet justo. Tristique senectus et netus et malesuada. Consectetur a erat nam at lectus. Sagittis id consectetur purus ut faucibus pulvinar elementum. Eget mi proin sed libero. Ac felis donec et odio pellentesque. Mattis aliquam faucibus purus in massa tempor. Felis imperdiet proin fermentum leo vel orci porta non. Vulputate odio ut enim blandit. Turpis in eu mi bibendum neque egestas congue quisque egestas.''',
  ),
  OrganizationDonation(
    images: [
      'https://images.pexels.com/photos/9826015/pexels-photo-9826015.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/16730715/pexels-photo-16730715/free-photo-of-blurred-people-on-event-in-black-and-white.jpeg?auto=compress&cs=tinysrgb&w=400',
      'https://images.pexels.com/photos/2608517/pexels-photo-2608517.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/587741/pexels-photo-587741.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/4262010/pexels-photo-4262010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ],
    date: '2023-07-18',
    location: 'Event Location 3',
    time: '4:00 PM',
    eventPurpose: 'Event Purpose 3',
    eventTheme: 'Event Theme 3',
    sponsorshipsAndPartnerships: 'Sponsorships and Partnerships 3',
    volunteerCoordination: 'Volunteer Coordination 3',
    publicityAndPromotions: 'Publicity and Promotions 3',
    fundraisingActivities: 'Fundraising Activities 3',
    eventProgram: 'Event Program 3',
    eventDescription:
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Commodo ullamcorper a lacus vestibulum sed. Nunc pulvinar sapien et ligula ullamcorper malesuada. Nisi scelerisque eu ultrices vitae auctor eu augue ut lectus. Laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean. Placerat vestibulum lectus mauris ultrices. Pharetra vel turpis nunc eget lorem dolor sed. Etiam non quam lacus suspendisse faucibus interdum posuere lorem. Ante in nibh mauris cursus mattis molestie a iaculis. Suspendisse faucibus interdum posuere lorem. Interdum consectetur libero id faucibus nisl tincidunt eget. Mattis aliquam faucibus purus in massa tempor nec feugiat nisl. Eget nulla facilisi etiam dignissim. Maecenas sed enim ut sem viverra aliquet eget sit. Eget mauris pharetra et ultrices neque ornare aenean euismod elementum. Enim sit amet venenatis urna cursus eget.

Cursus mattis molestie a iaculis. Et odio pellentesque diam volutpat. Arcu felis bibendum ut tristique et egestas quis ipsum suspendisse. Ac feugiat sed lectus vestibulum mattis. Quam lacus suspendisse faucibus interdum. Lacus vel facilisis volutpat est velit egestas dui id ornare. Ullamcorper malesuada proin libero nunc consequat. Laoreet sit amet cursus sit. Nisl purus in mollis nunc sed id semper risus in. Velit aliquet sagittis id consectetur purus. Lacinia quis vel eros donec ac odio tempor orci dapibus.

Elit pellentesque habitant morbi tristique senectus et. Parturient montes nascetur ridiculus mus mauris. Risus viverra adipiscing at in. Tincidunt id aliquet risus feugiat in ante. Id ornare arcu odio ut. Nunc vel risus commodo viverra. Sodales neque sodales ut etiam sit. Sodales ut eu sem integer vitae. Risus pretium quam vulputate dignissim suspendisse in est. Integer quis auctor elit sed vulputate. Mattis pellentesque id nibh tortor id aliquet lectus proin. Ornare arcu dui vivamus arcu felis. Sit amet purus gravida quis blandit turpis. Ullamcorper sit amet risus nullam eget felis eget nunc.

Nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque. Massa vitae tortor condimentum lacinia quis vel. Nam libero justo laoreet sit. Vel fringilla est ullamcorper eget. Luctus venenatis lectus magna fringilla urna porttitor. Malesuada proin libero nunc consequat. Purus non enim praesent elementum. Morbi tempus iaculis urna id volutpat lacus laoreet non. Sed id semper risus in hendrerit gravida rutrum quisque non. Id velit ut tortor pretium viverra suspendisse potenti nullam. Habitasse platea dictumst quisque sagittis purus. Nibh cras pulvinar mattis nunc sed blandit libero volutpat sed. Sed velit dignissim sodales ut eu sem integer vitae justo. Tortor at auctor urna nunc id cursus metus. Orci sagittis eu volutpat odio facilisis mauris sit amet. Aliquam vestibulum morbi blandit cursus risus at ultrices mi. Tristique magna sit amet purus gravida quis blandit. Condimentum vitae sapien pellentesque habitant morbi tristique senectus et.

Amet dictum sit amet justo. Tristique senectus et netus et malesuada. Consectetur a erat nam at lectus. Sagittis id consectetur purus ut faucibus pulvinar elementum. Eget mi proin sed libero. Ac felis donec et odio pellentesque. Mattis aliquam faucibus purus in massa tempor. Felis imperdiet proin fermentum leo vel orci porta non. Vulputate odio ut enim blandit. Turpis in eu mi bibendum neque egestas congue quisque egestas.''',
  ),
  OrganizationDonation(
    images: [
      'https://images.pexels.com/photos/2608517/pexels-photo-2608517.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/587741/pexels-photo-587741.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/9826015/pexels-photo-9826015.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/16730715/pexels-photo-16730715/free-photo-of-blurred-people-on-event-in-black-and-white.jpeg?auto=compress&cs=tinysrgb&w=400',
      'https://images.pexels.com/photos/4262010/pexels-photo-4262010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ],
    date: '2023-07-22',
    location: 'Event Location 4',
    time: '6:00 PM',
    eventPurpose: 'Event Purpose 4',
    eventTheme: 'Event Theme 4',
    sponsorshipsAndPartnerships: 'Sponsorships and Partnerships 4',
    volunteerCoordination: 'Volunteer Coordination 4',
    publicityAndPromotions: 'Publicity and Promotions 4',
    fundraisingActivities: 'Fundraising Activities 4',
    eventProgram: 'Event Program 4',
    eventDescription:
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Commodo ullamcorper a lacus vestibulum sed. Nunc pulvinar sapien et ligula ullamcorper malesuada. Nisi scelerisque eu ultrices vitae auctor eu augue ut lectus. Laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean. Placerat vestibulum lectus mauris ultrices. Pharetra vel turpis nunc eget lorem dolor sed. Etiam non quam lacus suspendisse faucibus interdum posuere lorem. Ante in nibh mauris cursus mattis molestie a iaculis. Suspendisse faucibus interdum posuere lorem. Interdum consectetur libero id faucibus nisl tincidunt eget. Mattis aliquam faucibus purus in massa tempor nec feugiat nisl. Eget nulla facilisi etiam dignissim. Maecenas sed enim ut sem viverra aliquet eget sit. Eget mauris pharetra et ultrices neque ornare aenean euismod elementum. Enim sit amet venenatis urna cursus eget.

Cursus mattis molestie a iaculis. Et odio pellentesque diam volutpat. Arcu felis bibendum ut tristique et egestas quis ipsum suspendisse. Ac feugiat sed lectus vestibulum mattis. Quam lacus suspendisse faucibus interdum. Lacus vel facilisis volutpat est velit egestas dui id ornare. Ullamcorper malesuada proin libero nunc consequat. Laoreet sit amet cursus sit. Nisl purus in mollis nunc sed id semper risus in. Velit aliquet sagittis id consectetur purus. Lacinia quis vel eros donec ac odio tempor orci dapibus.

Elit pellentesque habitant morbi tristique senectus et. Parturient montes nascetur ridiculus mus mauris. Risus viverra adipiscing at in. Tincidunt id aliquet risus feugiat in ante. Id ornare arcu odio ut. Nunc vel risus commodo viverra. Sodales neque sodales ut etiam sit. Sodales ut eu sem integer vitae. Risus pretium quam vulputate dignissim suspendisse in est. Integer quis auctor elit sed vulputate. Mattis pellentesque id nibh tortor id aliquet lectus proin. Ornare arcu dui vivamus arcu felis. Sit amet purus gravida quis blandit turpis. Ullamcorper sit amet risus nullam eget felis eget nunc.

Nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque. Massa vitae tortor condimentum lacinia quis vel. Nam libero justo laoreet sit. Vel fringilla est ullamcorper eget. Luctus venenatis lectus magna fringilla urna porttitor. Malesuada proin libero nunc consequat. Purus non enim praesent elementum. Morbi tempus iaculis urna id volutpat lacus laoreet non. Sed id semper risus in hendrerit gravida rutrum quisque non. Id velit ut tortor pretium viverra suspendisse potenti nullam. Habitasse platea dictumst quisque sagittis purus. Nibh cras pulvinar mattis nunc sed blandit libero volutpat sed. Sed velit dignissim sodales ut eu sem integer vitae justo. Tortor at auctor urna nunc id cursus metus. Orci sagittis eu volutpat odio facilisis mauris sit amet. Aliquam vestibulum morbi blandit cursus risus at ultrices mi. Tristique magna sit amet purus gravida quis blandit. Condimentum vitae sapien pellentesque habitant morbi tristique senectus et.

Amet dictum sit amet justo. Tristique senectus et netus et malesuada. Consectetur a erat nam at lectus. Sagittis id consectetur purus ut faucibus pulvinar elementum. Eget mi proin sed libero. Ac felis donec et odio pellentesque. Mattis aliquam faucibus purus in massa tempor. Felis imperdiet proin fermentum leo vel orci porta non. Vulputate odio ut enim blandit. Turpis in eu mi bibendum neque egestas congue quisque egestas.''',
  ),
  OrganizationDonation(
    images: [
      'https://images.pexels.com/photos/9826015/pexels-photo-9826015.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/2608517/pexels-photo-2608517.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/587741/pexels-photo-587741.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'https://images.pexels.com/photos/16730715/pexels-photo-16730715/free-photo-of-blurred-people-on-event-in-black-and-white.jpeg?auto=compress&cs=tinysrgb&w=400',
      'https://images.pexels.com/photos/4262010/pexels-photo-4262010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
    ],
    date: '2023-07-25',
    location: 'Event Location 5',
    time: '8:00 PM',
    eventPurpose: 'Event Purpose 5',
    eventTheme: 'Event Theme 5',
    sponsorshipsAndPartnerships: 'Sponsorships and Partnerships 5',
    volunteerCoordination: 'Volunteer Coordination 5',
    publicityAndPromotions: 'Publicity and Promotions 5',
    fundraisingActivities: 'Fundraising Activities 5',
    eventProgram: 'Event Program 5',
    eventDescription:
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Commodo ullamcorper a lacus vestibulum sed. Nunc pulvinar sapien et ligula ullamcorper malesuada. Nisi scelerisque eu ultrices vitae auctor eu augue ut lectus. Laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean. Placerat vestibulum lectus mauris ultrices. Pharetra vel turpis nunc eget lorem dolor sed. Etiam non quam lacus suspendisse faucibus interdum posuere lorem. Ante in nibh mauris cursus mattis molestie a iaculis. Suspendisse faucibus interdum posuere lorem. Interdum consectetur libero id faucibus nisl tincidunt eget. Mattis aliquam faucibus purus in massa tempor nec feugiat nisl. Eget nulla facilisi etiam dignissim. Maecenas sed enim ut sem viverra aliquet eget sit. Eget mauris pharetra et ultrices neque ornare aenean euismod elementum. Enim sit amet venenatis urna cursus eget.

Cursus mattis molestie a iaculis. Et odio pellentesque diam volutpat. Arcu felis bibendum ut tristique et egestas quis ipsum suspendisse. Ac feugiat sed lectus vestibulum mattis. Quam lacus suspendisse faucibus interdum. Lacus vel facilisis volutpat est velit egestas dui id ornare. Ullamcorper malesuada proin libero nunc consequat. Laoreet sit amet cursus sit. Nisl purus in mollis nunc sed id semper risus in. Velit aliquet sagittis id consectetur purus. Lacinia quis vel eros donec ac odio tempor orci dapibus.

Elit pellentesque habitant morbi tristique senectus et. Parturient montes nascetur ridiculus mus mauris. Risus viverra adipiscing at in. Tincidunt id aliquet risus feugiat in ante. Id ornare arcu odio ut. Nunc vel risus commodo viverra. Sodales neque sodales ut etiam sit. Sodales ut eu sem integer vitae. Risus pretium quam vulputate dignissim suspendisse in est. Integer quis auctor elit sed vulputate. Mattis pellentesque id nibh tortor id aliquet lectus proin. Ornare arcu dui vivamus arcu felis. Sit amet purus gravida quis blandit turpis. Ullamcorper sit amet risus nullam eget felis eget nunc.

Nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque. Massa vitae tortor condimentum lacinia quis vel. Nam libero justo laoreet sit. Vel fringilla est ullamcorper eget. Luctus venenatis lectus magna fringilla urna porttitor. Malesuada proin libero nunc consequat. Purus non enim praesent elementum. Morbi tempus iaculis urna id volutpat lacus laoreet non. Sed id semper risus in hendrerit gravida rutrum quisque non. Id velit ut tortor pretium viverra suspendisse potenti nullam. Habitasse platea dictumst quisque sagittis purus. Nibh cras pulvinar mattis nunc sed blandit libero volutpat sed. Sed velit dignissim sodales ut eu sem integer vitae justo. Tortor at auctor urna nunc id cursus metus. Orci sagittis eu volutpat odio facilisis mauris sit amet. Aliquam vestibulum morbi blandit cursus risus at ultrices mi. Tristique magna sit amet purus gravida quis blandit. Condimentum vitae sapien pellentesque habitant morbi tristique senectus et.

Amet dictum sit amet justo. Tristique senectus et netus et malesuada. Consectetur a erat nam at lectus. Sagittis id consectetur purus ut faucibus pulvinar elementum. Eget mi proin sed libero. Ac felis donec et odio pellentesque. Mattis aliquam faucibus purus in massa tempor. Felis imperdiet proin fermentum leo vel orci porta non. Vulputate odio ut enim blandit. Turpis in eu mi bibendum neque egestas congue quisque egestas.''',
  ),
];

List<DonationRequest> testDonationRequests = [
  DonationRequest(
    id: '1',
    requesterId: 'user1',
    requestType: DonationType.Food,
    requestDate: DateTime.now(),
    requestMessage: 'Food donation',
    isAccepted: true,
  ),
  DonationRequest(
    id: '2',
    requesterId: 'user2',
    requestType: DonationType.Clothes,
    requestDate: DateTime.now(),
    requestMessage: 'Clothes donation',
    isAccepted: true,
  ),
  DonationRequest(
    id: '3',
    requesterId: 'user3',
    requestType: DonationType.Money,
    requestDate: DateTime.now(),
    requestMessage: 'Money donation',
    isAccepted: false,
  ),
  DonationRequest(
    id: '4',
    requesterId: 'user4',
    requestType: DonationType.Food,
    requestDate: DateTime.now(),
    requestMessage: 'Food donation',
    isAccepted: true,
  ),
  DonationRequest(
    id: '5',
    requesterId: 'user5',
    requestType: DonationType.Clothes,
    requestDate: DateTime.now(),
    requestMessage: 'Clothes donation',
    isAccepted: true,
  ),
  DonationRequest(
    id: '6',
    requesterId: 'user6',
    requestType: DonationType.Money,
    requestDate: DateTime.now(),
    requestMessage: 'Money donation',
    isAccepted: false,
  ),
  DonationRequest(
    id: '7',
    requesterId: 'user7',
    requestType: DonationType.Food,
    requestDate: DateTime.now(),
    requestMessage: 'Food donation',
    isAccepted: true,
  ),
];