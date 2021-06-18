require 'csv'

class QuestionImport prepend SimpleCommand
  def initialize(file)
    @file = file    
  end

  def call
    notice = import_data ? "Data Imported Successfully!" : "Oops! Something Went Wrong"
  end

  private


    attr_accessor :file

    def import_data
      questions = []
      CSV.foreach(file.path, headers: true) do |rec|
        rec_hash = rec.to_h.transform_keys do |key|
          key.downcase.parameterize.underscore.to_sym
        end
	      role = Role.find_or_create_by(name: rec_hash[:role])
	      mapping = Mapping.find_or_create_by(map_name: rec_hash[:mapping])
	      if role && mapping
	        questions << question_parameters(rec_hash, role.id, mapping.id)
	      end
      end
      return Question.upsert_all(questions, unique_by: [:content, :role_id, :mapping_id])
	  end

	def question_parameters rec_hash, role_id, mapping_id
	  rec_hash.except!(:role, :mapping, :pri)
    rec_hash[:question_type] = rec_hash.delete :type
    rec_hash[:content] = rec_hash.delete :question
    rec_hash[:role_id] = role_id
    rec_hash[:mapping_id] = mapping_id
    rec_hash[:created_at] = Time.now
    rec_hash[:updated_at] = Time.now
    rec_hash  
	end

end