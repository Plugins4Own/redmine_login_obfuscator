module RedmineLoginObfuscator
  module Patches
    module AccountPatch

      def self.apply

        unless defined?(AccountController)
          return
        end

        if AccountController.included_modules.include?(InstanceMethods)

          return
        end

        AccountController.prepend InstanceMethods
      end

      module InstanceMethods

        def invalid_credentials
          possible_statuses = [401, 403]
          response.status = possible_statuses.sample   
          super                   
        end

        def password_authentication          
          super
        end
        
      end

    end
  end
end

RedmineLoginObfuscator::Patches::AccountPatch.apply