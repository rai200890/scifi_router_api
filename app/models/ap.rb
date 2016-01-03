class Ap < ActiveRecord::Base
  belongs_to :location
  belongs_to :ap_model
  belongs_to :ap_status
  belongs_to :control_region

  validates :name, presence: true, uniqueness: true

  scope :with_details, -> do
    includes(location:{floor:{building: :campus}})
               .includes(:ap_model)
               .includes(:ap_status)
               .includes(:control_region)
   end

  scope :floor_id, ->(floor_id) do
    joins(location: {floor: :building}).where(floors: {id: floor_id})
  end

end
