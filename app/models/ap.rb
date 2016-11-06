class Ap < ActiveRecord::Base
  belongs_to :location
  belongs_to :ap_model
  belongs_to :ap_status
  belongs_to :control_region

  validates :name, presence: true, uniqueness: true

  scope :with_details, -> do
    includes(location:{department: :campus})
               .includes(:ap_model)
               .includes(:ap_status)
               .includes(:control_region)
   end

  scope :department_id, ->(department_id) do
    joins(location: :department).where(departments: {id: department_id})
  end

end
