class ApplicationController < ActionController::API

# rescue ActiveRecord::RecordInvalid => invalid
#     render json: {message: invalid.record.errors.messages}, status: :unprocessable_entity

# rescue_from ActiveRecord::RecordNotFound
#     render json: {message: "item not found"}, status: :not_found
end
