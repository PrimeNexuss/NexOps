# NexOps - Security Operations Platform.

<div align="center">

![NexOps Logo](https://img.shields.io/badge/NexOps-Security%20Operations-blue?style=for-the-badge&logo=security)
![Rails](https://img.shields.io/badge/Rails-8.1.2-red?style=for-the-badge&logo=ruby-on-rails)
![Ruby](https://img.shields.io/badge/Ruby-3.3.8-red?style=for-the-badge&logo=ruby)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**Enterprise-Grade Security Operations Management Platform**

[Features](#-features) · [Installation](#-installation) · [Usage](#-usage) · [API](#-api) · [Contributing](#-contributing)

</div>

## Overview

NexOps is a comprehensive security operations platform designed for penetration testers, security analysts, and cybersecurity teams. It provides a complete suite of tools for managing security assessments, tracking findings, generating reports, and maintaining audit trails.

### Key Capabilities

- **Operations Management**: Organize and track security assessments
- **Target Discovery**: Manage and scan targets for vulnerabilities  
- **Finding Management**: Track, verify, and remediate security findings
- **Professional Reporting**: Generate comprehensive PDF and CSV reports
- **Real-time Notifications**: Stay updated with live alerts and notifications
- **Advanced Analytics**: Visualize security metrics and trends
- **Role-based Access Control**: Granular permissions for different user roles
- **Audit Trail**: Complete activity logging for compliance
- **RESTful API**: Full API for integrations and automation
- **Modern UI**: Beautiful, responsive dark theme interface

## Features

### Core Security Operations

| Feature | Description | Status |
|---------|-------------|--------|
| **Operations Management** | Create, manage, and track security assessments | :heavy_check_mark: |
| **Target Management** | Add, scan, and monitor targets across operations | :heavy_check_mark: |
| **Finding Management** | Track, verify, and remediate security findings | :heavy_check_mark: |
| **Evidence Collection** | Attach evidence and documentation to findings | :heavy_check_mark: |
| **Severity Classification** | Critical, High, Medium, Low severity levels | :heavy_check_mark: |

### Analytics & Reporting

| Feature | Description | Status |
|---------|-------------|--------|
| **Dashboard Analytics** | Real-time metrics and trend analysis | :heavy_check_mark: |
| **PDF Reports** | Professional formatted security reports | :heavy_check_mark: |
| **CSV Export** | Raw data export for analysis | :heavy_check_mark: |
| **Executive Summaries** | High-level overview for stakeholders | :heavy_check_mark: |
| **Trend Analysis** | Historical data and progress tracking | :heavy_check_mark: |

### User Management & Security

| Feature | Description | Status |
|---------|-------------|--------|
| **Role-based Access Control** | Admin, Operator, Analyst roles with signup selection | :heavy_check_mark: |
| **Demo Guest Access** | Pre-configured guest account for application demo | :heavy_check_mark: |
| **User Registration** | Self-service signup with Gmail email requirement | :heavy_check_mark: |
| **Email Validation** | Gmail-only email addresses for security | :heavy_check_mark: |
| **Granular Permissions** | Fine-grained access to system resources | :heavy_check_mark: |
| **Audit Logging** | Complete activity trail for compliance | :heavy_check_mark: |
| **Secure Authentication** | Devise-based authentication with session management | :heavy_check_mark: |
| **Role Assignment** | Automatic role assignment during registration | :heavy_check_mark: |

### Search & Discovery

| Feature | Description | Status |
|---------|-------------|--------|
| **Global Search** | Search across operations, targets, findings, reports | :heavy_check_mark: |
| **Advanced Filtering** | Filter by type, severity, dates, status | :heavy_check_mark: |
| **Autocomplete Suggestions** | Real-time search suggestions | :heavy_check_mark: |
| **Search History** | Track and reuse previous searches | :heavy_check_mark: |

### API & Integration

| Feature | Description | Status |
|---------|-------------|--------|
| **RESTful API v1** | Complete API for all operations | :heavy_check_mark: |
| **API Documentation** | Interactive API docs and examples | :heavy_check_mark: |
| **JSON Responses** | Standardized API response format | :heavy_check_mark: |
| **Authentication** | Session-based API authentication | :heavy_check_mark: |

## Screenshots

<div align="center">

### **Main Dashboard**
![NexOps Dashboard](https://via.placeholder.com/800x450/1e293b/f1f5f9?text=NexOps+Security+Operations+Dashboard)
*Real-time statistics, recent operations, critical findings, and quick actions*

### **Operations Management**
![Operations Management](https://via.placeholder.com/800x450/1e293b/f1f5f9?text=Operations+Management+Interface)
*Create, manage, and track security assessments with status monitoring*

### **Target Discovery & Scanning**
![Target Management](https://via.placeholder.com/800x450/1e293b/f1f5f9?text=Target+Discovery+and+Scanning)
*Add targets, configure scans, and monitor assessment progress*

### **Security Findings Dashboard**
![Findings Management](https://via.placeholder.com/800x450/1e293b/f1f5f9?text=Security+Findings+Dashboard)
*Track, verify, and remediate security findings with severity classification*

### **Professional Reports Generation**
![Reports Generation](https://via.placeholder.com/800x450/1e293b/f1f5f9?text=Professional+Security+Reports)
*Generate comprehensive PDF reports with executive summaries and detailed findings*

### **Analytics & Intelligence**
![Analytics Dashboard](https://via.placeholder.com/800x450/1e293b/f1f5f9?text=Analytics+and+Intelligence)
*Advanced analytics, trend analysis, and threat intelligence visualization*

### **User Management & Roles**
![User Management](https://via.placeholder.com/800x450/1e293b/f1f5f9?text=User+Management+and+Roles)
*Role-based access control with granular permissions and audit trails*

### **Global Search & Discovery**
![Search Interface](https://via.placeholder.com/800x450/1e293b/f1f5f9?text=Global+Search+and+Discovery)
*Search across operations, targets, findings, and reports with advanced filtering*

### **Real-time Notifications**
![Notifications System](https://via.placeholder.com/800x450/1e293b/f1f5f9?text=Real-time+Notifications)
*Live alerts, notification management, and activity monitoring*

### **Modern Authentication**
![Authentication Interface](https://via.placeholder.com/800x450/1e293b/f1f5f9?text=Modern+Authentication+Interface)
*Secure login/signup with modern UI and multi-factor authentication support*

</div>

### **Key UI Features Highlighted**

#### **Dark Theme Design**
- Professional security-focused dark interface
- High contrast for extended usage sessions
- Modern gradient effects and smooth animations

#### **Responsive Design**
- Mobile-optimized interface
- Tablet and desktop responsive layouts
- Touch-friendly interactions

#### **Interactive Elements**
- Real-time status updates
- Animated statistics cards
- Interactive charts and graphs
- Smooth transitions and hover effects

#### **Accessibility**
- WCAG 2.1 compliant design
- Keyboard navigation support
- Screen reader compatibility
- High contrast mode support

## Installation

### Prerequisites

- **Ruby**: 3.3.8 or higher
- **Rails**: 8.1.2 or higher  
- **Database**: PostgreSQL (development, test, and production)
- **Node.js**: For asset compilation
- **Git**: For version control
- **Bundler**: For dependency management

### Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/PrimeNexuss/NexOps.git
   cd NexOps
   ```

2. **Install Ruby dependencies**
   ```bash
   bundle install
   ```

3. **Setup database**
   ```bash
   bin/rails db:create
   bin/rails db:migrate
   bin/rails db:seed  # Creates default roles
   ```

4. **Start the server**
   ```bash
   bin/rails server
   ```

5. **Access the application**
   ```
   http://localhost:3000
   ```

### Environment Setup

1. **Copy environment files**
   ```bash
   cp config/database.example.yml config/database.yml
   cp config/secrets.example.yml config/secrets.yml
   ```

2. **Configure database** (for production)
   ```yaml
   # config/database.yml
   production:
     adapter: postgresql
     database: nexops_production
     username: <%= ENV['DATABASE_USERNAME'] %>
     password: <%= ENV['DATABASE_PASSWORD'] %>
   ```

3. **Set environment variables**
   ```bash
   export DATABASE_USERNAME="your_username"
   export DATABASE_PASSWORD="your_password"
   export SECRET_KEY_BASE="your_secret_key"
   ```

## Usage

### Getting Started

1. **Create your account**
   - Visit `http://localhost:3000`
   - Click "Sign Up"
   - Fill in your details (Gmail email required), select your role, and accept terms

2. **Choose your role during signup**
   - **Admin**: Full system access and user management
   - **Operator**: Complete operational access for security assessments
   - **Analyst**: Read access with analysis and finding management

3. **Demo Guest Access (No Signup Required)**
   - **Email**: `demoguest@gmail.com`
   - **Password**: Leave blank (passwordless access)
   - **Access**: Read-only view of all operations, targets, findings, and reports

4. **Create your first operation**
   - Navigate to Operations
   - Click "New Operation"
   - Fill in operation details and save

5. **Add targets to your operation**
   - Go to your operation page
   - Click "Add Target"
   - Enter target information

6. **Run security scans**
   - Navigate to a target
   - Click "Scan" to simulate security assessment
   - Review generated findings

5. **Generate reports**
   - Go to your operation
   - Click "Generate Report"
   - Download PDF or CSV format

### User Roles & Permissions

| Role | Capabilities |
|------|--------------|
| **Admin** | Full system access, user management, audit logs |
| **Operator** | Create/Manage operations, targets, findings |
| **Analyst** | View analytics, generate reports, verify findings |
| **Guest** | Read-only access to reports and dashboards |

### Key Workflows

#### Security Assessment Workflow
```
1. Create Operation
2. Add Targets
3. Scan Targets
4. Review Findings
5. Verify Critical Issues
6. Generate Report
7. Share with Stakeholders
```

#### Incident Response Workflow
```
1. Create Emergency Operation
2. Add Affected Targets
3. Scan for Compromises
4. Prioritize Critical Findings
5. Document Evidence
6. Generate Incident Report
7. Track Remediation
```

## API Documentation

### Authentication

All API endpoints require authentication. Use session cookies from logged-in user.

### Endpoints

#### Operations
```http
GET    /api/v1/operations     # List operations
GET    /api/v1/operations/:id # Show operation
POST   /api/v1/operations     # Create operation
PATCH  /api/v1/operations/:id # Update operation
DELETE /api/v1/operations/:id # Delete operation
```

#### Targets
```http
GET    /api/v1/targets        # List targets
GET    /api/v1/targets/:id    # Show target
POST   /api/v1/targets        # Create target
PATCH  /api/v1/targets/:id    # Update target
DELETE /api/v1/targets/:id    # Delete target
POST   /api/v1/targets/:id/scan # Scan target
```

#### Findings
```http
GET    /api/v1/findings       # List findings
GET    /api/v1/findings/:id   # Show finding
POST   /api/v1/findings       # Create finding
PATCH  /api/v1/findings/:id   # Update finding
DELETE /api/v1/findings/:id   # Delete finding
PATCH  /api/v1/findings/:id/verify # Verify finding
```

### Example Usage

```javascript
// Get all operations
const response = await fetch('/api/v1/operations', {
  method: 'GET',
  headers: {
    'Content-Type': 'application/json',
    'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
  },
  credentials: 'same-origin'
});

const data = await response.json();
console.log(data.operations);
```

For complete API documentation, visit `/api/docs` in your running application.

## Configuration

### Default Roles

The system creates these default roles on first run:

- **Admin**: Full system access
- **Operator**: Operations and targets management
- **Analyst**: Analytics and reporting
- **Guest**: Read-only access

### Permissions

Permissions are granular and can be customized:

- `read_operations`, `create_operations`, `update_operations`, `delete_operations`
- `read_targets`, `create_targets`, `update_targets`, `delete_targets`, `scan_targets`
- `read_findings`, `create_findings`, `update_findings`, `delete_findings`, `verify_findings`
- `read_reports`, `create_reports`, `delete_reports`, `export_reports`
- `manage_users`, `manage_roles`, `view_audit_logs`, `system_admin`

### Email Configuration

```ruby
# config/environments/production.rb
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address:              ENV['SMTP_ADDRESS'],
  port:                 ENV['SMTP_PORT'],
  domain:               ENV['SMTP_DOMAIN'],
  user_name:            ENV['SMTP_USERNAME'],
  password:             ENV['SMTP_PASSWORD'],
  authentication:       'plain',
  enable_starttls_auto: true
}
```

## Development

### Running Tests

```bash
# Run all tests
bin/rails test

# Run specific test file
bin/rails test test/controllers/operations_controller_test.rb

# Run with coverage
bin/rails test COVERAGE=true
```

### Console

```bash
# Interactive Rails console
bin/rails console

# Example console usage
irb(main):001:0> Operation.count
irb(main):002:0> User.create(name: "Test User", email: "test@example.com", password: "password123")
```

### Database Management

```bash
# Create new migration
bin/rails generate migration AddNewFieldToTable

# Run migrations
bin/rails db:migrate

# Rollback migration
bin/rails db:rollback

# Reset database
bin/rails db:reset
```

### Asset Management

```bash
# Precompile assets for production
bin/rails assets:precompile

# Clean assets
bin/rails assets:clobber
```

## Deployment Architecture

### Production Environment

NexOps is designed for enterprise deployment with the following architecture considerations:

#### Infrastructure Requirements
- **Application Server**: Puma (multi-threaded)
- **Web Server**: Nginx (reverse proxy)
- **Database**: PostgreSQL (production-grade)
- **Cache Layer**: Redis (session & application caching)
- **Background Processing**: Solid Queue (async operations)

#### Security Configuration
- **SSL/TLS**: Mandatory HTTPS with valid certificates
- **Firewall**: Restrictive network policies
- **Monitoring**: Application performance metrics
- **Logging**: Centralized log aggregation
- **Backup**: Automated database backups

#### Scalability Considerations
- **Horizontal Scaling**: Load balancer with multiple app instances
- **Database Scaling**: Read replicas for query optimization
- **CDN Integration**: Static asset delivery optimization
- **Container Orchestration**: Kubernetes/Docker support

### Container Orchestration

#### Kubernetes Deployment
```yaml
# Example Kubernetes configuration
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nexops
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nexops
  template:
    metadata:
      labels:
        app: nexops
    spec:
      containers:
      - name: nexops
        image: nexops:latest
        ports:
        - containerPort: 3000
        env:
        - name: RAILS_ENV
          value: "production"
        - name: DATABASE_URL
          valueFrom:
            secretKeyRef:
              name: nexops-secrets
              key: database-url
```

#### Environment Variables
```bash
# Production configuration
RAILS_ENV=production
SECRET_KEY_BASE=your_secure_key
DATABASE_URL=postgresql://user:pass@host:port/dbname
REDIS_URL=redis://host:port/db
RAILS_SERVE_STATIC_FILES=true
RAILS_LOG_LEVEL=info
```

### Monitoring & Observability

#### Application Metrics
- **Response Times**: Track API and page load performance
- **Error Rates**: Monitor application error frequency
- **Database Performance**: Query optimization and connection pooling
- **Memory Usage**: Track Ruby process memory consumption
- **Request Throughput**: Monitor concurrent user capacity

#### Security Monitoring
- **Authentication Events**: Login attempts and session management
- **Authorization Failures**: Permission denied events
- **Audit Trail**: Complete user activity logging
- **Security Scans**: Regular vulnerability assessments
- **Compliance Reporting**: Regulatory requirement tracking

## Architecture

### Technology Stack

- **Backend**: Ruby on Rails 8.1.2
- **Database**: PostgreSQL (dev, test, prod)
- **Frontend**: HTML5, CSS3, JavaScript (ES6+)
- **Authentication**: Devise
- **Authorization**: Pundit + Custom RBAC
- **PDF Generation**: Prawn
- **Asset Pipeline**: Propshaft
- **Web Server**: Puma

### System Architecture

```
NexOps Application
|
|-- Controllers (Request Handling)
|-- Models (Business Logic & Data)
|-- Views (User Interface)
|-- Helpers (View Logic)
|-- Jobs (Background Processing)
|-- Mailers (Email Notifications)
|-- API (RESTful Endpoints)
```

### Database Schema

```
Users
|-- Operations (1:N)
|-- Roles (N:M through UserRoles)
|-- Notifications (1:N)
|-- AuditLogs (1:N)
|-- SearchQueries (1:N)

Operations
|-- Targets (1:N)  
|-- Findings (through Targets)
|-- Reports (1:N)
|-- Credentials (1:N)

Targets
|-- Findings (1:N)
|-- Tools (1:N)
|-- Evidences (1:N)

Findings
|-- Evidence (1:N)

Reports
|-- Findings (through Operations)
```

## Contributing

We welcome contributions! Please follow these guidelines:

### Development Workflow

1. **Fork the repository**
2. **Create feature branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Make your changes**
4. **Add tests**
5. **Ensure all tests pass**
   ```bash
   bin/rails test
   ```
6. **Commit your changes**
   ```bash
   git commit -m "Add amazing feature"
   ```
7. **Push to branch**
   ```bash
   git push origin feature/amazing-feature
   ```
8. **Open Pull Request**

### Code Style

- Follow Ruby style guidelines
- Use meaningful variable names
- Add comments for complex logic
- Keep methods small and focused
- Write tests for new features

### Bug Reports

- Use GitHub Issues for bug reports
- Include steps to reproduce
- Add screenshots if applicable
- Include system information

## Security

### Reporting Security Issues

For security vulnerabilities, please email: security@nexops.com

### Security Features

- **Authentication**: Secure password hashing
- **Authorization**: Role-based access control
- **Audit Trail**: Complete activity logging
- **CSRF Protection**: Cross-site request forgery protection
- **SQL Injection**: Parameterized queries
- **XSS Protection**: Output sanitization
- **Secure Headers**: Security-focused HTTP headers

## Performance

### Optimization Tips

- **Database**: Use indexes for frequently queried columns
- **Caching**: Implement Redis caching for expensive operations
- **Background Jobs**: Use Active Job for long-running tasks
- **CDN**: Use CDN for static assets in production
- **Monitoring**: Track performance metrics

### Scalability

- **Horizontal Scaling**: Multiple app servers behind load balancer
- **Database Scaling**: Read replicas for read-heavy operations
- **Caching Layer**: Redis for session and application caching
- **Asset Delivery**: CDN for static assets

## Support

### Documentation

- **API Docs**: `/api/docs` in running application
- **User Guide**: See Usage section above
- **Developer Guide**: See Development section above

### Community

- **GitHub Issues**: For bug reports and feature requests
- **Discussions**: For general questions and discussions
- **Wiki**: For additional documentation

### Professional Support

For enterprise support, custom development, or consulting:
- **Email**: support@nexops.com
- **Website**: https://nexops.com

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### MIT License Summary

- **Commercial use**: Allowed
- **Modification**: Allowed  
- **Distribution**: Allowed
- **Private use**: Allowed
- **Liability**: No warranty provided
- **Attribution**: Must include copyright notice

## Acknowledgments

- **Ruby on Rails**: Excellent web framework
- **Devise**: Authentication solution
- **Prawn**: PDF generation library
- **Innomax Design**: UI design inspiration
- **Security Community**: For feedback and contributions


---

<div align="center">

## 🚀 Platform Status

### ✅ Production Ready
- **Fully Functional**: All features implemented and tested
- **Secure**: Role-based access control with audit logging
- **Scalable**: Modern Rails architecture with PostgreSQL support
- **Deployable**: Multiple deployment options available

### 🎯 Key Features
- **8 Major Modules**: Operations, Targets, Findings, Reports, Analytics, Users, Search, Notifications
- **4 User Roles**: Admin, Operator, Analyst, Guest with granular permissions
- **Modern UI**: Dark theme with responsive design
- **RESTful API**: Complete API for integrations
- **Professional Reports**: PDF generation with executive summaries

### 📊 Performance
- **Fast**: Optimized queries and caching
- **Reliable**: Comprehensive error handling
- **Secure**: CSRF protection, SQL injection prevention
- **Compliant**: Audit trails for regulatory requirements

---

**Built with :heart: by the security community**

[![GitHub stars](https://img.shields.io/github/stars/PrimeNexuss/NexOps?style=social)](https://github.com/PrimeNexuss/NexOps/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/PrimeNexuss/NexOps?style=social)](https://github.com/PrimeNexuss/NexOps/network)
[![GitHub issues](https://img.shields.io/github/issues/PrimeNexuss/NexOps?style=social)](https://github.com/PrimeNexuss/NexOps/issues)

**🎉 NexOps is ready for production deployment!**

</div>
