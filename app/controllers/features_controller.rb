class FeaturesController < ApplicationController
  def index
    @page_title = 'Features - NexOps Security Operations Platform'
    @breadcrumb = [
      { name: 'Home', path: root_path },
      { name: 'Features', path: features_path }
    ]
    
    @features = [
      {
        title: 'Operations Management',
        description: 'Organize and track security assessments with comprehensive project management. Set scope, assign team members, monitor progress, and maintain complete audit trails.',
        icon: '>',
        category: 'Core',
        benefits: ['Project-based workflow', 'Team collaboration', 'Progress tracking', 'Audit trails']
      },
      {
        title: 'Target Discovery',
        description: 'Efficiently manage and scan targets across your infrastructure. Track host information, scan results, vulnerability status, and maintain comprehensive inventory.',
        icon: '>',
        category: 'Discovery',
        benefits: ['Automated scanning', 'Asset inventory', 'Vulnerability tracking', 'Network mapping']
      },
      {
        title: 'Finding Management',
        description: 'Capture, analyze, and track security findings with severity classification, evidence attachment, and remediation tracking.',
        icon: '>',
        category: 'Analysis',
        benefits: ['Severity classification', 'Evidence management', 'Remediation tracking', 'Team collaboration']
      },
      {
        title: 'Analytics Dashboard',
        description: 'Gain insights into your security posture with comprehensive analytics and reporting. Track trends, identify patterns, and make data-driven decisions.',
        icon: '>',
        category: 'Intelligence',
        benefits: ['Real-time metrics', 'Trend analysis', 'Custom dashboards', 'Executive reporting']
      },
      {
        title: 'Professional Reports',
        description: 'Generate professional security reports with customizable templates. Export in multiple formats for stakeholder communication.',
        icon: '>',
        category: 'Reporting',
        benefits: ['PDF/CSV export', 'Custom templates', 'Executive summaries', 'Compliance reporting']
      },
      {
        title: 'Role-Based Access Control',
        description: 'Implement proper access controls with granular permissions. Ensure team members have appropriate access levels.',
        icon: '>',
        category: 'Security',
        benefits: ['Admin/Operator/Analyst roles', 'Granular permissions', 'Audit logging', 'Secure user management']
      },
      {
        title: 'Real-Time Notifications',
        description: 'Stay informed with real-time notifications for critical findings, system updates, and team activities.',
        icon: '>',
        category: 'Communication',
        benefits: ['Critical alerts', 'System updates', 'Team notifications', 'Email integration']
      },
      {
        title: 'API Integration',
        description: 'Comprehensive REST API for integration with external tools and custom workflows.',
        icon: '>',
        category: 'Integration',
        benefits: ['RESTful endpoints', 'Webhook support', 'Third-party integration', 'Custom workflows']
      }
    ]
  end
end
