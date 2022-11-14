class Player
  NUM_LIVES = 3
  attr_accessor :name, :lives

  def initialize(name)
    @name = name
    @lives = NUM_LIVES
  end
end