class CommandsController < ApplicationController
  protect_from_forgery with: :null_session

  def random
    return render json: {}, status: 403 unless valid_slack_token?

    options = command_params[:text].split
    min = options[0].to_i
    max = options[1].to_i

    # If there is no max param, then we assume they only gave a max and no min.
    # In that case, min is 1
    if max.nil? || max == 0
      min = 1
      max = options[0].to_i
    end

    result = "Random between #{min}-#{max}: #{rand(min..max)}"
    render json: { text: result, response_type: "in_channel" }, status: :created
  end

  private

  def valid_slack_token?
    params[:token] == ENV["SLACK_SLASH_COMMAND_TOKEN"]
  end

  # Only allow a trusted parameter "white list" through.
  def command_params
    params.permit(:text, :token, :user_id, :response_url)
  end
end
