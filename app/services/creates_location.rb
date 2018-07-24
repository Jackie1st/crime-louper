class CreatesLocation
  attr_reader :location_attrs, :errors, :location

  def initialize(location_attrs)
    @location_attrs = location_attrs
    @errors = []
  end

  def call
    @location = Location.new(location_attrs)

    if @location.invalid?
      @errors = @location.errors.full_messages
      return
    end

    @location.save
  end

  def success?
    errors.none?
  end

  private

  def show_tweets
    @location
  end
end