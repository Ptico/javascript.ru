class QuizHandler
  ##
  # Next (unanswered) question
  #
  # Returns: {Question}
  #
  def next_question

  end

  ##
  # Quiz results
  #
  def results

  end

  ##
  # Return true if all questions is finished
  #
  # Returns: {Boolean}
  #
  def finished?

  end

private

  attr_reader :quiz, :data, :session

  ##
  # Constructor: build handler
  #
  # Params:
  # - data    {Hash}  Request params (rails params hash)
  # - session {Class} Hash where user answers should be stored
  #
  def initialize(data, session)
    @data    = data
    @session = session
    @quiz    = Quiz.find(data[:quiz_id])
  end

end
