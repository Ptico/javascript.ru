class QuizHandler
  ##
  # Next (unanswered) question
  #
  # Returns: {Question}
  #
  def next_question
    finished? ? nil : Question.find(question)
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
    !question
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

    populate_session
    process_answer
  end

  ##
  # Private: Create internal data structure
  #
  def populate_session
    session[:quiz]          = {} unless session.has_key?(:quiz)
    session[:quiz][quiz.id] = {} unless session[:quiz].has_key?(quiz.id)
    session_data[:answers]  = {} unless session_data[:answers]

    session_data[:question] = question_ids.first unless session_data.has_key?(:question)
  end

  ##
  # Private: Store answer to session and set new question id
  #
  def process_answer
    if data[:answer]
      session_data[:answers][question] = data[:answer]

      i = question_ids.rindex(question)
      session_data[:question] = question_ids[i + 1]
    end
  end

  ##
  # Returns: {Array} of quiz question ids
  #
  def question_ids
    @qids ||= quiz.questions.pluck(:id)
  end

  ##
  # Session storage for current quiz
  #
  # Returns: {Hash} saved quiz data
  #
  def session_data
    session[:quiz][quiz.id]
  end

  ##
  # Returns: {Integer} current question id
  #
  def question
    session_data[:question]
  end

end
