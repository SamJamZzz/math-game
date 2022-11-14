class Question
  attr_accessor :num1, :num2, :answer

  def initialize(num1, num2)
    @num1 = num1
    @num2 = num2
    @answer = nil
  end

  def correct_answer
    @num1 + @num2
  end

  def answer(ans)
    @answer = ans
  end

  def answered_correctly?()
    self.correct_answer == @answer
  end

  def question
    "What does #{num1} plus #{num2} equal?"
  end
end