import 'dart:math';

import 'package:flutter/material.dart';

import '../../desktop_layout/main_app_bar.dart';
import '../../models/organization_donation_model.dart';

class MobileOrganizationDonationDetailsScreen extends StatelessWidget {
  final OrganizationDonation organizationDonation;

  const MobileOrganizationDonationDetailsScreen({
    Key? key,
    required this.organizationDonation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    organizationDonation.images[
                        Random().nextInt(organizationDonation.images.length)],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Event Purpose',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              organizationDonation.eventPurpose,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Event Theme',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              organizationDonation.eventTheme,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Date',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              organizationDonation.date,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Location',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              organizationDonation.location,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Time',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              organizationDonation.time,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Sponsorships and Partnerships',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              organizationDonation.sponsorshipsAndPartnerships,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Volunteer Coordination',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              organizationDonation.volunteerCoordination,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Publicity and Promotions',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              organizationDonation.publicityAndPromotions,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Fundraising Activities',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              organizationDonation.fundraisingActivities,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Event Program',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              organizationDonation.eventProgram,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Event Description',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              organizationDonation.eventDescription,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Event Images',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 16.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: organizationDonation.images
                  .map(
                    (image) => SizedBox(
                      width: 120.0,
                      height: 120.0,
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}