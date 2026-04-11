# NexOps Role-Based Access Control

## **Role Permissions Overview**

### **Admin - Full System Control**
**Permissions:** All 35 permissions available

#### **User & System Management**
- `manage_users` - Create, edit, delete users
- `manage_roles` - Create, edit, delete roles, modify permissions
- `view_audit_logs` - View all system activity logs
- `system_admin` - Database access, configuration management

#### **Operations Management**
- `read_operations` - View operations and status
- `create_operations` - Create new security operations
- `update_operations` - Edit operation details
- `delete_operations` - Remove operations
- `close_operations` - Complete and close operations

#### **Target Management**
- `read_targets` - View targets and configurations
- `create_targets` - Add new targets
- `update_targets` - Edit target settings
- `delete_targets` - Remove targets
- `scan_targets` - Execute security scans

#### **Findings Management**
- `read_findings` - View security findings
- `create_findings` - Document new findings
- `update_findings` - Edit finding details
- `delete_findings` - Remove findings
- `verify_findings` - Confirm and validate findings

#### **Reports Management**
- `read_reports` - View generated reports
- `create_reports` - Generate new reports
- `delete_reports` - Remove reports
- `export_reports` - Export data (PDF, CSV)

---

### **Analyst - Investigation & Analysis**
**Permissions:** 8 specific permissions

#### **Read Access**
- `read_operations` - View operations and status
- `read_targets` - View targets and configurations
- `read_findings` - View security findings
- `read_reports` - View generated reports

#### **Analysis Capabilities**
- `create_findings` - Document new findings
- `update_findings` - Edit finding details
- `verify_findings` - Confirm and validate findings
- `export_reports` - Export data for analysis

#### **Restrictions**
- Cannot create or modify operations
- Cannot modify targets
- Cannot manage users or roles
- Cannot access audit logs

---

### **Operator - Field Operations**
**Permissions:** 20 operational permissions

#### **Operations Management**
- `read_operations` - View operations and status
- `create_operations` - Create new security operations
- `update_operations` - Edit operation details
- `delete_operations` - Remove operations
- `close_operations` - Complete and close operations

#### **Target Management**
- `read_targets` - View targets and configurations
- `create_targets` - Add new targets
- `update_targets` - Edit target settings
- `delete_targets` - Remove targets
- `scan_targets` - Execute security scans

#### **Findings Management**
- `read_findings` - View security findings
- `create_findings` - Document new findings
- `update_findings` - Edit finding details
- `delete_findings` - Remove findings
- `verify_findings` - Confirm and validate findings

#### **Reports Management**
- `read_reports` - View generated reports
- `create_reports` - Generate new reports
- `delete_reports` - Remove reports
- `export_reports` - Export data (PDF, CSV)

#### **Restrictions**
- Cannot manage users or roles
- Cannot access audit logs
- Cannot perform system administration

---

### **Guest - Read-Only Access**
**Permissions:** 4 read-only permissions

#### **Read-Only Access**
- `read_operations` - View operations and status
- `read_targets` - View targets and configurations
- `read_findings` - View security findings
- `read_reports` - View generated reports

#### **Restrictions**
- Cannot create, update, or delete any content
- Cannot perform scans or operations
- Cannot manage users or roles
- Cannot access audit logs
- Cannot export data

---

## **Permission Matrix**

| Feature | Admin | Analyst | Operator | Guest |
|---------|-------|---------|----------|-------|
| **User Management** | `manage_users` | - | - | - |
| **Role Management** | `manage_roles` | - | - | - |
| **Audit Logs** | `view_audit_logs` | - | - | - |
| **System Admin** | `system_admin` | - | - | - |
| **Create Operations** | `create_operations` | - | `create_operations` | - |
| **Update Operations** | `update_operations` | - | `update_operations` | - |
| **Delete Operations** | `delete_operations` | - | `delete_operations` | - |
| **Close Operations** | `close_operations` | - | `close_operations` | - |
| **Create Targets** | `create_targets` | - | `create_targets` | - |
| **Update Targets** | `update_targets` | - | `update_targets` | - |
| **Delete Targets** | `delete_targets` | - | `delete_targets` | - |
| **Scan Targets** | `scan_targets` | - | `scan_targets` | - |
| **Create Findings** | `create_findings` | `create_findings` | `create_findings` | - |
| **Update Findings** | `update_findings` | `update_findings` | `update_findings` | - |
| **Delete Findings** | `delete_findings` | - | `delete_findings` | - |
| **Verify Findings** | `verify_findings` | `verify_findings` | `verify_findings` | - |
| **Create Reports** | `create_reports` | - | `create_reports` | - |
| **Delete Reports** | `delete_reports` | - | `delete_reports` | - |
| **Export Reports** | `export_reports` | `export_reports` | `export_reports` | - |

---

## **Real-World Use Cases**

### **Admin Use Case:**
- Onboard new security team members
- Configure system permissions
- Monitor compliance audit trails
- Manage system-wide settings
- Full system administration

### **Analyst Use Case:**
- Review security findings
- Verify critical vulnerabilities
- Generate threat intelligence reports
- Export data for external analysis
- Investigative work without operational responsibilities

### **Operator Use Case:**
- Conduct security assessments
- Manage target scanning
- Create and track operations
- Document findings and remediation
- Field operations and execution

### **Guest Use Case:**
- View security dashboards
- Read generated reports
- Monitor operation status
- Access public security information
- Stakeholder visibility without modification rights

---

## **Security Architecture Benefits**

### **Separation of Duties**
- Clear role boundaries prevent privilege escalation
- Different users handle different aspects of security operations
- Audit trail maintains accountability

### **Principle of Least Privilege**
- Each role has minimum required permissions
- Guest role provides safe read-only access
- Admin role reserved for system administration

### **Scalability**
- Easy to add new roles as organization grows
- Permissions can be customized per role
- Supports multi-team security operations

### **Compliance**
- Role-based access meets security standards
- Audit logging supports regulatory requirements
- Permission tracking for compliance reporting

---

## **Implementation Details**

### **Database Schema**
```sql
roles
- id, name, permissions (JSON), description

user_roles
- id, user_id, role_id, created_at, updated_at

users
- id, email, encrypted_password, created_at, updated_at
```

### **Permission Checking**
```ruby
# In controllers
current_user.has_permission?(:create_operations)

# In models
user.roles.each do |role|
  return true if role.has_permission?(:manage_users)
end
```

### **Default Role Assignment**
- New users default to "Guest" role
- Admin can upgrade users to appropriate roles
- Role changes logged in audit trail

---

*This document provides comprehensive role-based access control documentation for the NexOps Security Operations Platform.*
