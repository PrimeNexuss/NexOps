class ApiController < ApplicationController
  before_action :authenticate_user!
  
  def documentation
    @api_endpoints = [
      {
        method: 'GET',
        path: '/api/v1/operations',
        description: 'List all operations for the authenticated user',
        parameters: [],
        response: 'Array of operation objects'
      },
      {
        method: 'GET',
        path: '/api/v1/operations/:id',
        description: 'Get a specific operation with details',
        parameters: ['id (path)'],
        response: 'Operation object with targets and findings'
      },
      {
        method: 'POST',
        path: '/api/v1/operations',
        description: 'Create a new operation',
        parameters: ['name', 'scope', 'start_date', 'end_date', 'status'],
        response: 'Created operation object'
      },
      {
        method: 'PATCH/PUT',
        path: '/api/v1/operations/:id',
        description: 'Update an existing operation',
        parameters: ['id (path)', 'name', 'scope', 'start_date', 'end_date', 'status'],
        response: 'Updated operation object'
      },
      {
        method: 'DELETE',
        path: '/api/v1/operations/:id',
        description: 'Delete an operation',
        parameters: ['id (path)'],
        response: '204 No Content'
      },
      {
        method: 'GET',
        path: '/api/v1/targets',
        description: 'List all targets for the authenticated user',
        parameters: [],
        response: 'Array of target objects'
      },
      {
        method: 'POST',
        path: '/api/v1/targets/:id/scan',
        description: 'Initiate a security scan on a target',
        parameters: ['id (path)'],
        response: 'Scan results'
      },
      {
        method: 'GET',
        path: '/api/v1/findings',
        description: 'List all findings for the authenticated user',
        parameters: [],
        response: 'Array of finding objects'
      },
      {
        method: 'PATCH',
        path: '/api/v1/findings/:id/verify',
        description: 'Mark a finding as verified',
        parameters: ['id (path)'],
        response: 'Updated finding object'
      },
      {
        method: 'GET',
        path: '/api/v1/reports',
        description: 'List all reports for the authenticated user',
        parameters: [],
        response: 'Array of report objects'
      },
      {
        method: 'GET',
        path: '/api/v1/notifications',
        description: 'List all notifications for the authenticated user',
        parameters: [],
        response: 'Array of notification objects'
      },
      {
        method: 'PATCH',
        path: '/api/v1/notifications/:id',
        description: 'Mark a notification as read',
        parameters: ['id (path)'],
        response: 'Updated notification object'
      },
      {
        method: 'PATCH',
        path: '/api/v1/notifications/mark_all_read',
        description: 'Mark all notifications as read',
        parameters: [],
        response: 'Success message'
      }
    ]
  end
end
