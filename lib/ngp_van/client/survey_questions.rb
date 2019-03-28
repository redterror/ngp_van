# frozen_string_literal: true

module NgpVan
  class Client
    module SurveyQuestions
      def survey_questions(params: {})
        get(path: 'surveyQuestions', params: params)
      end

      def survey_question(id:, params: {})
        verify_id(id)
        get(path: "surveyQuestions/#{id}", params: params)
      end
    end
  end
end
