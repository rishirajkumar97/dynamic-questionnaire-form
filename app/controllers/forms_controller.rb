class FormsController < ApplicationController
  def index
    forms = Form.all

    # ToDO: Add Paginate via Paginary or any gem to automatic handling of Pagination and Link Generation
    render json: {
      items: ActiveModelSerializers::SerializableResource.new(Form.all).as_json,
      count: forms.count 
    }
  end

  # Method to Recursively parse the answers and the sub questions/answers for the given question
  # question - the current question
  # answers - the answers array of hashes which has sub branching questions and answers
  def parse_qn_and_ans(question, answers)
    answers_new = []
    next_qns = []

    # Base Condition to terminate Recursion if no answers is found end and return
    # Terminator Question i.e
    if answers.blank?
      return nil, nil
    else
      answers.each do |answer|
        # Create New Question if it has new Question as a Child based on the answer
        next_qn = Question.new(answer_type: answer.dig(:answer_type),
        additional_attributes: answer[:additional_attributes],
        form_id: question.form_id,
        name: answer[:name]
        ) if answer.dig(:answers).present?
        next_qns.push(next_qn) if next_qn.present?
        params = { value: answer[:value], question: question, form: question.form }
        # Assign Nnext Question if it has next_question available
        params[:next_question] = next_qn || nil

        answers_new.push(Answer.new(params))
      end
      # Further Enhance to Just use the next_qns and answers_new in a recursive array and import at the base case
      # To research further if such complex linkings work on multiple branching in activerecord-import gem
      # Import the Next set of Sub Questions
      Question.import! next_qns
      # Import the List of Answers and then assign Current Question ID and Next Question ID
      Answer.import! answers_new

      # Recursivelly call parse_qn_and_ans for further questions
      answers.zip(next_qns).each do |answer_qn_pair|
        parse_qn_and_ans(answer_qn_pair[1], answer_qn_pair[0].dig(:answers))
      end
    end
  end

  def create
    post_params = forms_post_params
    form = Form.create!(post_params.except(:questions_answers))
    questions = [] 
    question = Question.create!(answer_type: forms_post_params[:questions_answers][:answer_type],form_id: form.id, name:  forms_post_params[:questions_answers][:name]) 
    parse_qn_and_ans(question, forms_post_params[:questions_answers][:answers])

    # Serialize the Form to Have proper Rendering
    # Reload so that the referneces of the import are also taken into context for questions/answers
    render json: ActiveModelSerializers::SerializableResource.new(form.reload).as_json, status: :created
    #TODO Create parsing of params and to return newly created Form JSON
  end

  def show
    params.require(%i[id])
    render json: ActiveModelSerializers::SerializableResource.new(Form.find_by!(id: params[:id])).as_json
  end

  def destroy
    params.require(%i[id])
    form = form.find_by!(id: params[:id])
    form.destroy!
    head :no_content
  end
end