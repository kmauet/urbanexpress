class Applicant < ApplicationRecord
  mount_uploader :resume, ResumeUploader

  enum positions: ["cdl driver", "non-cdl driver", :cleaner, :manager, :sales_rep, :mechanic, "dispatch customer service"]
end
