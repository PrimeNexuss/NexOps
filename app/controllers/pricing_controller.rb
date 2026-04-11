class PricingController < ApplicationController
  def index
    @page_title = 'Pricing - NexOps Security Operations Platform'
    @breadcrumb = [
      { name: 'Home', path: root_path },
      { name: 'Pricing', path: pricing_path }
    ]
    
    @plans = [
      {
        name: 'Starter',
        price: 0,
        description: 'Perfect for individual security professionals and small teams',
        features: [
          'Up to 5 operations',
          'Up to 25 targets',
          'Basic finding management',
          'Standard reports',
          'Community support',
          '1 user account'
        ],
        limitations: [
          'Limited storage',
          'Basic analytics',
          'Email support only'
        ],
        recommended: 'Individual penetration testers',
        popular: false,
        color: '#10b981'
      },
      {
        name: 'Professional',
        price: 99,
        description: 'Ideal for growing security teams and consulting firms',
        features: [
          'Unlimited operations',
          'Unlimited targets',
          'Advanced finding management',
          'Custom reports',
          'Priority support',
          'API access',
          '5 user accounts',
          'Advanced analytics',
          'Team collaboration tools'
        ],
        limitations: [
          'Limited integrations',
          'No custom branding'
        ],
        recommended: 'Security consulting firms',
        popular: true,
        color: '#667eea'
      },
      {
        name: 'Enterprise',
        price: 299,
        description: 'Complete solution for large organizations and enterprises',
        features: [
          'Everything in Professional',
          'Unlimited storage',
          'Custom integrations',
          'White-label branding',
          'Dedicated support',
          'Unlimited users',
          'Advanced security features',
          'Compliance reporting',
          'SLA guarantee',
          'On-premise deployment option'
        ],
        limitations: [
          'None'
        ],
        recommended: 'Large enterprises',
        popular: false,
        color: '#764ba2'
      }
    ]
    
    @faq = [
      {
        question: 'What payment methods do you accept?',
        answer: 'We accept all major credit cards, PayPal, and wire transfers. Enterprise customers can also pay via invoice.'
      },
      {
        question: 'Can I change my plan anytime?',
        answer: 'Yes! You can upgrade or downgrade your plan at any time. Changes take effect at the next billing cycle.'
      },
      {
        question: 'Is there a free trial?',
        answer: 'Yes! All plans come with a 14-day free trial. No credit card required to start.'
      },
      {
        question: 'What kind of support do you offer?',
        answer: 'Starter plans include email support, Professional plans include priority email support, and Enterprise plans include dedicated phone and email support with 24/7 availability.'
      },
      {
        question: 'Can I cancel my subscription?',
        answer: 'Yes, you can cancel your subscription at any time. No cancellation fees apply.'
      },
      {
        question: 'Do you offer discounts?',
        answer: 'Yes! We offer 20% discount for annual billing and special pricing for educational institutions and non-profits.'
      }
    ]
  end
end
