require 'apartment/elevators/generic'

def non_restricted_paths
  [ENV['ACTIVE_ADMIN_SUBDOMAIN']]
end

class HeaderElevator < Apartment::Elevators::Generic
  def parse_tenant_name(request)
    if non_restricted_paths.any? { |path| request.host.split('.').first == path }
      'public'
    else
      headers = Hash[*request.env.select {|k,v| k.start_with? 'HTTP_'}
                              .collect {|k,v| [k.sub(/^HTTP_/, ''), v]}
                              .collect {|k,v| [k.split('_').collect(&:capitalize).join('-'), v]}
                              .sort
                              .flatten]
      
      return Apartment::Tenant.current if headers['X-Restaurant-Tenant-Id'].nil? && request.params['tenant_id'].nil?
      
      # example: look up some tenant from the db based on this request
      return headers['X-Restaurant-Tenant-Id'] if Account.find_by(subdomain: headers['X-Restaurant-Tenant-Id']).present?

      request.params['tenant_id'] if request.params['tenant_id'].present?
    end
  end
end
