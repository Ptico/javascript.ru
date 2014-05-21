require 'spec_helper'

describe QuizHandler do
  let(:instance) { described_class.new(data, session) }

  let(:quiz)           { create(:quiz)     }
  let(:question_one)   { create(:question) }
  let(:question_two)   { create(:question) }
  let(:question_three) { create(:question) }
  let(:data) do
    {
      quiz_id: quiz.id,
      answer: 'foo'
    }
  end

  before(:each) do
    quiz.questions << question_one
    quiz.questions << question_two
    quiz.questions << question_three
  end

  context 'when started' do
    before(:each) { data.delete(:answer) }

    let(:session) { Hash.new }

    describe '#next_question' do
      subject { instance.next_question }

      it 'returns first question' do
        expect(subject).to eql(question_one)
      end
    end

    describe '#finished?' do
      subject { instance.finished? }

      it 'negative' do
        expect(subject).to be(false)
      end
    end
  end

  context 'when continued' do
    let(:session) do
      {
        quiz: {
          quiz.id => {
            question: question_two.id
          }
        }
      }
    end

    describe '#next_question' do
      subject { instance.next_question }

      it 'returns next question' do
        expect(subject).to eql(question_three)
      end
    end

    describe '#finished?' do
      subject { instance.finished? }

      it 'negative' do
        expect(subject).to be(false)
      end
    end
  end

  context 'when finished' do
    let(:session) do
      {
        quiz: {
          quiz.id => {
            question: question_three.id
          }
        }
      }
    end

    describe '#next_question' do
      subject { instance.next_question }

      it 'returns nil' do
        expect(subject).to be(nil)
      end
    end

    describe '#finished?' do
      subject { instance.finished? }

      it 'positive' do
        expect(subject).to be(true)
      end
    end

  end

end
