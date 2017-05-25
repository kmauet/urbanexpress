class AddResumeToApplicants < ActiveRecord::Migration[5.0]
  def change
    add_column :applicants, :resume, :string
  end
end
