class CommandsController < ApplicationController
  protect_from_forgery with: :null_session

  def wildsurge
    return render json: {}, status: 403 unless valid_slack_token?

    result = WildSurge.find_by_id(command_params[:text])

    render json: { text: result }, status: :created
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
