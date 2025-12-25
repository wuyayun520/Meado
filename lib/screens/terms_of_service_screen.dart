import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Service'),
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
              'Terms of Service',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              '1. Acceptance of Terms',
              'By accessing and using Meado, you accept and agree to be bound by the terms and provision of this agreement.',
            ),
            _buildSection(
              context,
              '2. Use License',
              'Permission is granted to temporarily download one copy of the materials on Meado for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license you may not:\n\n• Modify or copy the materials\n• Use the materials for any commercial purpose or for any public display\n• Attempt to decompile or reverse engineer any software contained on Meado\n• Remove any copyright or other proprietary notations from the materials',
            ),
            _buildSection(
              context,
              '3. User Account',
              'You are responsible for maintaining the confidentiality of your account and password. You agree to accept responsibility for all activities that occur under your account or password.',
            ),
            _buildSection(
              context,
              '4. User Content',
              'You retain all rights to any content you submit, post or display on or through Meado. By submitting, posting or displaying content on or through Meado, you grant us a worldwide, non-exclusive, royalty-free license to use, reproduce, modify, and distribute such content.',
            ),
            _buildSection(
              context,
              '5. Prohibited Uses',
              'You may not use Meado:\n\n• In any way that violates any applicable national or international law or regulation\n• To transmit, or procure the sending of, any advertising or promotional material\n• To impersonate or attempt to impersonate the company, a company employee, another user, or any other person or entity\n• In any way that infringes upon the rights of others',
            ),
            _buildSection(
              context,
              '6. Disclaimer',
              'The materials on Meado are provided on an "as is" basis. Meado makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties including without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights.',
            ),
            _buildSection(
              context,
              '7. Limitations',
              'In no event shall Meado or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use the materials on Meado.',
            ),
            _buildSection(
              context,
              '8. Revisions',
              'Meado may revise these terms of service at any time without notice. By using this app you are agreeing to be bound by the then current version of these terms of service.',
            ),
            _buildSection(
              context,
              '9. Governing Law',
              'These terms and conditions are governed by and construed in accordance with applicable laws. Any disputes relating to these terms and conditions will be subject to the exclusive jurisdiction of the courts.',
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

