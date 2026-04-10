class SearchController < ApplicationController
  def index
    @query = params[:q]
    @search_type = params[:type] || 'global'
    @filters = params[:filters] || {}
    @results = []
    @recent_searches = current_user.search_queries.recent.limit(5)
    
    if @query.present?
      @results = SearchQuery.search(current_user, @query, @search_type, @filters)
    end
    
    respond_to do |format|
      format.html
      format.json { render json: { results: @results, total: @results.length } }
    end
  end
  
  def suggestions
    query = params[:q]
    suggestions = []
    
    if query.present? && query.length >= 2
      # Get operation suggestions
      operations = current_user.operations.where("name ILIKE ?", "%#{query}%").limit(3)
      suggestions += operations.map { |op| { type: 'operation', title: op.name, url: operation_path(op) } }
      
      # Get target suggestions
      targets = current_user.targets.where("host_name ILIKE ?", "%#{query}%").limit(3)
      suggestions += targets.map { |target| { type: 'target', title: target.host_name, url: target_path(target) } }
      
      # Get finding suggestions
      findings = current_user.findings.where("title ILIKE ?", "%#{query}%").limit(3)
      suggestions += findings.map { |finding| { type: 'finding', title: finding.title, url: finding_path(finding) } }
    end
    
    render json: { suggestions: suggestions.first(10) }
  end
end
