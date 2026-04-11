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
| **Role-based Access Control** | Admin, Operator, Analyst, Guest roles | :heavy_check_mark: |
| **Granular Permissions** | Fine-grained access to system resources | :heavy_check_mark: |
| **Audit Logging** | Complete activity trail for compliance | :heavy_check_mark: |
| **Multi-factor Authentication** | Secure user authentication | :heavy_check_mark: |
| **Session Management** | Secure session handling | :heavy_check_mark: |

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

### Dashboard
![Dashboard](https://via.placeholder.com/800x400/1e293b/f1f5f9?text=Operations+Dashboard+with+Statistics+and+Metrics)

### Analytics
![Analytics](https://via.placeholder.com/800x400/1e293b/f1f5f9?text=Analytics+Dashboard+with+Charts+and+Trends)

### Reports
![Reports](https://via.placeholder.com/800x400/1e293b/f1f5f9?text=Professional+Security+Reports+with+PDF+Export)

</div>

## Installation

### Prerequisites

- **Ruby**: 3.3.8 or higher
- **Rails**: 8.1.2 or higher  
- **Database**: SQLite3 (development), PostgreSQL (production recommended)
- **Node.js**: For asset compilation
- **Git**: For version control

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
   - Fill in your details and accept terms

2. **Create your first operation**
   - Navigate to Operations
   - Click "New Operation"
   - Fill in operation details and save

3. **Add targets to your operation**
   - Go to your operation page
   - Click "Add Target"
   - Enter target information

4. **Run security scans**
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

## Deployment

### Heroku

1. **Install Heroku CLI**
   ```bash
   # Install Heroku CLI
   brew install heroku/brew/heroku
   ```

2. **Create Heroku app**
   ```bash
   heroku create nexops-app
   ```

3. **Set environment variables**
   ```bash
   heroku config:set SECRET_KEY_BASE=$(bin/rails secret)
   heroku config:set RAILS_ENV=production
   ```

4. **Deploy**
   ```bash
   git push heroku main
   heroku run rails db:migrate
   heroku run rails db:seed
   ```

### Docker

1. **Build Docker image**
   ```bash
   docker build -t nexops .
   ```

2. **Run container**
   ```bash
   docker run -p 3000:3000 -e DATABASE_URL=sqlite3:///app/db/production.sqlite3 nexops
   ```

### Production Considerations

- **Database**: Use PostgreSQL for production
- **Web Server**: Use Puma with proper configuration
- **SSL**: Enable HTTPS with SSL certificates
- **Backups**: Regular database backups
- **Monitoring**: Application performance monitoring
- **Logging**: Centralized log management
- **Security**: Regular security updates and patches

## Architecture

### Technology Stack

- **Backend**: Ruby on Rails 8.1.2
- **Database**: SQLite3 (dev), PostgreSQL (prod)
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

Operations
|-- Targets (1:N)  
|-- Findings (through Targets)
|-- Reports (1:N)

Targets
|-- Findings (1:N)
|-- Tools (1:N)

Findings
|-- Evidence (1:N)
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

**Built with :heart: by the security community**

[![GitHub stars](https://img.shields.io/github/stars/PrimeNexuss/NexOps?style=social)](https://github.com/PrimeNexuss/NexOps/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/PrimeNexuss/NexOps?style=social)](https://github.com/PrimeNexuss/NexOps/network)
[![GitHub issues](https://img.shields.io/github/issues/PrimeNexuss/NexOps?style=social)](https://github.com/PrimeNexuss/NexOps/issues)

</div>
