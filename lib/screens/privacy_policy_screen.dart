import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/Meado_allback.webp',
              width: 28,
              height: 28,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '1. Introduction',
              'Meado ("we", "our", or "us") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application.',
            ),
            _buildSection(
              context,
              '2. Information We Collect',
              'We may collect information about you in a variety of ways. The information we may collect via the app includes:\n\n• Personal Data: Name, email address, and other contact information\n• Usage Data: Information about how you access and use the app\n• Device Information: Device type, operating system, unique device identifiers\n• Content Data: Voice recordings, text content, and other materials you create or share through the app',
            ),
            _buildSection(
              context,
              '3. How We Use Your Information',
              'We use the information we collect to:\n\n• Provide, maintain, and improve our services\n• Process your transactions and send related information\n• Send you technical notices and support messages\n• Respond to your comments and questions\n• Monitor and analyze trends and usage\n• Personalize and improve your experience',
            ),
            _buildSection(
              context,
              '4. Information Sharing and Disclosure',
              'We do not sell, trade, or rent your personal information to third parties. We may share your information only in the following situations:\n\n• With your consent\n• To comply with legal obligations\n• To protect our rights and safety\n• With service providers who assist us in operating our app',
            ),
            _buildSection(
              context,
              '5. Data Security',
              'We implement appropriate technical and organizational security measures to protect your personal information. However, no method of transmission over the Internet or electronic storage is 100% secure, and we cannot guarantee absolute security.',
            ),
            _buildSection(
              context,
              '6. Your Rights',
              'You have the right to:\n\n• Access and receive a copy of your personal data\n• Rectify inaccurate personal data\n• Request deletion of your personal data\n• Object to processing of your personal data\n• Request restriction of processing your personal data\n• Data portability',
            ),
            _buildSection(
              context,
              '7. Data Retention',
              'We will retain your personal information only for as long as necessary to fulfill the purposes outlined in this Privacy Policy, unless a longer retention period is required or permitted by law.',
            ),
            _buildSection(
              context,
              '8. Children\'s Privacy',
              'Our app is not intended for children under the age of 13. We do not knowingly collect personal information from children under 13. If you are a parent or guardian and believe your child has provided us with personal information, please contact us.',
            ),
            _buildSection(
              context,
              '9. Changes to This Privacy Policy',
              'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "Last Updated" date.',
            ),
            _buildSection(
              context,
              '10. Contact Us',
              'If you have any questions about this Privacy Policy, please contact us at:\n\nEmail: privacy@meado.app\n\nWe will respond to your inquiry within a reasonable timeframe.',
            ),
            const SizedBox(height: 32),
            Text(
              'Last Updated: 2025',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.6,
                ),
          ),
        ],
      ),
    );
  }
}

