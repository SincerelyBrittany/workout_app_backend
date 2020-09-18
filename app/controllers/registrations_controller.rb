class RegistrationsController < Devise::RegistrationsController
    respond_to :json
  
    def create
      begin 
            super
      rescue ActiveRecord::RecordInvalid => e
        render_resource(e.record)
      rescue ActiveRecord::RecordNotUnique => e
        err = OpenStruct.new(errors: (user: 'already Exists'))
        validation_error(err)
    #   build_resource(sign_up_params)
    #   resource.save
    #   render_resource(resource)
    end
  end
end 