class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]
  before_action :set_event, only: %i[ edit update destroy ]

  # GET /events or /events.json
  def index
    if params[:my_events].present?
      # Caso o parâmetro 'my_events' esteja presente, mostra apenas os eventos criados pelo usuário logado
      authenticate_user!
      @events = Event.where(user_id: current_user.id)
    elsif params[:subscribed].present?
      # Caso o parâmetro 'subscribed' esteja presente, mostra apenas os eventos inscritos pelo usuário logado
      authenticate_user!
      @events = Event.joins(:subscriptions).where(subscriptions: { user_id: current_user.id })
    else
      # Caso nenhum dos parâmetros acima esteja presente, mostra todos os eventos
      @events = Event
    end
    # Ordena os eventos filtrados baseado na data em que vão acontecer
    @events = @events.order(schedule: :asc).all
  end

  # GET /events/1 or /events/1.json
  def show
    # O 'preload' abaixo evita o problema de N+1 queries
    @event = Event.preload(:user).find(params[:id])
    @subscription = @event.find_subscription(current_user)
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = current_user.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Evento foi criado com sucesso." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Evento foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy!

    respond_to do |format|
      format.html { redirect_to events_path, status: :see_other, notice: "Evento foi deletado com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    def set_event
      @event = current_user.events.preload(:user).find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :schedule, :location, :description)
    end
end
