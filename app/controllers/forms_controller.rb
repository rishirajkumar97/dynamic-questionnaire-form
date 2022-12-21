class FormsController < ApplicationController
  def index
    #TODO Add Logic for Displaying All forms
  end

  def parse_qn_and_ans(question, answers)
    answers_new = []
    next_qns = []

    # Base Condition to terminate Recursion
    if answers.blank?
      return nil, nil
    else
      answers.each do |answer|
        # Create New Question if it has new Question as a Child based on the answer
        next_qn = Question.new(answer_type: answer[:answer_type], additional_attributes: answer[:additional_attributes]) if answer[:answer_type].present?
        next_qns.push(next_qn)
        params = { value: answer[:value], question: question }
        # Assign Nnext Question if it has next_question available
        params[:next_question]= next_qn if next_qn.present?

        answers.push(Answer.new(params))
      end
      # Import the Next set of Sub Questions
      Question.import! next_qns
      # Import the List of Answers and then assign Current Question ID and Next Question ID
      Answer.import! answers

      # Recursivelly call parse_qn_and_ans for further questions
      answers.zip(next_qns).each do |answer_qn_pair|
        parse_qn_and_ans(answer_qn_pair[1], answer_qn_pair[0][:answers])
      end
    end
  end

  def create
    post_params = forms_post_params
    form = Form.create!(post_params.except(:questions_answers))
    questions = [] 
    post_params[:questions_answers].each |question|
      qn = Question.new(
        additional_attributes: question[:additional_attributes],
        answer_type: question[:answer_type],
      )
      questions.push(qn)
      question[:answers].each do |answer|
        next_qn = Question.new(answer_type: answer[:answer_type], 
        Answer.new(value: answer[:value], question: qn)
      end
    end

    Question.import 
    render json: , status: :created
    #TODO Create parsing of params and to return newly created Form JSON
  end

  def show
    #TODO Add Logic For Formatting and Rendering a single Form
  end

  def destroy
    # Return Head True / False Based on ID.
  end
end