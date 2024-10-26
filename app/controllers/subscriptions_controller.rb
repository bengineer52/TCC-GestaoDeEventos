class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subscription, only: %i[ destroy ]

  # POST /subscriptions or /subscriptions.json
  def create
    @subscription = current_user.subscriptions.create!(event_id: subscription_params[:event_id])
    @event = Event.find(subscription_params[:event_id])

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to @event, notice: "Subscription was successfully created." }
        format.json { render :show, status: :created, location: @subscription }
      else
        format.html { redirect_to @event, notice: "Subscription was not created." }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1 or /subscriptions/1.json
  def destroy
    @subscription.destroy!

    respond_to do |format|
      format.html { redirect_to @subscription.event, status: :see_other, notice: "Subscription was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = current_user.subscriptions.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subscription_params
      params.require(:subscription).permit(:event_id, :user_id)
    end
end
